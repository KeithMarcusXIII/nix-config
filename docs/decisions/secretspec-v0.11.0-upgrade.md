# Architecture Decision: secretspec v0.11.0 Upgrade via Source Build

**Date:** 2026-06-07  
**Status:** Implemented  
**Author:** Paige (Technical Writer)

---

## Problem

[`secretspec.toml`](../secretspec.toml) declares a project-level `[providers]` table:

```toml
[providers]
devenv = "bws://885d83f3-063b-4ba7-bddc-b45a00fd59b9"
```

This feature — project-level provider aliases — was **added in secretspec v0.11.0** (released 2026-05-22). The installed version was **v0.10.1** (provided by the system nix-darwin flake), and nixpkgs unstable pinned **v0.8.2**. Neither supported the configuration.

### Version Landscape

| Source              | Version | In Use        |
|---------------------|---------|---------------|
| nixpkgs (devenv)    | 0.8.2   | Shadowed      |
| System flake/darwin | 0.10.1  | Wins `PATH`   |
| GitHub Releases     | 0.11.0  | **Target**    |

### Impact

Without v0.11.0, the `[providers]` stanza in `secretspec.toml` caused a parse error at runtime, making secretspec inoperable in the devenv shell.

---

## Attempted Approaches

### 1. Prebuilt Binary (Recommended — Not Chosen)

The plan originally recommended replacing `pkgs.secretspec` with a `pkgs.stdenv.mkDerivation` that fetches the aarch64-darwin prebuilt binary from GitHub Releases:

```nix
(pkgs.stdenv.mkDerivation {
  pname = "secretspec";
  version = "0.11.0";
  src = pkgs.fetchurl {
    url = "https://github.com/cachix/secretspec/releases/download/v0.11.0/secretspec-aarch64-apple-darwin.tar.xz";
    hash = "<computed>";
  };
  sourceRoot = ".";
  installPhase = ''
    mkdir -p $out/bin
    cp secretspec $out/bin/
  '';
})
```

**Advantages:** One-file change, instant (no Rust compilation), reversible.

**Why not chosen:** The user explicitly requested the `overrideAttrs` approach to test source-build reliability.

### 2. `overrideAttrs` on `pkgs.secretspec` (ATTEMPTED — FAILED)

```nix
(pkgs.secretspec.overrideAttrs (oldAttrs: {
  version = "0.11.0";
  src = pkgs.fetchFromGitHub {
    owner = "cachix";
    repo = "secretspec";
    rev = "v0.11.0";
    hash = "sha256-wNM4M1WmY4qn+rAS3bwV+0xyYxPj5tSCZNgzgpZzxLo=";
  };
  cargoHash = "sha256-+za3JfcgTHSteOAWh7PXQx30WsdA3ApBswY4ALeacJ8=";
}))
```

**Result:** Hash mismatch on the vendor-staging derivation.

**Root cause:** `buildRustPackage` computes the `cargoDeps` vendor derivation **internally at evaluation time** using the parameter `cargoHash`. When `overrideAttrs` is applied to the result, it changes the `cargoHash` attribute on the surface derivation but does **not** propagate to the already-computed `cargoDeps` derivation. The vendor-staging derivation retained the original v0.10.1's `cargoHash`, causing a fixed-output hash mismatch:

```
specified: sha256-I91sGPtCZxfhGYgeQDKZcs1yfSKiqlIcnC5wD3LB0BY=   (v0.10.1's cargoHash)
   got:    sha256-+za3JfcgTHSteOAWh7PXQx30WsdA3ApBswY4ALeacJ8=   (v0.11.0's actual cargo deps)
```

This is a known limitation of `overrideAttrs` with `buildRustPackage` — the `cargoHash` / `cargoDeps` relationship is baked at the `buildRustPackage` call site and cannot be retroactively patched via attribute override.

---

## Chosen Solution: `rustPlatform.buildRustPackage`

### Core Insight

Instead of overriding attributes on an existing derivation, create a **fresh derivation** using [`pkgs.rustPlatform.buildRustPackage`](https://nixos.org/manual/nixpkgs/stable/#rust). This gives `buildRustPackage` the correct `cargoHash` at construction time, so the internal `cargoDeps` derivation is computed with the right expected hash.

### Implementation

```nix
# devenv.nix — inside packages list
(pkgs.rustPlatform.buildRustPackage {
  pname = "secretspec";
  version = "0.11.0";
  src = pkgs.fetchFromGitHub {
    owner = "cachix";
    repo = "secretspec";
    rev = "v0.11.0";
    hash = "sha256-wNM4M1WmY4qn+rAS3bwV+0xyYxPj5tSCZNgzgpZzxLo=";
  };
  cargoHash = "sha256-+za3JfcgTHSteOAWh7PXQx30WsdA3ApBswY4ALeacJ8=";
})
```

### Hash Computation

Both hashes were computed by attempting a build with placeholder values and capturing the mismatch error:

| Parameter   | Hash                                                                 |
|-------------|----------------------------------------------------------------------|
| `src`       | `sha256-wNM4M1WmY4qn+rAS3bwV+0xyYxPj5tSCZNgzgpZzxLo=` (GitHub tarball) |
| `cargoHash` | `sha256-+za3JfcgTHSteOAWh7PXQx30WsdA3ApBswY4ALeacJ8=` (vendored deps)  |

### Data Flow

```
pkgs.fetchFromGitHub (cachix/secretspec@v0.11.0)
        │
        └──► pkgs.rustPlatform.buildRustPackage
                  │
                  ├── cargoHash ──► vendor-staging (download crates, verify hash)
                  │                      │
                  │                      └──► vendor (cached dep tarball)
                  │
                  └── src ──► rustc build ──► $out/bin/secretspec
                                                  │
                                            devenv packages / PATH
```

---

## Files Changed

| File                                                              | Change                                                                                        |
|-------------------------------------------------------------------|-----------------------------------------------------------------------------------------------|
| [`devenv.nix`](../devenv.nix)                                     | Replaced `pkgs.secretspec` with `pkgs.rustPlatform.buildRustPackage` pinning v0.11.0 source    |
| [`plans/secretspec-upgrade.md`](../plans/secretspec-upgrade.md)   | Updated (implicitly) — the actual approach diverged from both prebuilt-binary and overrideAttrs paths described in the plan |

---

## Verification

| Step                          | Result                                                   |
|-------------------------------|----------------------------------------------------------|
| `nix build` (standalone)      | `BUILD SUCCESS` — Rust compilation completed cleanly     |
| `which secretspec`            | `/nix/store/qzy55vli9h4ss0p8l40bwc5whls8n1jp-secretspec-0.11.0/bin/secretspec` |
| `direnv allow` (devenv)       | Pending — reloads the shell with the new package         |
| `secretspec --version`        | Pending — expected `0.11.0`                              |
| `secretspec.toml` parsing     | Pending — `[providers]` table should be recognized       |

---

## Caveats

| Concern                     | Detail                                                                                      |
|-----------------------------|---------------------------------------------------------------------------------------------|
| **Build time**              | First build takes 5–10 minutes for Rust compilation. Subsequent builds are cached.          |
| **nixpkgs catch-up**        | When nixpkgs unstable ships secretspec ≥0.11.0, revert to `pkgs.secretspec` directly.       |
| **System flake shadowing**  | The system flake (`nix-darwin`) still provides v0.10.1. The devenv-override only works inside the devenv shell. If secretspec v0.11.0 is needed system-wide, the system flake must also be updated. |
| **`overrideAttrs` gotcha**  | Documented above: `buildRustPackage` + `overrideAttrs` is a known trap. Always use a fresh `buildRustPackage` call when changing the source or cargo hash. |

---

## Reversion

To revert to the nixpkgs version, restore the original `packages` list:

```diff
-    ] ++ [
-      (pkgs.rustPlatform.buildRustPackage { ... })
-    ];
+      secretspec
    ];
```

This is safe because `pkgs.secretspec` (v0.8.2 from nixpkgs) still exists in the nixpkgs passed to devenv — it was never removed, just shadowed by the new derivation.
