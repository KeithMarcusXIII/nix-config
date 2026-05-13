{
  description = "nix-config — macOS system configuration via nix-darwin";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    # nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    bluebuild-cli.url = "github:blue-build/cli";
    bluebuild-cli.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ flake-parts, nix-darwin, home-manager, ... }:
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

        perSystem = { pkgs, ... }: {
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              nil           # Nix language server
              alejandra     # Nix formatter
            ];
          };
        };

        flake.darwinConfigurations.mac16-10 = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
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
                home.stateVersion = "25.05";
              };
            }
          ];
        };
      }
    );
}
