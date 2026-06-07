# Development Guide: nix-config

---

## Prerequisites

- **Nix** with flakes enabled (`nix CLI v2+`)
- **macOS** (aarch64-darwin or x86_64-darwin)
- **direnv** + **nix-direnv** (optional, for automatic dev shell)

## Environment Setup

### Automatic (direnv)

```bash
direnv allow
```

This sources the dev shell from [`devenv.nix`](../devenv.nix), providing:
- Node.js 24 + pnpm
- Python 3 with venv
- `nil` (Nix LSP), `alejandra` (formatter)
- `mcp-nixos`, `secretspec`, `bws`, `repomix`
- MCP servers: nixos, devenv, firecrawl, repomix, github

### Manual

```bash
nix develop
```

## Daily Workflow

### Validation Before Commit

```bash
# Fast check: eval, syntax, flake structure
nix flake check

# Build full system closure
nix build .#darwinConfigurations.mac16-10.system

# Dry-run to see what will change
darwin-rebuild switch --dry-run --flake .#mac16-10
```

### Applying Changes

```bash
darwin-rebuild switch --flake .#mac16-10
```

### Updating Lock File

```bash
# Update specific input
nix flake lock --update-input nixpkgs

# Update all inputs
nix flake update
```

## Code Conventions

### Module Signatures

```nix
# Entry point (every flake-module/<concern>/default.nix):
localFlake: { lib, config, self, inputs, ... }: {
  perSystem = { system, ... }: { ... };
  flake = {
    darwinModules.<name> = localFlake.moduleWithSystem (...);
    homeManagerModules.<name> = localFlake.moduleWithSystem (...);
  };
}

# Implementation (darwinModules/default.nix, homeManagerModules/default.nix):
perSystem: { lib, config, pkgs, ... }: {
  # Config here — perSystem.config.packages.<name> for cross-module refs
}
```

### Import Order

In `flake.nix`, modules must be imported via `importApply` **before** `mkHomeManagerOutputsMerge.nix`:

```nix
imports = [
  ./flake-modules/mkHomeManagerOutputsMerge.nix  # Must be first
  darwin-mod
  cli-tools-mod
  dev-sdks-mod
  desktop-apps-mod
];
```

### Adding a New Flake Module

1. Create `flake-modules/<concern>/default.nix` with curried 2-arg signature
2. Create `flake-modules/<concern>/homeManagerModules/default.nix` (or `darwinModules/`)
3. In `flake.nix`: add `importApply` call + add to `imports` list
4. In `flake.nix` → `home-manager.users.keith.imports`: add `self.homeManagerModules.<concern>`

### Adding a New External Package

1. Add flake input in `flake.nix` (with `inputs.nixpkgs.follows = "nixpkgs"` if it uses nixpkgs)
2. Add `nixpkgs.overlays` block in the darwinConfiguration module list (and HM if needed)
3. Use as `pkgs.<name>` — no parameter declarations required

See [`docs/decisions/mcp-nixos-overlay.md`](./decisions/mcp-nixos-overlay.md) for the full pattern.

### Formatting

```bash
alejandra .  # Format all nix files
```

The dev shell includes `alejandra` — it's available without installation.

## Adding New Applications

See [`adding-applications-guide.md`](./adding-applications-guide.md) for the full methodology:
1. Research (homebrew cask vs nixpkgs)
2. Categorize (system vs user, stable vs unstable)
3. Implement (add to appropriate module)
4. Validate (`nix flake check` + `darwin-rebuild dry-run`)

## Module Loading Chain Reference

```
flake.nix
  └─ importApply ./flake-modules/darwin
       ├─ darwinModules.default → system packages, homebrew, sops-nix, launchd
       └─ homeManagerModules.darwin → programs.mcp, copyApps
  └─ importApply ./flake-modules/cli-tools
       └─ homeManagerModules.cli-tools → CLI tools, colima, direnv, zsh, git, mise
  └─ importApply ./flake-modules/dev-sdks
       └─ homeManagerModules.dev-sdks → uv, apktool, scrcpy
  └─ importApply ./flake-modules/desktop-apps
       └─ homeManagerModules.desktop-apps → IINA, VSCodium, OpenCodeCommit
```

## Debugging

### Flake Evaluation Errors

```bash
# Show what nix evaluates
nix eval .#darwinConfigurations.mac16-10.config.system.stateVersion

# Trace evaluation (for infinite recursion)
nix eval --show-trace .#darwinConfigurations.mac16-10.pkgs.mcp-nixos.name
```

### Nix Daemon Issues

See [`docs/troubleshooting/nix-daemon-stale-socket.md`](./troubleshooting/nix-daemon-stale-socket.md)

### darwin-rebuild Missing After Reboot

See [`docs/troubleshooting/darwin-rebuild-disappears-after-reboot.md`](./troubleshooting/darwin-rebuild-disappears-after-reboot.md)

---

_Generated: 2026-06-06 | Scan Level: Deep_
