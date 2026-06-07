# Architecture: nix-config

---

## Executive Summary

`nix-config` follows the `flake-parts` modular architecture pattern, specifically the `example-3-organizing-code` approach from `writing-flake-modules`. The architecture separates concerns into:

1. **Flake entry point** ([`flake.nix`](../flake.nix)) — defines inputs, systems, and flake-level outputs
2. **Flake modules** ([`flake-modules/`](../flake-modules/)) — encapsulated, self-referencing modules with curried signatures
3. **Host configurations** ([`hosts/`](../hosts/)) — per-machine nix-darwin system modules
4. **Secrets** ([`secrets/`](../secrets/)) — sops-nix encrypted secrets with LaunchAgent env injection

**Reference patterns:** Curated digests in [`references/`](../references/) — no external repo vendored.

## Architecture Pattern

**Pattern:** `flake-parts` modular composition via `importApply` (example-3-organizing-code)

```
flake.nix (orchestrator)
  ├─ imports: [ flake-modules/darwin (via importApply) ]
  │    ├─ flake.darwinModules.default (via moduleWithSystem)
  │    └─ flake.homeManagerModules.darwin (via moduleWithSystem)
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
       ├─ home-manager.darwinModules.home-manager
       ├─ sops-nix.darwinModules.sops
       ├─ nixpkgs.overlays → mcp-nixos (from flake input)
       ├─ self.homeManagerModules.darwin
       ├─ self.homeManagerModules.cli-tools
       ├─ self.homeManagerModules.dev-sdks
       └─ self.homeManagerModules.desktop-apps
```

### Module Signature Convention (Curried Two-Argument Form)

Every flake module follows this signature:

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
| `self.homeManagerModules.*` | Final user flake output | Named HM outputs from each concern module |

### Module Implementation Signature

Implementation modules use a single-argument curried form:

```nix
perSystem: { lib, config, pkgs, ... }: {
  # Module implementation — perSystem is already bound to a specific system
}
```

`perSystem` provides access to `perSystem.config.packages.*` for cross-module package references.

## Module Structure

```
flake-modules/
├── mkHomeManagerOutputsMerge.nix       # Flake module declaring mergeable homeManagerModules output
├── darwin/                             # 🍎 macOS system configuration
│   ├── default.nix                     # Entry: curried 2-arg, exports darwinModules + homeManagerModules
│   ├── darwinModules/
│   │   └── default.nix                 # System: nix.settings, homebrew, sops-nix, launchd, login items
│   └── homeManagerModules/
│       └── default.nix                 # User: nix extraOptions, programs.mcp, copyApps directory
├── cli-tools/                          # 🔧 CLI tools + container runtime
│   ├── default.nix                     # Entry: exports homeManagerModules.cli-tools
│   └── homeManagerModules/
│       └── default.nix                 # bat, btop, docker, colima service, direnv, zsh, git, mise
├── dev-sdks/                           # 📦 Development SDKs
│   ├── default.nix                     # Entry: exports homeManagerModules.dev-sdks
│   └── homeManagerModules/
│       └── default.nix                 # uv, apktool, payload-dumper-go, scrcpy
└── desktop-apps/                      # 🖥 Desktop applications
    ├── default.nix                     # Entry: exports homeManagerModules.desktop-apps
    └── homeManagerModules/
        ├── default.nix                 # iina, moonlight-qt, wechat; imports vscodium + opencodecommit
        ├── vscodium/
        │   ├── default.nix             # programs.vscodium enable
        │   ├── extensions.nix          # Extension list
        │   └── mcp.nix                 # MCP server integration
        └── opencodecommit/
            └── default.nix             # LaunchAgent: DEEPSEEK_API_KEY env injection
```

## Design Principles

1. **Modular separation by concern**: `darwin`, `cli-tools`, `dev-sdks`, `desktop-apps` — each independent and importable.

2. **Curried two-argument module signatures**: `localFlake: { ... }: { ... }` — enables `importApply` with `withSystem`/`moduleWithSystem` without global state.

3. **`mkHomeManagerOutputsMerge.nix`**: Enables multiple modules to contribute to `homeManagerModules` without merge conflicts. Adapted from `writing-flake-modules/example-2`.

4. **Per-system isolation**: `perSystem` computations are lazy and system-scoped — a module's packages are only built for the system that needs them.

5. **`_file` attribute on module outputs**: Every `homeManagerModules` entry carries `_file = "...#homeManagerModules.<name>"` for precise error location reporting.

6. **`nixpkgs.overlays` for external packages**: External flake inputs (like `mcp-nixos`) are injected via `nixpkgs.overlays` on nix-darwin and home-manager — not via `specialArgs` threading. This pattern avoids the infinite recursion trap of `_module.args.pkgs` and the verbosity of 3-layer argument threading. See [`docs/decisions/mcp-nixos-overlay.md`](./decisions/mcp-nixos-overlay.md).

7. **sops-nix for secrets**: Age-encrypted secrets with LaunchAgent-based env var injection for GUI apps. Secrets are decrypted at `darwin-rebuild switch` time and injected into launchd at login.

8. **Rolling frameworks + stable packages**: `nix-darwin` and `home-manager` track `master` for latest module definitions; `nixpkgs` stays on `nixpkgs-unstable` for predictable system packages.

9. **Declarative container runtime**: `services.colima` manages colima as a user launchd service with declarative profile configuration.

10. **Reference digests, not vendored repos**: Curated pattern references in `references/` (repomix digests) replace the previous vendored `writing-flake-modules/` repository.

## Data Flow

```
inputs (flake inputs)
  ├── nixpkgs (nixpkgs-unstable) ──► pkgs (all modules)
  ├── nix-darwin (master) ──► darwinSystem
  ├── home-manager (master) ──► home-manager.users.keith
  ├── sops-nix ──► darwinModules.sops → decrypted secrets
  ├── mcp-nixos ──► nixpkgs.overlays → pkgs.mcp-nixos
  ├── flake-parts ──► mkFlake, importApply, moduleWithSystem
  └── bluebuild-cli ──► (not currently consumed)

module outputs:
  self.darwinModules.default ──► darwinConfigurations.mac16-10.modules
  self.homeManagerModules.* ──► home-manager.users.keith.imports
```

## Key Patterns (Current)

### Pattern: External Flake Package via `nixpkgs.overlays`

```nix
# In flake.nix — inside the darwinConfiguration module list:
({ config, lib, ... }: {
  nixpkgs.overlays = [(final: prev: {
    mcp-nixos = inputs.mcp-nixos.packages.${final.stdenv.hostPlatform.system}.default;
  })];
})

# Same overlay duplicated in home-manager.users.keith for robustness
```

**Why this works:** `inputs` is captured from the outer `outputs` function scope. `final.stdenv.hostPlatform.system` is the target nixpkgs system — no circular dependency. No `specialArgs` threading needed.

### Pattern: sops-nix Secret → LaunchAgent Env Injection

```nix
# 1. darwinModules: sops-nix decrypts the secret to /run/secrets/<name>
sops.secrets."deepseek-api-key" = {
  owner = config.users.users.keith.name;
  group = "staff";
  mode = "0400";
};

# 2. homeManagerModules: LaunchAgent reads the decrypted file at login
launchd.agents.opencodecommit-env = {
  enable = true;
  config = {
    ProgramArguments = ["/bin/sh" "-c" ''
      keyFile="/run/secrets/deepseek-api-key"
      if [ -f "$keyFile" ]; then
        launchctl setenv DEEPSEEK_API_KEY "$(cat "$keyFile")"
      fi
    ''];
    RunAtLoad = true;
  };
};
```

### Pattern: Declarative colima Service

```nix
services.colima = {
  enable = true;
  package = pkgs.colima;
  profiles.default = {
    isActive = true;
    isService = true;
    setDockerHost = true;
    settings = { cpu = 4; memory = 8; disk = 60; arch = "aarch64"; vmType = "vz"; rosetta = true; };
  };
};
```

### Pattern: launchd KeepAlive for Boot-Time Race

```nix
launchd.daemons.activate-system = {
  serviceConfig = {
    KeepAlive = { SuccessfulExit = false; };
    ThrottleInterval = 10;
  };
};
```

### Pattern: Global MCP Server Registry

```nix
programs.mcp.enable = true;
programs.mcp.servers.nixos = { command = "mcp-nixos"; };
```

### Pattern: Custom macOS Application Bundle Directory

```nix
targets.darwin.copyApps = {
  enable = true;
  directory = "/Volumes/Macintosh Dock/Applications/Home Manager Apps";
};
```

## Reference Pattern Provenance

Each core architecture pattern in this project is sampled from a specific reference example in the digest collection. This section maps project patterns back to their canonical sources so that agents and developers can trace a pattern to its origin for deeper understanding.

### Digest: `references/flake-parts-examples.md`

**Source:** [VTimofeenko/writing-flake-modules](https://github.com/VTimofeenko/writing-flake-modules)

| Project Pattern | Derived From | How It's Used |
|---|---|---|
| **Curried 2-arg module signature** (`localFlake: { ... }: { ... }`) | Example 3: `flake-modules/foo/default.nix` | Every `flake-modules/<concern>/default.nix` — the core module entry pattern |
| **`importApply` wiring in `flake.nix`** | Example 3: `flake.nix` (lines 478-495) | Each module imported via `importApply ./flake-modules/<concern> { inherit withSystem moduleWithSystem importApply; }` |
| **`moduleWithSystem` for darwin/HM outputs** | Example 3: `flake.nix` (lines 493-499) | `localFlake.moduleWithSystem (perSystem @ {config}: localFlake.importApply ./darwinModules perSystem)` |
| **Single-arg implementation signature** (`perSystem: { ... }: { ... }`) | Example 3: `nixosModules/default.nix`, `homeManagerModules/default.nix` | `perSystem.config.packages.<name>` for cross-module package references |
| **Composable `homeManagerModules` merge** | Example 2: `mkHomeManagerOutputsMerge.nix` | [`mkHomeManagerOutputsMerge.nix`](../flake-modules/mkHomeManagerOutputsMerge.nix) — adapted with `lazyAttrsOf` + `_file` attribute |
| **`_file` attribute on module outputs** | Example 2: `mkHomeManagerOutputsMerge.nix` (line 371) | `_file = "toString moduleLocation#homeManagerModules.<name>"` for precise error locations |

### Digest: `references/flake-parts-writing-custom-flake-modules.md`

**Source:** [vtimofeenko.com blog post](https://vtimofeenko.com/posts/flake-parts-writing-custom-flake-modules/)

| Concept | Blog Section | Relevance |
|---|---|---|
| **`importApply` as the binding mechanism** | "The module" section — explains how provider flake args are bound before consumer flake args | Explains why `localFlake` comes before `{ lib, config, self, inputs, ... }` |
| **`moduleWithSystem` for per-system module output** | "Writing a NixOS module" section — introduces the API that pulls per-system attrs into modules | The mechanism behind `flake.darwinModules.default` and `flake.homeManagerModules.<name>` |
| **Why `homeManagerModules` needs explicit merge** | "Composable homeManagerModules" section — explains the `nixosModules` vs `homeManagerModules` asymmetry | The reason `mkHomeManagerOutputsMerge.nix` exists |
| **Scaling to multiple flake-modules** | "Scaling to multiple flake-modules" section — confirms the pattern works for N+ modules | Validates this project's 4-module architecture |

### Patterns NOT Derived from References

These patterns are project-specific inventions, not sampled from reference digests:

| Pattern | Origin |
|---|---|
| **`nixpkgs.overlays` for external packages** | This project — documented in [`docs/decisions/mcp-nixos-overlay.md`](./decisions/mcp-nixos-overlay.md) |
| **sops-nix + LaunchAgent env injection** | This project — see `opencodecommit/default.nix` |
| **`services.colima` declarative container runtime** | home-manager `master` module (the reason for the framework upgrade) |
| **`launchd` KeepAlive for boot-time resilience** | This project — see [`plans/darwin-rebuild-persistence-plan.md`](../plans/darwin-rebuild-persistence-plan.md) |
| **`programs.mcp` global MCP registry** | home-manager ecosystem |

### How to Use Reference Digests

1. **When designing a new flake module:** Start with Example 3's `default.nix` pattern — curried 2-arg, `moduleWithSystem` wrapping, `importApply` for sub-modules.
2. **When adding a second module that declares the same output type:** Check that `mkHomeManagerOutputsMerge.nix` is imported first (Example 2).
3. **When creating a module that needs provider-specific args:** Use Example 1's `importApply` with extra arguments pattern.
4. **When unsure about the "why":** Read the blog post digest — it explains the reasoning behind `importApply`, `moduleWithSystem`, and why the curried form exists.

## Technology Architecture

| Component | Source | Purpose |
|-----------|--------|---------|
| `flake-parts` | `github:hercules-ci/flake-parts` | Flake modularization framework |
| `nixpkgs` | `github:NixOS/nixpkgs/nixpkgs-unstable` | Package collection |
| `nix-darwin` | `github:nix-darwin/nix-darwin/master` | macOS system configuration |
| `home-manager` | `github:nix-community/home-manager/master` | User environment configuration |
| `sops-nix` | `github:Mic92/sops-nix` | Age-encrypted secret management |
| `mcp-nixos` | `github:utensils/mcp-nixos` | NixOS/nixpkgs MCP server (via overlays) |
| `devenv` | devenv.sh | Dev environment with MCP servers |
| `alejandra` | nixpkgs | Nix formatter |
| `nil` | nixpkgs | Nix language server |

---

_Generated: 2026-06-06 | Scan Level: Deep_
