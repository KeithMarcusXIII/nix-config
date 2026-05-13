# Flake module that declares flake.homeManagerModules outputs and how to merge them.
# Adapted from writing-flake-modules/example-2-composable-home-manager-modules/good-flake/mkHomeManagerOutputsMerge.nix
{
  lib,
  flake-parts-lib,
  ...
}:
let
  inherit (lib) mapAttrs mkOption types;
  inherit (flake-parts-lib) mkSubmoduleOptions;
in
{
  options = {
    flake = mkSubmoduleOptions {
      homeManagerModules = mkOption {
        type = types.lazyAttrsOf types.unspecified;
        default = { };
        apply = mapAttrs (
          k: v: {
            _file = "${toString ./mkHomeManagerOutputsMerge.nix}#homeManagerModules.${k}";
            imports = [ v ];
          }
        );
        description = ''
          Home Manager modules defined by concern-based flake modules.
        '';
      };
    };
  };
}
