# Source Tree Analysis: nix-config

---

## Annotated Directory Tree

```
nix-config/                          # Project root — Nix flake macOS configuration
├── .gitignore                       # Git ignore rules (result, .direnv, _bmad*, .claude, .agents)
├── README.md                        # Project title ("nix-config")
├── flake.nix                        # 🚀 ENTRY POINT — mkFlake orchestration, inputs, darwinConfigurations
├── flake.lock                       # 🔒 Locked input versions (auto-generated, never hand-edit)
│
├── flake-modules/                   # 📦 Flake-parts module directory
│   └── darwin/                      # Darwin (macOS) system module
│       ├── default.nix              # 🎯 Module entry — curried 2-arg form (localFlake: { ... }: { ... })
│       │                            #    • perSystem: checks.darwin-module-check (pkgs.runCommand)
│       │                            #    • flake.darwinModules.default (moduleWithSystem → darwinModules/)
│       │                            #    • flake.homeManagerModules.default (moduleWithSystem → homeManagerModules/)
│       ├── darwinModules/           # 🖥 System-level nix-darwin configuration
│       │   └── default.nix          #    Signature: perSystem: { lib, config, pkgs, ... }: { ... }
│       │                            #    • environment.systemPackages: git, ripgrep, wget, tree, colima
│       │                            #    • homebrew: enable + casks (zen-browser)
│       └── homeManagerModules/      # 👤 User-level home-manager configuration
│           └── default.nix          #    Signature: perSystem: { lib, config, pkgs, ... }: { ... }
│                                    #    • home.packages: iina, vscodium
│
├── hosts/                           # 🖥 Host-specific nix-darwin configurations
│   └── mac16-10.nix                 #    Host mac16-10 — system.stateVersion=5, primaryUser="keith"
│
├── docs/                            # 📚 Generated project documentation
│   ├── index.md                     #    Master documentation index
│   ├── project-overview.md          #    Executive summary and quick reference
│   ├── architecture.md              #    Detailed architecture with module patterns
│   ├── source-tree-analysis.md      #    This file — annotated tree structure
│   ├── development-guide.md         #    Setup, workflow, code conventions
│   ├── deployment-guide.md          #    Deployment pipeline and validation
│   └── project-scan-report.json     #    Workflow state file
│
├── _bmad-output/                    # 🤖 BMAD AI workflow artifacts
│   ├── project-context.md           #    AI agent rules (40 rules, 8 patterns, critical do/don't)
│   └── implementation-artifacts/    #    Sprint specs, epic traces, retros, deferred work
│
├── writing-flake-modules/           # 📖 Reference example repo (not part of this project)
│   └── example-3-organizing-code/   #    🏆 CHOSEN PATTERN — the template this project follows
│       ├── flake.nix                #       Reference: mkFlake with importApply
│       ├── flake.lock               #       Reference: lockfile
│       └── flake-modules/foo/       #       Reference module structure
│           ├── default.nix          #          Entry: curried 2-arg, perSystem + flake outputs
│           ├── pkgs/foo.nix         #          callPackage derivation
│           ├── nixosModules/default.nix   #    NixOS systemd service
│           └── homeManagerModules/default.nix  # HM user service
│
└── .venv/                           # 🐍 Python virtual environment (ignored by git)
```

## Critical Folders

| Folder | Purpose | Key Files |
|--------|---------|-----------|
| `flake-modules/darwin/` | Core macOS system module — entry point + sub-modules | `default.nix` (entry), `darwinModules/default.nix`, `homeManagerModules/default.nix` |
| `hosts/` | Per-machine identity and host-specific settings | `mac16-10.nix` |
| `docs/` | Generated project documentation | `index.md`, `architecture.md`, etc. |
| `writing-flake-modules/example-3-organizing-code/` | Reference template — the canonical pattern | `flake-modules/foo/default.nix` (curried signature) |

## Entry Points

| Entry Point | File | Role |
|-------------|------|------|
| Flake bootstrap | [`flake.nix`](../flake.nix) | Defines inputs, systems, imports flake modules, builds darwinConfigurations |
| Module entry | [`flake-modules/darwin/default.nix`](../flake-modules/darwin/default.nix) | Curried module providing perSystem checks and flake-level outputs |
| Host identity | [`hosts/mac16-10.nix`](../hosts/mac16-10.nix) | System stateVersion, primary user, host-specific settings |
| AI context | [`_bmad-output/project-context.md`](../_bmad-output/project-context.md) | Comprehensive rules for AI agents working on this project |

## Module Loading Chain (Full Resolution)

```
flake.nix →
  importApply ./flake-modules/darwin { withSystem, moduleWithSystem, importApply } →
    flake-modules/darwin/default.nix (localFlake: { ... }: ...) →
      │
      ├─ perSystem.checks.darwin-module-check
      │    └─ localFlake.withSystem system ({ pkgs, ... }:
      │         pkgs.runCommand "darwin-module-check" { } "touch $out")
      │
      ├─ flake.darwinModules.default
      │    └─ localFlake.moduleWithSystem (perSystem@{ config }:
      │         localFlake.importApply ./darwinModules perSystem) →
      │           darwinModules/default.nix (perSystem: { lib, config, pkgs, ... }: {
      │             environment.systemPackages = [ pkgs.git pkgs.ripgrep ... ];
      │             homebrew = { enable = true; casks = ["zen-browser"]; };
      │           })
      │
      └─ flake.homeManagerModules.default
           └─ localFlake.moduleWithSystem (perSystem@{ config }:
                localFlake.importApply ./homeManagerModules perSystem) →
                  homeManagerModules/default.nix (perSystem: { lib, config, pkgs, ... }: {
                    home.packages = [ pkgs.iina pkgs.vscodium ];
                  })
```

## Reference Comparison: This Project vs `example-3-organizing-code`

| Aspect | Reference (`foo`) | This Project (`darwin`) |
|--------|-------------------|------------------------|
| **Module entry** | `localFlake: { lib, config, self, inputs, ... }:` | Identical pattern |
| **perSystem** | `packages.foo` + `checks.foo-*` | `checks.darwin-module-check` only |
| **flake outputs** | `nixosModules.foo`, `homeManagerModules.foo` | `darwinModules.default`, `homeManagerModules.default` |
| **Packages** | `pkgs/foo.nix` via `callPackage` | Uses nixpkgs directly (no custom pkgs) |
| **Sub-module args** | `perSystem: { lib, ... }:` | `perSystem: { lib, config, pkgs, ... }:` |
| **Cross-module** | `perSystem.config.packages.foo` | `perSystem@{ config }` (destructured, unused) |
| **Testing** | `runNixOSTest` (NixOS VM) | `pkgs.runCommand` (macOS-compatible) |

---

_Generated: 2026-05-10 | Scan Level: Deep_
