# Project Overview: nix-config

---

## Summary

`nix-config` is a macOS system configuration managed declaratively through Nix flakes. It uses `flake-parts` for modular composition and `nix-darwin` + `home-manager` for system and user environment management.

- **Type:** Monolith (single flake)
- **Primary Language:** Nix (flakes)
- **Architecture:** flake-parts modular composition (example-3-organizing-code pattern)
- **Target:** macOS aarch64-darwin, host `mac16-10`
- **Deploy Command:** `darwin-rebuild switch --flake .#mac16-10`

## Tech Stack

| Component | Version/Source | Role |
|-----------|---------------|------|
| Nix | flakes + nix-command | Package management |
| nixpkgs | nixpkgs-unstable | Package collection |
| flake-parts | hercules-ci/flake-parts | Flake modularization |
| nix-darwin | master | macOS system configuration |
| home-manager | master | User environment |
| sops-nix | Mic92/sops-nix | Secret management |
| mcp-nixos | utensils/mcp-nixos | Nix MCP server |
| devenv | devenv.sh | Dev environment |
| alejandra | nixpkgs | Nix formatter |
| nil | nixpkgs | Nix LSP |

## Quick Reference

- **Entry Point:** [`flake.nix`](../flake.nix)
- **Module Convention:** `localFlake: { lib, config, self, inputs, ... }: { ... }`
- **Implementation:** `perSystem: { lib, config, pkgs, ... }: { ... }`
- **External Packages:** `nixpkgs.overlays` pattern
- **Secrets:** sops-nix Age encryption + LaunchAgent env injection
- **Containers:** `services.colima` (declarative, launchd-managed)
- **Reference Patterns:** [`references/`](../references/) — repomix digests

## Project Structure

```
nix-config/
├── flake.nix                    # Entry point
├── devenv.nix                   # Dev environment (MCP servers)
├── flake-modules/               # Concern-based modules
│   ├── darwin/                  # macOS system config
│   ├── cli-tools/               # CLI tools + containers
│   ├── dev-sdks/                # Development SDKs
│   └── desktop-apps/           # Desktop applications
├── hosts/                       # Per-machine configs
├── secrets/                     # Encrypted secrets
├── docs/                        # Documentation
├── reference/                   # Config fixtures
├── references/                  # Pattern digests
└── plans/                       # Architectural plans
```

## Getting Started

```bash
# Validate
nix flake check
nix build .#darwinConfigurations.mac16-10.system

# Deploy (local)
darwin-rebuild switch --flake .#mac16-10

# Deploy (remote)
darwin-rebuild switch --flake .#mac16-10 --target-host keith@mac16-10
```

## See Also

- [Architecture](./architecture.md) — Module patterns, data flow, design principles
- [Source Tree Analysis](./source-tree-analysis.md) — Full annotated tree
- [Development Guide](./development-guide.md) — Daily workflow
- [Project Context (AI)](../_bmad-output/project-context.md) — AI agent rules

---

_Generated: 2026-06-06 | Scan Level: Deep_
