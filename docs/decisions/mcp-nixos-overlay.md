# Architecture Decision: External Flake Packages via `nixpkgs.overlays`

**Date:** 2026-05-27  
**Status:** Implemented  
**Author:** Winston (System Architect) / Paige (Technical Writer)

---

## Problem

External flake packages — derivations from flake inputs that are not part of nixpkgs — need to be available as `pkgs.<name>` in nix-darwin and home-manager modules.

### Before

`mcp-nixos` was threaded through three layers of argument passing:

```
flake.nix perSystem:
  _module.args.mcp-nixos = mcp-nixos.packages.${system}.default
       │
       ├─ darwinConfigurations.specialArgs = { inherit mcp-nixos; }
       └─ home-manager.extraSpecialArgs = { inherit mcp-nixos; }
```

Every consuming module had to declare it as a parameter:

```nix
perSystem: { lib, config, pkgs, mcp-nixos, ... }: {
  home.packages = [ mcp-nixos ];
}
```

### Pain Points

| Issue | Detail |
|-------|--------|
| **Verbose** | 3 layers of arg threading for one package |
| **Brittle** | Every new consumer needs its own parameter declaration |
| **Inconsistent** | `devenv.nix` used `pkgs.mcp-nixos` directly — different mechanism |
| **Non-standard** | External packages should feel like nixpkgs packages |

---

## Attempted Approaches

### 1. `_module.args.pkgs` with overlay (RECURSIVE)

```nix
_module.args.pkgs = import nixpkgs {
  inherit system;
  overlays = [(final: prev: {
    mcp-nixos = mcp-nixos.packages.${prev.system}.default;
  })];
};
```

**Result:** Infinite recursion. `prev.system` references the nixpkgs being constructed.

### 2. `_module.args.pkgs = pkgs.extend` (RECURSIVE)

```nix
_module.args.pkgs = pkgs.extend (final: prev: {
  mcp-nixos = mcp-nixos.packages.${system}.default;
});
```

**Result:** Infinite recursion. flake-parts internally depends on `_module.args.pkgs` for its own module system evaluation. Overriding it creates a circular dependency.

### 3. `_module.args.pkgs = pkgs // { ... }` (RECURSIVE)

```nix
_module.args.pkgs = pkgs // {
  mcp-nixos = mcp-nixos.packages.${system}.default;
};
```

**Result:** Same recursion. The issue is not the mechanism (extend vs merge) — it's that `_module.args.pkgs` is an internal flake-parts dependency. Any override creates a cycle.

---

## Chosen Solution: `nixpkgs.overlays` in darwin/HM module lists

### Core Insight

**Don't override `_module.args.pkgs` at all.** Instead, apply the overlay where `pkgs` is actually constructed — inside nix-darwin and home-manager's own `nixpkgs.overlays` option.

### Implementation

The overlay uses `inputs` (from the outer `outputs` function scope) and `final.system` (from the target nixpkgs instance):

```nix
# flake.nix — inside nix-darwin module list
({ config, lib, ... }: {
  nixpkgs.overlays = [(final: prev: {
    mcp-nixos = inputs.mcp-nixos.packages.${final.system}.default;
  })];
})
```

A second, identical overlay is placed inside `home-manager.users.keith` for robustness (works regardless of `useGlobalPkgs`):

```nix
{
  home-manager.users.keith = {
    nixpkgs.overlays = [(final: prev: {
      mcp-nixos = inputs.mcp-nixos.packages.${final.system}.default;
    })];
    # ... imports, etc.
  };
}
```

### Why No Recursion

| Factor | Why it's safe |
|--------|---------------|
| **`inputs` scope** | `inputs.mcp-nixos` is captured from the outer `outputs = inputs @ { ... }` function scope — not threaded through module args |
| **`final.system`** | `final.system` is nix-darwin / home-manager's own nixpkgs system, not flake-parts' perSystem — no circular dependency |
| **`nixpkgs.overlays`** | This is a standard nixpkgs option applied during pkgs construction, not a post-hoc override of an internal mechanism |

### Data Flow

```
inputs.mcp-nixos (flake input, its own nixpkgs)
        │
        ├──► darwin: nixpkgs.overlays ──► pkgs.mcp-nixos
        │                                    │
        │                              darwinModules: environment.systemPackages
        │                              HM modules (via useGlobalPkgs)
        │
        └──► HM: nixpkgs.overlays ──► pkgs.mcp-nixos
                                             │
                                       homeManagerModules: home.packages
```

---

## Files Changed

| File | Change |
|------|--------|
| [`flake.nix`](../flake.nix) | Removed `_module.args.mcp-nixos`, `specialArgs`, `extraSpecialArgs`. Added two `nixpkgs.overlays` blocks (darwin + HM) |
| [`flake-modules/cli-tools/homeManagerModules/default.nix`](../flake-modules/cli-tools/homeManagerModules/default.nix) | Removed `mcp-nixos` parameter — `pkgs.mcp-nixos` resolves via `with pkgs;` |
| [`devenv.nix`](../devenv.nix) | Unchanged — already used `pkgs.mcp-nixos` |

---

## Verification

- **`nix flake check`** — passes (no recursion)
- **`darwinConfigurations.mac16-10`** — evaluates cleanly
- **`pkgs.mcp-nixos`** — resolves to the flake input's version (pinned in `flake.lock`)

---

## Pattern for Future External Flake Packages

To add a new external flake package in the future:

1. Add it as a flake input in [`flake.nix`](../flake.nix):
   ```nix
   inputs = {
     my-package.url = "github:owner/repo";
     my-package.inputs.nixpkgs.follows = "nixpkgs";
   };
   ```

2. Add the overlay in the darwin module list (and HM if not using `useGlobalPkgs`):
   ```nix
   ({ config, lib, ... }: {
     nixpkgs.overlays = [(final: prev: {
       my-package = inputs.my-package.packages.${final.system}.default;
     })];
   })
   ```

3. Use it anywhere via `pkgs.my-package` — no parameter declarations needed.

### When to Use This Pattern vs. Other Approaches

| Approach | When |
|----------|------|
| **`nixpkgs.overlays`** (this pattern) | External flake input with a pre-built package |
| **`callPackage` in module** | Package from your own source tree (`./pkgs/`) |
| **nixpkgs attribute** | Package already exists in nixpkgs |
| **`specialArgs` threading** | Avoid entirely for package access; use only for module-level configuration values |
