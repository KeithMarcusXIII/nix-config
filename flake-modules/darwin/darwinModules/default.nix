perSystem:
{ lib, config, pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.git
    pkgs.ripgrep
    pkgs.wget
    pkgs.tree
    pkgs.colima
  ];

  homebrew = {
    enable = true;
    casks = [ "zen-browser" ];
  };
}
