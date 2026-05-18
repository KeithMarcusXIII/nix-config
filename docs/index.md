# Project Documentation Index: nix-config

---

## Project Overview

- **Type:** Monolith
- **Primary Language:** Nix (flakes)
- **Architecture:** flake-parts modular composition (example-3-organizing-code pattern)
- **Deployment Target:** macOS (nix-darwin), host `mac16-10`
- **Scan Level:** Deep

## Quick Reference

- **Tech Stack:** Nix flakes, flake-parts, nix-darwin, home-manager, nixpkgs-unstable
- **Entry Point:** [`../flake.nix`](../flake.nix)
- **Architecture Pattern:** `importApply`-based modular flake modules with curried two-argument signatures
- **Module Convention:** `localFlake: { lib, config, self, inputs, ... }: { ... }`
- **Deploy Command:** `darwin-rebuild switch --flake .#mac16-10 [--target-host keith@mac16-10]`

## Generated Documentation

- [Project Overview](./project-overview.md)
- [Architecture](./architecture.md) — Deep module pattern analysis with reference comparison
- [Source Tree Analysis](./source-tree-analysis.md) — Full annotated tree with reference comparison
- [Development Guide](./development-guide.md) — Daily workflow, validation, module patterns, code style
- [Flake + Direnv + nix-direnv Guide](./flake-direnv-guide.md) — Automatic dev shell setup with cached evaluation
- [Adding Applications Guide](./adding-applications-guide.md) — Full methodology: research, categorization, implementation, validation
- [Deployment Guide](./deployment-guide.md)

## Existing Documentation

- [README](../README.md) — Project title
- [Project Context (AI)](../_bmad-output/project-context.md) — AI agent rules (40 rules, 8 patterns)
- [Implementation Artifacts](../_bmad-output/implementation-artifacts/) — Sprint specs, epic traces, retros

## Reference Template

This project follows [`writing-flake-modules/example-3-organizing-code/`](../writing-flake-modules/example-3-organizing-code/) — the canonical flake-parts module pattern. See the [Architecture](./architecture.md) document for a detailed comparison between the reference and this implementation.

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
| [`flake-modules/darwin/default.nix`](../flake-modules/darwin/default.nix) | Core macOS module entry (curried 2-arg) |
| [`flake-modules/darwin/darwinModules/default.nix`](../flake-modules/darwin/darwinModules/default.nix) | System packages + homebrew |
| [`flake-modules/darwin/homeManagerModules/default.nix`](../flake-modules/darwin/homeManagerModules/default.nix) | User packages |
| [`hosts/mac16-10.nix`](../hosts/mac16-10.nix) | Host identity |

---

_Generated: 2026-05-10 | Scan Level: Deep_
