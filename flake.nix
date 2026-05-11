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
        darwin-flake-mod = importApply ./flake-modules/darwin { inherit withSystem moduleWithSystem importApply; };
      in
      {
        imports = [ darwin-flake-mod ];
        systems = [
          "x86_64-linux"
          "aarch64-linux"
          "aarch64-darwin"
          "x86_64-darwin"
        ];
        flake.darwinConfigurations.mac16-10 = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./hosts/mac16-10.nix
            self.darwinModules.default
            home-manager.darwinModules.home-manager
            {
              home-manager.users.keith = {
                imports = [ self.homeManagerModules.default ];
                home.stateVersion = "25.05";
              };
            }
          ];
        };
      }
    );
}
