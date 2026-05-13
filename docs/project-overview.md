# Project Overview: nix-config

**macOS system configuration via nix-darwin + flake-parts**

---

## Executive Summary

`nix-config` is a declarative macOS system configuration repository built on the Nix ecosystem. It uses `flake-parts` for modular flake composition, `nix-darwin` for macOS system management, and `home-manager` for user-level configuration. The project follows the `example-3-organizing-code` pattern from `writing-flake-modules` for organizing flake modules, with concern-based module separation.

## Repository Structure

- **Type:** Monolith
- **Primary Language:** Nix
- **Architecture:** Concern-based flake-parts modules with host-specific configurations

## Tech Stack Summary

| Category | Technology | Version/Pin |
|----------|-----------|-------------|
| Build System | Nix (flakes) | nix CLI v2+ |
| Module System | flake-parts | github:hercules-ci/flake-parts |
| System Config | nix-darwin | github:nix-darwin/nix-darwin/master |
| User Config | home-manager | github:nix-community/home-manager |
| Package Source | nixpkgs | nixpkgs-unstable |
| Workspace DX | nix-direnv | via home-manager + .envrc |
| Deployment Target | macOS (aarch64-darwin) | Host: mac16-10 |

## Modules

The repository is organized into four concern-based flake modules:

| Module | Type | Content |
|--------|------|---------|
| [`darwin/`](../flake-modules/darwin) | System-level | git, colima, docker, macOS defaults, homebrew |
| [`cli-tools/`](../flake-modules/cli-tools) | User-level CLI | bat, btop, delta, eza, fd, direnv, nix-direnv, tmux |
| [`dev-sdks/`](../flake-modules/dev-sdks) | User-level SDKs | uv, apktool, payload-dumper-go, scrcpy |
| [`desktop-apps/`](../flake-modules/desktop-apps) | User-level GUI | iina, moonlight-qt, wechat |

## Systems

- `aarch64-darwin` (primary)
- `x86_64-darwin`
- `aarch64-linux`
- `x86_64-linux`

## Quick Reference

- **Entry Point:** [`flake.nix`](../flake.nix)
- **System Module:** [`flake-modules/darwin/default.nix`](../flake-modules/darwin/default.nix)
- **CLI Tools Module:** [`flake-modules/cli-tools/default.nix`](../flake-modules/cli-tools/default.nix)
- **Dev SDKs Module:** [`flake-modules/dev-sdks/default.nix`](../flake-modules/dev-sdks/default.nix)
- **Desktop Apps Module:** [`flake-modules/desktop-apps/default.nix`](../flake-modules/desktop-apps/default.nix)
- **Host Config:** [`hosts/mac16-10.nix`](../hosts/mac16-10.nix)
- **DevShell:** [`.envrc`](../.envrc) — `use flake` loads workspace tools via nix-direnv
- **Architecture Pattern:** flake-parts modular composition with `importApply`

## Documentation Index

- [Architecture](./architecture.md)
- [Source Tree Analysis](./source-tree-analysis.md)
- [Development Guide](./development-guide.md)
- [Deployment Guide](./deployment-guide.md)
- [Project Context (AI)](../_bmad-output/project-context.md)

---

_Generated: 2026-05-13 | Scan Level: Quick_
