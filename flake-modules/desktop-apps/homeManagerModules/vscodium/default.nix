{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    # ./settings.nix
    ./extensions.nix
    ./mcp.nix
  ];

  programs.vscodium = {
    enable = true;
    package = null;
  };
}
