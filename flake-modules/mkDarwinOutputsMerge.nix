# Flake module that declares flake.darwinModules outputs and how to merge them.
# Adapted from mkHomeManagerOutputsMerge.nix (same pattern, for nix-darwin modules).
{
  lib,
  flake-parts-lib,
  ...
}: let
  inherit (lib) mapAttrs mkOption types;
  inherit (flake-parts-lib) mkSubmoduleOptions;
in {
  options = {
    flake = mkSubmoduleOptions {
      darwinModules = mkOption {
        type = types.lazyAttrsOf types.unspecified;
        default = {};
        apply = mapAttrs (
          k: v: {
            _file = "${toString ./mkDarwinOutputsMerge.nix}#darwinModules.${k}";
            imports = [v];
          }
        );
        description = ''
          Darwin modules defined by concern-based flake modules.
        '';
      };
    };
  };
}
