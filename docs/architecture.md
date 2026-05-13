# Architecture: nix-config

---

## Executive Summary

`nix-config` follows the `flake-parts` modular architecture pattern, specifically the `example-3-organizing-code` approach from `writing-flake-modules`. The architecture separates concerns into:

1. **Flake entry point** ([`flake.nix`](../flake.nix)) — defines inputs, systems, and flake-level outputs
2. **Flake modules** ([`flake-modules/`](../flake-modules/)) — encapsulated, self-referencing modules with curried signatures
3. **Host configurations** ([`hosts/`](../hosts/)) — per-machine nix-darwin system modules

## Architecture Pattern

**Pattern:** `flake-parts` modular composition via `importApply` (example-3-organizing-code)

```
flake.nix (orchestrator)
  ├─ imports: [ flake-modules/darwin (via importApply) ]
  │    └─ flake.darwinModules.default (via moduleWithSystem)
  │
  ├─ imports: [ flake-modules/cli-tools (via importApply) ]
  │    └─ flake.homeManagerModules.cli-tools (via moduleWithSystem)
  │
  ├─ imports: [ flake-modules/dev-sdks (via importApply) ]
  │    └─ flake.homeManagerModules.dev-sdks (via moduleWithSystem)
  │
  ├─ imports: [ flake-modules/desktop-apps (via importApply) ]
  │    └─ flake.homeManagerModules.desktop-apps (via moduleWithSystem)
  │
  └─ consumed by darwinConfigurations.mac16-10
       ├─ self.darwinModules.default (system-level)
       ├─ self.homeManagerModules.cli-tools
       ├─ self.homeManagerModules.dev-sdks
       └─ self.homeManagerModules.desktop-apps
```

### Module Signature Convention (Curried Two-Argument Form)

Every flake module follows this signature, identical to the reference example:

```nix
# First argument: localFlake — the module's own flake context
# Provides: withSystem, moduleWithSystem, importApply
localFlake:

# Second argument: standard flake-parts module args
# self, inputs, etc. reference the FINAL USER'S flake, not the local module
{ lib, config, self, inputs, ... }:
{
  # perSystem: per-system derivations (packages, checks, devShells, apps)
  # flake: flake-level outputs (darwinModules, homeManagerModules)
}
```

### Critical Distinction: `localFlake` vs `self`

| Reference | Scope | Use Case |
|-----------|-------|----------|
| `localFlake.withSystem` | Module-internal evaluation | Building packages, running checks within the module |
| `localFlake.moduleWithSystem` | Wrapping sub-module outputs | Exposing `darwinModules`, `homeManagerModules` |
| `localFlake.importApply` | Loading sub-module files | Importing `./darwinModules`, `./homeManagerModules` |
| `self.darwinModules.default` | Final user flake output | Referencing the `darwin` module's darwin output from `flake.nix` |
| `self.homeManagerModules.cli-tools` | Final user flake output | Named HM output from `cli-tools` module |
| `self.homeManagerModules.dev-sdks` | Final user flake output | Named HM output from `dev-sdks` module |
| `self.homeManagerModules.desktop-apps` | Final user flake output | Named HM output from `desktop-apps` module |

**Why this matters:** In [`flake.nix`](../flake.nix), `self.darwinModules.default` refers to the output defined in [`flake-modules/darwin/default.nix`](../flake-modules/darwin/default.nix), while `self.homeManagerModules.cli-tools` (and `dev-sdks`, `desktop-apps`) each come from their respective flake modules. Named outputs replace the single `self.homeManagerModules.default` — each concern is now independently composable.

## Module Structure: Deep Dive

### Reference Example (`writing-flake-modules/example-3-organizing-code`)

```
flake-modules/foo/
├── default.nix              # Entry: curried 2-arg, perSystem packages + checks, flake outputs
├── pkgs/
│   └── foo.nix              # callPackage derivation ({ hello }: hello)
├── nixosModules/
│   └── default.nix          # NixOS systemd service using perSystem.config.packages.foo
└── homeManagerModules/
    └── default.nix          # HM user systemd service using perSystem.config.packages.foo
```

### This Project (`nix-config`)

```
flake-modules/
├── darwin/                      # 🍎 macOS system configuration
│   ├── default.nix              # Entry: curried 2-arg, perSystem checks, flake darwinModules.default
│   └── darwinModules/
│       └── default.nix          # System packages (git, colima) + homebrew + macOS defaults
├── cli-tools/                   # 🔧 User-level CLI tools
│   ├── default.nix              # Entry: curried 2-arg, exports homeManagerModules.cli-tools
│   └── homeManagerModules/
│       └── default.nix          # bat, btop, delta, eza, fd, direnv, nix-direnv, tmux
├── dev-sdks/                    # 📦 Development SDKs
│   ├── default.nix              # Entry: curried 2-arg, exports homeManagerModules.dev-sdks
│   └── homeManagerModules/
│       └── default.nix          # uv, apktool, payload-dumper-go, scrcpy
└── desktop-apps/                # 🖥️ GUI & specialized apps
    ├── default.nix              # Entry: curried 2-arg, exports homeManagerModules.desktop-apps
    └── homeManagerModules/
        └── default.nix          # iina, moonlight-qt, wechat
```

### Key Differences from Reference

| Aspect | Reference (`foo`) | This Project (`nix-config`) |
|--------|-------------------|-----------------------------|
| **System target** | NixOS (Linux) | nix-darwin (macOS) |
| **Module outputs** | `nixosModules.foo`, `homeManagerModules.foo` | `darwinModules.default` (system) + 3 named HM outputs |
| **Module count** | 1 module | 4 concern-based modules |
| **Packages** | `pkgs/foo.nix` with `callPackage` | No custom packages (uses nixpkgs directly) |
| **Checks** | `runNixOSTest` (VM tests) | `pkgs.runCommand` (touch $out) — macOS can't run NixOS VMs |
| **Cross-module ref** | `perSystem.config.packages.foo` | `perSystem@{ config }` (destructured but unused currently) |
| **Sub-module args** | `perSystem: { lib, ... }:` | `perSystem: { lib, config, pkgs, ... }:` (receives full darwin module context) |

## Data Flow: Complete Module Loading Chain

```
flake.nix
  │
  ├─ inputs
  │   ├─ flake-parts          → flake-parts.lib.mkFlake
  │   ├─ nixpkgs              → nixpkgs-unstable (follows to nix-darwin, home-manager)
  │   ├─ nix-darwin           → nix-darwin.lib.darwinSystem
  │   └─ home-manager         → home-manager.darwinModules.home-manager
  │
  ├─ mkFlake { inherit inputs; } ({ withSystem, moduleWithSystem, flake-parts-lib, ... }:
  │   let
  │     inherit (flake-parts-lib) importApply;
  │     darwin-mod      = importApply ./flake-modules/darwin        { ... };
  │     cli-tools-mod   = importApply ./flake-modules/cli-tools     { ... };
  │     dev-sdks-mod    = importApply ./flake-modules/dev-sdks      { ... };
  │     desktop-apps-mod = importApply ./flake-modules/desktop-apps { ... };
  │   in {
  │     imports = [ darwin-mod cli-tools-mod dev-sdks-mod desktop-apps-mod ];
  │     systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
  │
  │     perSystem = { pkgs, ... }: {
  │       devShells.default = pkgs.mkShell {
  │         packages = [ pkgs.nil pkgs.alejandra ];
  │       };
  │     };
  │
  │     flake.darwinConfigurations.mac16-10 = nix-darwin.lib.darwinSystem {
  │       system = "aarch64-darwin";
  │       modules = [
  │         ./hosts/mac16-10.nix              ←── Host identity
  │         self.darwinModules.default         ←── System-level (darwin module)
  │         home-manager.darwinModules.home-manager
  │         {
  │           home-manager.users.keith = {
  │             imports = [
  │               self.homeManagerModules.cli-tools    ←── CLI tools
  │               self.homeManagerModules.dev-sdks     ←── Dev SDKs
  │               self.homeManagerModules.desktop-apps ←── Desktop apps
  │             ];
  │             home.stateVersion = "25.05";
  │           };
  │         }
  │       ];
  │     };
  │   }
  │ )
  │
  ├─ darwin-mod resolves to flake-modules/darwin/default.nix:
  │    localFlake: { lib, config, self, inputs, ... }:
  │    {
  │      perSystem = { system, ... }: {
  │        checks.darwin-module-check = ...;
  │      };
  │      flake.darwinModules.default = localFlake.moduleWithSystem (
  │        perSystem@{ config }: localFlake.importApply ./darwinModules perSystem
  │      );
  │    }
  │
  ├─ cli-tools-mod resolves to flake-modules/cli-tools/default.nix:
  │    localFlake: { lib, config, self, inputs, ... }:
  │    {
  │      flake.homeManagerModules.cli-tools = localFlake.moduleWithSystem (
  │        perSystem@{ config }: localFlake.importApply ./homeManagerModules perSystem
  │      );
  │    }
  │
  ├─ dev-sdks-mod resolves to flake-modules/dev-sdks/default.nix:
  │    localFlake: { lib, config, self, inputs, ... }:
  │    {
  │      flake.homeManagerModules.dev-sdks = localFlake.moduleWithSystem (
  │        perSystem@{ config }: localFlake.importApply ./homeManagerModules perSystem
  │      );
  │    }
  │
  └─ desktop-apps-mod resolves to flake-modules/desktop-apps/default.nix:
       localFlake: { lib, config, self, inputs, ... }:
       {
         flake.homeManagerModules.desktop-apps = localFlake.moduleWithSystem (
           perSystem@{ config }: localFlake.importApply ./homeManagerModules perSystem
         );
       }
```

## Sub-Module Signature Patterns

### darwinModules/default.nix (System-Level)

```nix
perSystem:                    # ← Injected by moduleWithSystem wrapper
{ lib, config, pkgs, ... }:   # ← Standard nix-darwin module arguments
{
  environment.systemPackages = [ ... ];   # System-wide packages
  homebrew = { ... };                     # Homebrew integration
}
```

- `perSystem` gives access to `perSystem.config` for cross-module package references
- `config` is the nix-darwin system configuration
- `pkgs` is the nixpkgs instance for the target system

### homeManagerModules (User-Level — Three Named Modules)

Each user-level module follows the same pattern. They differ only in content:

```nix
perSystem:                    # ← Injected by moduleWithSystem wrapper
{ lib, config, pkgs, ... }:   # ← Standard home-manager module arguments
{
  home.packages = [ ... ];    # User-specific packages
}
```

- `config` here is home-manager's config, NOT darwin system config
- `pkgs` is the nixpkgs instance (same as system level, follows nixpkgs input)
- They are imported by name: `[self.homeManagerModules.cli-tools, self.homeManagerModules.dev-sdks, self.homeManagerModules.desktop-apps]`

## Technology Architecture

| Layer | Technology | Role | Key Function |
|-------|-----------|------|-------------|
| Orchestration | `flake-parts.lib.mkFlake` | Module composition, system declaration | `mkFlake { inherit inputs; }` |
| Module Loading | `flake-parts-lib.importApply` | Import + apply local flake modules with args | `importApply ./path { inherit withSystem moduleWithSystem importApply; }` |
| System Context | `localFlake.moduleWithSystem` | Wrap sub-module outputs with perSystem access | `localFlake.moduleWithSystem (perSystem: ...)` |
| Per-System Build | `localFlake.withSystem` | Evaluate derivation for specific system | `localFlake.withSystem system ({ pkgs, ... }: ...)` |
| Project DevShell | `pkgs.mkShell` | Workspace tools (nil, alejandra) via nix-direnv | `.envrc`: `use flake` |
| macOS System | `nix-darwin.lib.darwinSystem` | macOS system configuration builder | `darwinSystem { system, modules }` |
| User Config | `home-manager.darwinModules.home-manager` | User environment management | `home-manager.users.<name>.imports` |
| Package Source | `nixpkgs` (unstable) | All package derivations | Followed by nix-darwin + home-manager |

## Design Principles

1. **Modularity by concern**: Each flake module is self-contained and named by concern (`darwin`, `cli-tools`, `dev-sdks`, `desktop-apps`)
2. **Host agnosticism**: Shared modules never reference host names — host config is injected at the `darwinConfigurations` level
3. **Explicit over implicit**: All args declared explicitly; no `with pkgs;`; empty override sets on `callPackage`
4. **Validation-first**: `nix flake check` → `nix build` → deploy pipeline prevents broken configurations
5. **`localFlake`/`self` separation**: Internal module references use `localFlake`; cross-module/flake-level references use `self`
6. **Workspace DX**: `nix-direnv` + `.envrc` provides instant devShell on `cd` into the repository
7. **macOS-native testing**: `runNixOSTest` is unavailable; use `pkgs.runCommand` for perSystem checks and `nix build .#darwinConfigurations.<host>.system` for integration validation

---

_Generated: 2026-05-13 | Scan Level: Deep_
