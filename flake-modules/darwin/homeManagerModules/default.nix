perSystem:
{ lib, config, pkgs, ... }:
{
  home.packages = [
    pkgs.firefox
    pkgs.iina
    pkgs.vscodium
  ];
}
