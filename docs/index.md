# Project Documentation Index: nix-config

---

## Project Overview

- **Type:** Monolith
- **Primary Language:** Nix (flakes)
- **Architecture:** flake-parts modular composition (example-3-organizing-code pattern)
- **Deployment Target:** macOS (nix-darwin), host `mac16-10`
- **Scan Level:** Deep (2026-06-06)

## Quick Reference

- **Tech Stack:** Nix flakes, flake-parts, nix-darwin (master), home-manager (master), nixpkgs-unstable, sops-nix
- **Entry Point:** [`../flake.nix`](../flake.nix)
- **Architecture Pattern:** `importApply`-based modular flake modules with curried two-argument signatures
- **Module Convention:** `localFlake: { lib, config, self, inputs, ... }: { ... }`
- **External Packages:** `nixpkgs.overlays` pattern (not `specialArgs` threading)
- **Deploy Command:** `darwin-rebuild switch --flake .#mac16-10 [--target-host keith@mac16-10]`

## Generated Documentation

- [Project Overview](./project-overview.md)
- [Architecture](./architecture.md) — Module patterns, data flow, design principles, key patterns
- [Source Tree Analysis](./source-tree-analysis.md) — Full annotated tree with module loading chain
- [Development Guide](./development-guide.md) — Daily workflow, validation, module patterns, code style
- [Deployment Guide](./deployment-guide.md)
- [Flake + Direnv + nix-direnv Guide](./flake-direnv-guide.md) — Automatic dev shell setup with cached evaluation
- [Adding Applications Guide](./adding-applications-guide.md) — Full methodology: research, categorization, implementation, validation

## Troubleshooting

- [Nix Daemon Stale Socket](./troubleshooting/nix-daemon-stale-socket.md) — Daemon runs but refuses connections after external volume disconnect
- [darwin-rebuild disappears after reboot](./troubleshooting/darwin-rebuild-disappears-after-reboot.md) — `darwin-rebuild` binary unavailable after every reboot

## Architecture Decisions

- [External Flake Packages via `nixpkgs.overlays`](./decisions/mcp-nixos-overlay.md) — ADR: overlays over specialArgs threading

## Existing Documentation

- [README](../README.md) — Project title
- [Project Context (AI)](../_bmad-output/project-context.md) — AI agent rules (8 key patterns, critical do/don't)
- [Implementation Artifacts](../_bmad-output/implementation-artifacts/) — Sprint specs, epic traces, retros

## Reference Patterns

- [Reference Digests](../references/) — Curated repomix digests from exemplary nix-darwin, home-manager, and flake-parts repositories:
  - `flake-parts-examples.md` — Textbook flake-parts patterns
  - `flake-parts-production.md` — Production-scale structure
  - `flake-parts-subflake.md` — Subflake composition with traits
  - `flake-parts-writing-custom-flake-modules.md` — Blog post explaining importApply, moduleWithSystem

## Getting Started

### Prerequisites

- Nix with flakes enabled (`nix CLI v2+`)
- macOS (aarch64-darwin or x86_64-darwin)

### Quick Start

```bash
# Clone
git clone <repo-url> nix-config && cd nix-config

# Validate
nix flake check
nix build .#darwinConfigurations.mac16-10.system

# Deploy (local)
darwin-rebuild switch --flake .#mac16-10

# Deploy (remote)
darwin-rebuild switch --flake .#mac16-10 --target-host keith@mac16-10
```

### Key Files to Know

| File | Purpose |
|------|---------|
| [`flake.nix`](../flake.nix) | Flake entry point, inputs, darwinConfigurations |
| [`devenv.nix`](../devenv.nix) | Dev environment: Node 24, Python venv, MCP servers |
| [`flake-modules/darwin/default.nix`](../flake-modules/darwin/default.nix) | Core macOS module entry (curried 2-arg) |
| [`flake-modules/darwin/darwinModules/default.nix`](../flake-modules/darwin/darwinModules/default.nix) | System packages, homebrew, sops-nix, launchd |
| [`flake-modules/cli-tools/homeManagerModules/default.nix`](../flake-modules/cli-tools/homeManagerModules/default.nix) | CLI tools, colima service, direnv, zsh, git, mise |
| [`hosts/mac16-10.nix`](../hosts/mac16-10.nix) | Host identity |
| [`_bmad-output/project-context.md`](../_bmad-output/project-context.md) | AI agent rules |

---

_Generated: 2026-06-06 | Scan Level: Deep_
