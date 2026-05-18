{
  description = "Lightweight dev shell for nix-config development";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            nil         # Nix language server
            alejandra   # Nix formatter
            python3     # BMad method scripts (resolve_config.py, resolve_customization.py)
            nodejs      # Runtime for pnpm (bmad-method installer)
            pnpm        # Package manager for pnpx bmad-method install
          ];
        };
      }
    );
}
