{
  description = "nix-config — macOS system configuration via nix-darwin";

  inputs = {
    # ── Stable frameworks (predictable module system) ─────────
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # ── Rolling packages (bleeding-edge, standalone) ─────────
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # ── Tools (version-independent) ──────────────────────────
    bluebuild-cli.url = "github:blue-build/cli";
    bluebuild-cli.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ flake-parts, nix-darwin, home-manager, nixpkgs-unstable, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } (
      { self, withSystem, moduleWithSystem, flake-parts-lib, ... }:
      let
        inherit (flake-parts-lib) importApply;

        darwin-mod      = importApply ./flake-modules/darwin        { inherit withSystem moduleWithSystem importApply; };
        cli-tools-mod   = importApply ./flake-modules/cli-tools     { inherit withSystem moduleWithSystem importApply; };
        dev-sdks-mod    = importApply ./flake-modules/dev-sdks      { inherit withSystem moduleWithSystem importApply; };
        desktop-apps-mod = importApply ./flake-modules/desktop-apps { inherit withSystem moduleWithSystem importApply; };
      in
      {
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

        # ── perSystem: pkgs-unstable available to all modules ──
        perSystem = { system, pkgs, ... }: {
          _module.args.pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };

          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              nil           # Nix language server
              alejandra     # Nix formatter
            ];
          };
        };

        # ── darwinConfigurations: withSystem reaches into perSystem ──
        flake.darwinConfigurations.mac16-10 = withSystem "aarch64-darwin"
          ({ pkgs-unstable, ... }:
            nix-darwin.lib.darwinSystem {
              system = "aarch64-darwin";
              specialArgs = { inherit pkgs-unstable; };
              modules = [
                ./hosts/mac16-10.nix
                self.darwinModules.default
                home-manager.darwinModules.home-manager
                {
                  home-manager.users.keith = {
                    imports = [
                      self.homeManagerModules.cli-tools
                      self.homeManagerModules.dev-sdks
                      self.homeManagerModules.desktop-apps
                    ];
                    home.stateVersion = "25.11";
                  };
                  home-manager.useGlobalPkgs = true;
                  home-manager.useUserPackages = true;
                  home-manager.extraSpecialArgs = { inherit pkgs-unstable; };
                }
              ];
            }
          );
      }
    );
}
