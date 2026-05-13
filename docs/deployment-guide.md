# Deployment Guide: nix-config

---

## Infrastructure Requirements

- **Target OS:** macOS (nix-darwin)
- **Nix:** Installed with flakes enabled
- **SSH:** Key-based access from dev node to target (for remote deploy)
- **Current Host:** `mac16-10` (aarch64-darwin)

## Deployment Architecture

```
Dev Node (local)                    Target Host (mac16-10)
     │                                      │
     ├─ nix flake check                     │
     ├─ nix build .#darwinConfigurations     │
     │  .mac16-10.system                     │
     │                                      │
     └─── darwin-rebuild switch ────────────►
            --flake .#mac16-10               Applies system closure
            --target-host keith@mac16-10     Updates /etc/nix-darwin
                                             Activates new generation
```

## Deployment Pipeline

### Step 1: Pre-Deploy Validation

```bash
# Fast syntax/structure check
nix flake check

# Full system closure build (THE critical gate)
nix build .#darwinConfigurations.mac16-10.system
```

> **If `nix build` fails, the system closure is broken. Do not proceed to deploy.**

### Step 2: Dry-Run Preview

```bash
# See what would change without applying
darwin-rebuild switch --dry-run --flake .#mac16-10

# For remote host:
darwin-rebuild switch --dry-run --flake .#mac16-10 --target-host keith@mac16-10
```

### Step 3: Deploy

```bash
# Local deploy (running on target machine)
darwin-rebuild switch --flake .#mac16-10

# Remote SSH deploy
darwin-rebuild switch --flake .#mac16-10 --target-host keith@mac16-10
```

## Environment Configuration

### Nix Flake Settings

- **nixpkgs:** `nixpkgs-unstable` (pinned via `flake.lock`)
- **nix-darwin:** `master` branch (follows nixpkgs)
- **home-manager:** follows nixpkgs

### Host Configuration ([`hosts/mac16-10.nix`](../hosts/mac16-10.nix))

| Setting | Value |
|---------|-------|
| `system.stateVersion` | 5 |
| `system.primaryUser` | keith |
| `users.users.keith.home` | /Users/keith |

### Home Manager ([`homeManagerModules/default.nix`](../flake-modules/darwin/homeManagerModules/default.nix))

| Package | Type |
|---------|------|
| `iina` | Media player |
| `vscodium` | Code editor |

### System Packages ([`darwinModules/default.nix`](../flake-modules/darwin/darwinModules/default.nix))

| Package | Type |
|---------|------|
| `git` | Version control |
| `ripgrep` | Search |
| `wget` | Download |
| `tree` | Directory listing |
| `colima` | Container runtime |

### Homebrew Casks

| Cask | Type |
|------|------|
| `zen-browser` | Web browser |

## Rollback

```bash
# List available generations
darwin-rebuild --list-generations

# Rollback to previous generation
darwin-rebuild --rollback
```

## CI/CD

No CI/CD pipeline is currently configured. Deployment is manual via `darwin-rebuild switch`.

## Validation Checklist

- [ ] `nix flake check` passes (syntax, eval, flake structure)
- [ ] `nix build .#darwinConfigurations.mac16-10.system` succeeds (full closure builds)
- [ ] `darwin-rebuild switch --dry-run` shows expected changes
- [ ] `darwin-rebuild switch` completes without errors
- [ ] System functions correctly post-deploy

---

_Generated: 2026-05-10 | Scan Level: Quick_
