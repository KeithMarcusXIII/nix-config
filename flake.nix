{
  description = "nix-config — macOS system configuration via nix-darwin";

  inputs = {
    # ── Stable frameworks (predictable module system) ─────────
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # ── Rolling packages (bleeding-edge, standalone) ─────────
    # nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # ── Tools (version-independent) ──────────────────────────
    bluebuild-cli.url = "github:blue-build/cli";
    bluebuild-cli.inputs.nixpkgs.follows = "nixpkgs";

    # ── Secret management ──────────────────────────────────
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    mcp-nixos.url = "github:utensils/mcp-nixos";
  };

  outputs = inputs @ {
    flake-parts,
    nix-darwin,
    home-manager,
    # nixpkgs-unstable,
    sops-nix,
    mcp-nixos,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} (
      {
        self,
        withSystem,
        moduleWithSystem,
        flake-parts-lib,
        ...
      }: let
        inherit (flake-parts-lib) importApply;

        darwin-mod = importApply ./flake-modules/darwin {inherit withSystem moduleWithSystem importApply;};
        cli-tools-mod = importApply ./flake-modules/cli-tools {inherit withSystem moduleWithSystem importApply;};
        dev-sdks-mod = importApply ./flake-modules/dev-sdks {inherit withSystem moduleWithSystem importApply;};
        desktop-apps-mod = importApply ./flake-modules/desktop-apps {inherit withSystem moduleWithSystem importApply;};
      in {
        imports = [
          ./flake-modules/mkHomeManagerOutputsMerge.nix
          darwin-mod
          cli-tools-mod
          dev-sdks-mod
          desktop-apps-mod
        ];

        systems = [
          "x86_64-linux"
          "aarch64-linux"
          "aarch64-darwin"
          "x86_64-darwin"
        ];

        # ── perSystem ───────────────────────────────────────────
        perSystem = {
          system,
          pkgs,
          ...
        }: {
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              nil # Nix language server
              alejandra # Nix formatter
            ];
          };
        };

        # ── darwinConfigurations ──────────────────────────────────
        flake.darwinConfigurations.mac16-10 =
          withSystem "aarch64-darwin"
          (
            {...}:
              nix-darwin.lib.darwinSystem {
                system = "aarch64-darwin";
                modules = [
                  ./hosts/mac16-10.nix
                  self.darwinModules.default
                  home-manager.darwinModules.home-manager
                  sops-nix.darwinModules.sops
                  # Overlay: inject mcp-nixos into pkgs from flake input
                  # inputs is accessible from the outer outputs function scope
                  # final.stdenv.hostPlatform.system is nix-darwin's pkgs system — no recursion
                  ({ config, lib, ... }: {
                    nixpkgs.overlays = [(final: prev: {
                      mcp-nixos = inputs.mcp-nixos.packages.${final.stdenv.hostPlatform.system}.default;
                    })];
                  })
                  {
                    home-manager.users.keith = {
                      # HM-level overlay (robust: works with or without useGlobalPkgs)
                      nixpkgs.overlays = [(final: prev: {
                        mcp-nixos = inputs.mcp-nixos.packages.${final.stdenv.hostPlatform.system}.default;
                      })];
                      imports = [
                        self.homeManagerModules.darwin
                        self.homeManagerModules.cli-tools
                        self.homeManagerModules.dev-sdks
                        self.homeManagerModules.desktop-apps
                      ];
                      home.stateVersion = "25.11";
                    };
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.backupFileExtension = "bak";
                  }
                ];
              }
          );
      }
    );
}
