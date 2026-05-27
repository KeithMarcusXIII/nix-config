{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./settings.nix
    ./extensions.nix
  ];

  programs.vscodium = {
    enable = true;
    package = pkgs.vscodium;
  };
}
