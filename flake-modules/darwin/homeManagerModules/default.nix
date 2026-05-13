perSystem:
{ lib, config, pkgs, ... }:
{
  # All user packages migrated to named homeManagerModules:
  #   cli-tools, dev-sdks, desktop-apps
  # See flake.nix → home-manager.users.keith.imports
  home.packages = [ ];
}
