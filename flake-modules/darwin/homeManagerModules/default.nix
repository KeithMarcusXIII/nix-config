perSystem:
{ lib, config, pkgs, ... }:
{
  home.packages = [
    pkgs.iina
    pkgs.vscodium
  ];
}
