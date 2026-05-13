# Development Guide: nix-config

---

## Prerequisites

- **Nix** with flakes enabled (`nix CLI v2+`)
- **nix-darwin** (for deployment on macOS)
- **SSH access** to target host (for remote deployment)
- **macOS** (aarch64-darwin or x86_64-darwin) for local build

## Environment Setup

```bash
# Clone the repository
git clone <repo-url> nix-config
cd nix-config

# Enable flake support (if not already)
mkdir -p ~/.config/nix
echo 'experimental-features = nix-command flakes' >> ~/.config/nix/nix.conf

# Enter dev shell (or use direnv)
nix develop
# OR: direnv allow (if .envrc has 'use flake')
```

## Development Workflow

### 1. Make Changes

Edit files in `flake-modules/darwin/` or `hosts/`:

- System packages → [`flake-modules/darwin/darwinModules/default.nix`](../flake-modules/darwin/darwinModules/default.nix)
- User packages → [`flake-modules/darwin/homeManagerModules/default.nix`](../flake-modules/darwin/homeManagerModules/default.nix)
- Host identity → [`hosts/mac16-10.nix`](../hosts/mac16-10.nix)

### 2. Format

```bash
nix fmt
```

### 3. Validate (Pre-Commit)

```bash
# Step 1: Fast check — eval, syntax, flake structure
nix flake check

# Step 2: Comprehensive — build full system closure
nix build .#darwinConfigurations.mac16-10.system
```

> **⚠️ Critical:** `nix flake check` passing does NOT guarantee the system closure builds. Always run `nix build` of the darwinConfiguration before deploying.

### 4. Preview Changes

```bash
# Dry-run to see what would change (run on dev node)
darwin-rebuild switch --dry-run --flake .#mac16-10
```

### 5. Deploy

```bash
# Local deploy (if on target machine)
darwin-rebuild switch --flake .#mac16-10

# Remote SSH deploy
darwin-rebuild switch --flake .#mac16-10 --target-host keith@mac16-10
```

## Lockfile Management

```bash
# Update lock after changing inputs
nix flake lock

# Always commit flake.lock
git add flake.lock
```

> **Never hand-edit `flake.lock`.**

## Code Style

- **Formatting:** 2-space indent, no tabs. `{` on same line, `};` on own line.
- **File naming:** Entry points are `default.nix`. Packages match attr names.
- **Module signature:** Curried two-argument form — `localFlake: { lib, config, self, inputs, ... }: { ... }`
- **No `with pkgs;`** — declare deps explicitly in function args
- **`callPackage`**: always with empty override — `pkgs.callPackage ./path { }`
- **Comments:** `#` with space, above the code they describe. `# TODO:` for planned work.

## Module Patterns

### Adding a New Flake Module

1. Create directory: `flake-modules/<name>/`
2. Create entry: `flake-modules/<name>/default.nix` (curried 2-arg form)
3. Optional sub-modules: `darwinModules/default.nix`, `homeManagerModules/default.nix`
4. Import in [`flake.nix`](../flake.nix): `importApply ./flake-modules/<name> { inherit withSystem moduleWithSystem importApply; }`
5. Add to `imports` list

### Adding a New Host

1. Create `hosts/<hostname>.nix`
2. Add `darwinConfigurations.<hostname>` in [`flake.nix`](../flake.nix)
3. Ensure shared modules remain host-agnostic (use module options, not hardcoded names)

## Testing

```bash
# Run all checks
nix flake check

# Verify output structure
nix flake show

# Build specific configuration
nix build .#darwinConfigurations.mac16-10.system
```

## Adding Applications

For the complete methodology on discovering, evaluating, and adding applications to your nix flake — including package research (nixpkgs, brew, host scan, external flakes), categorization (system vs user vs cask), implementation patterns, and a three-layer validation check — see the dedicated guide:

→ **[Adding Applications Guide](./adding-applications-guide.md)**

### Quick Reference: Key Commands

| Task | Command |
|------|---------|
| Search nixpkgs | `nix search nixpkgs <term>` |
| Search brew | `brew search <term>` |
| List my brew packages | `brew leaves` |
| List my brew casks | `brew list --cask` |
| Inspect external flake | `nix flake show github:owner/repo` |
| Flake metadata | `nix flake metadata github:owner/repo` |
| Validate flake structure | `nix flake check` |
| Resolve system packages | `nix eval .#darwinConfigurations.<host>.config.environment.systemPackages ...` |
| Resolve user packages | `nix eval .#darwinConfigurations.<host>.config.home-manager.users.<user>.home.packages ...` |
| Full build check | `nix build .#darwinConfigurations.<host>.system` |
| Deploy | `darwin-rebuild switch --flake .#<host>` |

---

## Git Conventions

- **Branch naming:** kebab-case
- **Commits:** imperative mood
- **Pre-commit:** `nix fmt` → `nix flake check` → `nix build`
- **Always commit `flake.lock`**

---

_Generated: 2026-05-10 | Scan Level: Deep_
