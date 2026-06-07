# Source Tree Analysis: nix-config

---

## Annotated Directory Tree

```
nix-config/                          # Project root — Nix flake macOS configuration
├── .envrc                           # direnv: `nix print-dev-env` source + bws secret injection
├── .gitignore                       # Git ignore rules (result, .direnv, .devenv, _bmad*)
├── .sops.yaml                       # sops-nix age key configuration
├── README.md                        # Project title ("nix-config")
├── flake.nix                        # 🚀 ENTRY POINT — mkFlake orchestration, inputs, darwinConfigurations
├── flake.lock                       # 🔒 Locked input versions (auto-generated, never hand-edit)
├── devenv.nix                       # 🛠 Dev environment: Node 24, Python venv, MCP servers, repomix
├── devenv.yaml                      # Devenv config: inputs + imports
├── devenv.lock                      # Devenv lockfile
├── nix.conf                         # Nix daemon config (trusted-users, experimental-features)
│
├── flake-modules/                   # 📦 Flake-parts module directory (importApply pattern)
│   ├── mkHomeManagerOutputsMerge.nix # 🔀 Merges HM outputs from multiple modules (adapted from writing-flake-modules/example-2)
│   ├── darwin/                      # 🍎 macOS system configuration
│   │   ├── default.nix              #    Entry: curried 2-arg, exports darwinModules + homeManagerModules
│   │   ├── darwinModules/
│   │   │   └── default.nix          #    System: nix.settings, homebrew, sops-nix, launchd KeepAlive, login items
│   │   └── homeManagerModules/
│   │       └── default.nix          #    User: nix extraOptions, programs.mcp registry, copyApps directory
│   ├── cli-tools/                   # 🔧 CLI tools + container runtime
│   │   ├── default.nix              #    Entry: exports homeManagerModules.cli-tools
│   │   └── homeManagerModules/
│   │       └── default.nix          #    bat, btop, docker, colima service, direnv, zsh, git, mise, bws-env agent
│   ├── dev-sdks/                    # 📦 Development SDKs
│   │   ├── default.nix              #    Entry: exports homeManagerModules.dev-sdks
│   │   └── homeManagerModules/
│   │       └── default.nix          #    uv, apktool, payload-dumper-go, scrcpy
│   └── desktop-apps/               # 🖥 Desktop applications
│       ├── default.nix              #    Entry: exports homeManagerModules.desktop-apps
│       └── homeManagerModules/
│           ├── default.nix          #    iina, moonlight-qt, wechat; imports vscodium + opencodecommit
│           ├── vscodium/
│           │   ├── default.nix      #       programs.vscodium enable
│           │   ├── extensions.nix   #       VSCodium extension list
│           │   ├── mcp.nix          #       MCP server integration config
│           │   └── settings.nix     #       Editor settings (commented out)
│           └── opencodecommit/
│               └── default.nix      #       LaunchAgent: DEEPSEEK_API_KEY from sops-nix → launchd env
│
├── hosts/                           # 🖥 Host-specific nix-darwin configurations
│   └── mac16-10.nix                 #    stateVersion=6, primaryUser="keith", timezone, power settings
│
├── nix.conf.d/                      # ⚙️ Nix config snippets (included via !include)
│   └── 50-github-token.conf         #    GitHub access token (decrypted by sops-nix)
│
├── docs/                            # 📚 Generated project documentation
│   ├── index.md                     #    Master documentation index
│   ├── project-overview.md          #    Executive summary and quick reference
│   ├── architecture.md              #    Detailed architecture with module patterns
│   ├── source-tree-analysis.md      #    This file — annotated tree structure
│   ├── development-guide.md         #    Setup, workflow, code conventions
│   ├── deployment-guide.md          #    Deployment pipeline and validation
│   ├── flake-direnv-guide.md        #    direnv + nix-direnv setup guide
│   ├── adding-applications-guide.md #    How to add new applications
│   ├── project-scan-report.json     #    Workflow state file
│   ├── decisions/                   #    Architecture Decision Records
│   │   └── mcp-nixos-overlay.md     #       Decision: overlays over specialArgs threading
│   └── troubleshooting/            #    Diagnostic guides
│
├── reference/                       # 📋 Configuration fixtures (not managed by nix)
│   ├── README.md                    #    Directory purpose documentation
│   ├── launch-daemons/              #    Reference copies of macOS LaunchDaemon plists
│   │   ├── org.nixos.actvate-system.plist
│   │   └── org.nixos.darwin-store.plist
│   └── opencodecommit/
│       └── config.toml              #    OpenCodeCommit extension config reference
│
├── references/                      # 📖 Repomix digests — curated external reference patterns
│   ├── flake-parts-examples.md       #    Digest: textbook flake-parts examples (VTimofeenko/writing-flake-modules)
│   ├── flake-parts-production.md     #    Digest: production flake-parts at scale (VTimofeenko/monorepo-machine-config)
│   ├── flake-parts-subflake.md       #    Digest: subflake composition with traits (VTimofeenko/monorepo-machine-config)
│   ├── flake-parts-writing-custom-flake-modules.md  # Blog post: importApply, moduleWithSystem patterns
│   └── bmad-method-documentation.md  #    Digest: BMAD Method docs (English only)
│
├── secrets/                          # 🔐 Encrypted secrets (sops-nix)
│   └── secrets.yaml                 #    github-token, deepseek-api-key, bws-access-token
│
├── plans/                            # 📋 Architectural plans (not scanned)
│
├── _bmad/                            # 🤖 BMAD framework config
├── _bmad-output/                    # 🤖 BMAD workflow artifacts
│   ├── planning-artifacts/          #    PRDs, architecture decisions
│   └── implementation-artifacts/    #    Sprint specs, epic traces, retros
│
├── .agents/                          # 🤖 Agent skill definitions
├── .roo/                            #    Roo Code MCP configuration
└── .devenv/                         #    Devenv shell cache files
```

## Critical Folders

| Folder | Purpose | Key Files |
|--------|---------|-----------|
| `flake-modules/darwin/` | Core macOS system module — nix-darwin config, homebrew, sops-nix | `default.nix` (entry), `darwinModules/default.nix`, `homeManagerModules/default.nix` |
| `flake-modules/cli-tools/` | CLI tools + container runtime (colima, docker) | `homeManagerModules/default.nix` (colima service, direnv, zsh, git, mise) |
| `flake-modules/dev-sdks/` | Development SDKs (Python, Android) | `homeManagerModules/default.nix` (uv, apktool, scrcpy) |
| `flake-modules/desktop-apps/` | Desktop apps (IINA, VSCodium, OpenCodeCommit) | `homeManagerModules/default.nix` + `vscodium/`, `opencodecommit/` |
| `hosts/` | Per-machine identity and host-specific settings | `mac16-10.nix` |
| `docs/` | Generated project documentation | `index.md`, `architecture.md` |
| `reference/` | Configuration fixture copies (not nix-managed) | LaunchDaemon plists, opencodecommit config |
| `references/` | Repomix digests — curated external pattern references | `flake-parts-examples.md`, `flake-parts-production.md` |

## Entry Points

| Entry Point | File | Role |
|-------------|------|------|
| Flake bootstrap | [`flake.nix`](../flake.nix) | Defines inputs, systems, imports flake modules, builds darwinConfigurations |
| Module entries | `flake-modules/*/default.nix` | Curried 2-arg modules providing darwinModules + homeManagerModules |
| Host identity | [`hosts/mac16-10.nix`](../hosts/mac16-10.nix) | System stateVersion, primary user, host-specific settings |
| Dev environment | [`devenv.nix`](../devenv.nix) | Node 24, Python venv, MCP servers (nixos, devenv, firecrawl, repomix, github) |
| Secret management | [`secrets/secrets.yaml`](../secrets/secrets.yaml) | sops-nix encrypted secrets (github-token, API keys) |

## Module Loading Chain (Full Resolution)

```
flake.nix →
  importApply ./flake-modules/darwin { withSystem, moduleWithSystem, importApply } →
    darwin/default.nix →
      ├─ flake.darwinModules.default
      │    └─ moduleWithSystem → importApply ./darwinModules perSystem →
      │         darwinModules/default.nix
      │           • nix.settings (build-users-group, experimental-features, substituters)
      │           • sops-nix (age key, github-token, deepseek-api-key, bws-access-token)
      │           • launchd.daemons.activate-system KeepAlive (exit 126 → retry)
      │           • environment.systemPackages, homebrew, system.defaults
      │           • login items via osascript activation script
      │
      └─ flake.homeManagerModules.darwin
           └─ moduleWithSystem → importApply ./homeManagerModules perSystem →
                homeManagerModules/default.nix
                  • nix.extraOptions (!include github-token snippet)
                  • programs.mcp.enable + servers.nixos
                  • targets.darwin.copyApps (custom directory)

  importApply ./flake-modules/cli-tools { ... } →
    cli-tools/default.nix →
      flake.homeManagerModules.cli-tools
        └─ moduleWithSystem → importApply ./homeManagerModules perSystem →
             • home.packages: bat, btop, docker, mcp-nixos, devenv, sops
             • services.colima (declarative container runtime)
             • programs: direnv, zsh, git, mise
             • launchd.agents.bws-env (BWS_ACCESS_TOKEN injection)

  importApply ./flake-modules/dev-sdks { ... } →
    dev-sdks/default.nix →
      flake.homeManagerModules.dev-sdks
        └─ moduleWithSystem → importApply ./homeManagerModules perSystem →
             • home.packages: uv, apktool, payload-dumper-go, scrcpy

  importApply ./flake-modules/desktop-apps { ... } →
    desktop-apps/default.nix →
      flake.homeManagerModules.desktop-apps
        └─ moduleWithSystem → importApply ./homeManagerModules perSystem →
             • home.packages: iina, moonlight-qt, wechat
             • imports: vscodium/default.nix, opencodecommit/default.nix
```

## Reference Pattern Sources

This project no longer vendors a copy of the `writing-flake-modules` repository. Instead, curated digests are stored in [`references/`](../references/):

| Digest | Source | Content |
|--------|--------|---------|
| `flake-parts-examples.md` | VTimofeenko/writing-flake-modules | Textbook examples: configurable inputs bumper, composable HM modules, organizing code |
| `flake-parts-production.md` | VTimofeenko/monorepo-machine-config | Production structure at scale (flake-modules/, nixosConfigurations/) |
| `flake-parts-subflake.md` | VTimofeenko/monorepo-machine-config | Subflake composition with traits, services, independent flake-modules |
| `flake-parts-writing-custom-flake-modules.md` | Blog post (vtimofeenko.com) | Explains importApply, moduleWithSystem, curried signatures |

---

_Generated: 2026-06-06 | Scan Level: Deep_
