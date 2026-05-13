# Adding Applications Guide: nix-config

---

This guide walks through the full process of evaluating and adding applications to your nix flake — the same methodology used to integrate Docker, Sunshine, Android Studio, and 20+ other packages.

## Step 1: Package Availability Research

Your first question is always: **"Where does this app live?"** There are four possible answers.

### 1a. Check nixpkgs (Preferred Source)

Nixpkgs is always the first choice — it provides declarative, version-pinned, reproducible packages.

```bash
# Search nixpkgs for a package by name
nix --extra-experimental-features 'nix-command flakes' search nixpkgs <package-name>

# Example: verify a specific package exists
nix search nixpkgs moonlight-qt
```

> **⚠️ Point of emphasis:** `nix search` evaluates the ENTIRE package set for your system, which can take 2-3 minutes. The search terms are **space-separated AND** — `nix search nixpkgs docker compose` looks for packages matching BOTH `docker` AND `compose`, not either/or. Search one term at a time:
>
> ```bash
> nix search nixpkgs docker        # Find docker-related packages
> nix search nixpkgs docker-buildx # Find buildx specifically
> ```

**Alternative — faster lookup:** Use the online [NixOS Package Search](https://search.nixos.org/packages) for instant results without local evaluation.

### 1b. Check Homebrew (Fallback for macOS GUI Apps)

Many macOS-native GUI apps aren't in nixpkgs. Check brew:

```bash
# Search both formulae and casks
brew search <app-name>

# Casks are macOS GUI apps installed via brew
brew search --cask rectangle
```

> **Point of emphasis:** `brew search` searches both formulae (CLI packages) and casks (GUI apps) with a single result list. To distinguish, check the output — casks typically show as plain names (e.g., `rectangle`, `raycast`), while formulae have a `formulae/` prefix.

### 1c. Check Existing Host Installation

Scan what's already on your machine — you may find packages worth migrating into nix:

```bash
# Top-level Homebrew formulae (CLI tools you actively installed)
brew leaves

# All installed casks (GUI apps via brew)
brew list --cask

# What's in common binary paths
ls /usr/local/bin ~/.local/bin 2>/dev/null

# Quick which-check for expected tools
which jq fzf gh direnv tmux bat eza 2>/dev/null
```

> **Point of emphasis:** `brew leaves` shows only packages YOU explicitly installed, not dependencies pulled in automatically. This is your "intentional" package list — the best source for deciding what to migrate to nix.

### 1d. Check External Flakes (e.g., FlakeHub)

Some tools distribute as their own flake rather than through nixpkgs:

```bash
# Inspect what a remote flake provides
nix --extra-experimental-features 'nix-command flakes' flake show github:owner/repo

# Check metadata (description, inputs, last modified)
nix flake metadata github:owner/repo

# Check if it provides packages for YOUR system
nix flake show github:blue-build/cli --all-systems
```

> **⚠️ Point of emphasis:** When a flake only provides Linux packages (e.g., `aarch64-linux`, `x86_64-linux`), it won't work as a native macOS package. You'll need to keep those tools installed via brew or another method. Always check system availability before adding as a flake input.

---

## Step 2: Categorization — System vs User vs Cask

Once you've confirmed availability, decide WHERE each package belongs. The decision tree:

```
Package found in nixpkgs?
├── YES → Is it a system service/daemon that runs in the background?
│   ├── YES → environment.systemPackages (darwinModules)
│   └── NO  → Is it a GUI app launched by the user?
│       ├── YES → home.packages (homeManagerModules)
│       └── NO  → Is it a CLI tool used interactively?
│           ├── YES → home.packages (homeManagerModules)
│           └── NO  → Is it infrastructure paired with a system service?
│               └── YES → environment.systemPackages (darwinModules)
└── NO  → Is it a macOS GUI app?
    └── YES → homebrew.casks (darwinModules)
```

### Concrete Examples from This Project

| App | Where | Why |
|-----|-------|-----|
| **Docker CLI** | System | Pairs with Colima container runtime (system-level). Same layer = less friction. |
| **Sunshine** | System | Runs as a background streaming daemon. Not launched manually. |
| **Ollama** | System | LLM inference service — runs in the background. |
| **QEMU** | System | System-level virtualization. |
| **Android Studio** | User | Full IDE. Launched by the user, works on user's files. |
| **Moonlight** | User | GUI game streaming client. User-facing. |
| **WeChat** | User | User-facing messaging client. |
| **bat, eza, fd, delta** | User | Interactive CLI tools. Used in the user's terminal sessions. |
| **Better Display** | Brew Cask | macOS menu bar app. Not in nixpkgs. |
| **Raycast** | Brew Cask | macOS launcher. Not in nixpkgs. |
| **Rectangle Pro** | Brew Cask | macOS window manager (paid). Not in nixpkgs. |

> **Principle:** "Developer productivity is architecture." A CLI tool you use 50 times a day belongs in nix so it's always available after a rebuild. A system daemon must be in system packages so it starts at boot.

---

## Step 3: Implementation — Editing the Right Files

Three files control package placement:

| File | Controls | Syntax |
|------|----------|--------|
| [`flake-modules/darwin/darwinModules/default.nix`](../flake-modules/darwin/darwinModules/default.nix) | System packages + brew casks | `environment.systemPackages = with pkgs; [ ... ];` / `homebrew.casks = [ "..." ];` |
| [`flake-modules/darwin/homeManagerModules/default.nix`](../flake-modules/darwin/homeManagerModules/default.nix) | User packages | `home.packages = with pkgs; [ ... ];` |
| [`flake.nix`](../flake.nix) | External flake inputs | `inputs.<name>.url = "github:owner/repo";` |

### Adding a nixpkgs package:

```nix
# System package (darwinModules/default.nix)
environment.systemPackages = with pkgs; [
  # ... existing packages ...
  sunshine        # Game streaming daemon
];

# User package (homeManagerModules/default.nix)
home.packages = with pkgs; [
  # ... existing packages ...
  moonlight-qt    # Game streaming client
];
```

### Adding a brew cask:

```nix
# In darwinModules/default.nix
homebrew = {
  enable = true;
  casks = [
    # ... existing casks ...
    "raycast"
  ];
};
```

### Adding an external flake input:

```nix
# In flake.nix
inputs = {
  # ... existing inputs ...
  <short-name>.url = "github:owner/repo";
  <short-name>.inputs.nixpkgs.follows = "nixpkgs";  # Share nixpkgs
};
```

> **⚠️ Point of emphasis:** Always use `follows` when an external flake depends on nixpkgs. This prevents having two separate nixpkgs copies in your closure, which wastes disk space and build time. Example: `bluebuild-cli.inputs.nixpkgs.follows = "nixpkgs";`

---

## Step 4: Validation — Three-Layer Check

Never trust that a package name is correct. Always validate:

### Layer 1: Flake Structure Check

```bash
nix --extra-experimental-features 'nix-command flakes' flake check
```

This verifies: flake syntax, module imports, attribute structure. Pass here means your flake is structurally sound — but says NOTHING about whether individual packages exist.

### Layer 2: Package Resolution Check

```bash
# Verify system packages resolve
nix eval .#darwinConfigurations.mac16-10.config.environment.systemPackages \
  --apply 'pkgs: builtins.map (p: p.name or "unnamed") pkgs'

# Verify user (home-manager) packages resolve
nix eval .#darwinConfigurations.mac16-10.config.home-manager.users.keith.home.packages \
  --apply 'pkgs: builtins.map (p: p.name or "unnamed") pkgs'
```

This prints every resolved package name and version. A package that doesn't exist in nixpkgs will cause this to fail with an error. This is your **fast feedback loop** — much quicker than a full build.

> **Point of emphasis:** The `--apply` flag lets you inspect specific attributes of a deeply nested structure without evaluating the entire closure. Use it liberally during development.

### Layer 3: Full Build (Pre-Deploy Gate)

```bash
# Build the complete system closure
nix build .#darwinConfigurations.mac16-10.system
```

Only this step guarantees your config will actually deploy. `flake check` + `eval` can pass while `build` fails — for example, if a package's build dependencies are broken on your architecture.

> **⚠️ Critical:** Always run `nix build` before `darwin-rebuild switch`. Catching a build failure after deployment means your system is in an inconsistent state.

### Verifying Brew Casks:

```bash
# Confirm casks are correctly configured
nix eval .#darwinConfigurations.mac16-10.config.homebrew.casks \
  --apply 'casks: builtins.map (c: c.name) casks'
```

---

## Step 5: Edge Case Handling

### When a package isn't in nixpkgs OR brew:

Some apps (e.g., NearDrop, oMLX) simply don't exist in either ecosystem. Options:

1. **Manual install** — document in project notes that the user installs from the developer's website
2. **Create a nix derivation** — wrap the app yourself if the install is straightforward
3. **Use a brew tap** — some apps have third-party taps: `brew tap <user>/<repo> && brew install <formula>`

### When an external flake doesn't support your system:

As we discovered with `blue-build/cli` (only provides `aarch64-linux` and `x86_64-linux`), the flake input is still useful:
- It's available for Linux builds within the same flake
- It causes no harm (no darwin packages = nothing to conflict)
- The existing non-nix installation (e.g., `/usr/local/bin/bluebuild`) remains intact

### When migrating from brew to nix:

Before deploying, uninstall the brew version to avoid conflicts:
```bash
brew uninstall docker docker-buildx apktool uv scrcpy payload-dumper-go ollama qemu
```

Casks don't conflict — brew and nix manage them in separate directories.

---

## Quick Reference: Key Commands

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

_Generated: 2026-05-10 | Derived from system package integration workflow_
