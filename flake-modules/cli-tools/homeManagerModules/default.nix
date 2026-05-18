perSystem:
{ lib, config, pkgs, ... }:
{
  home.packages = with pkgs; [
    bat               # cat with syntax highlighting
    btop              # Process/resource monitor
    delta             # git diff viewer
    eza               # Modern ls replacement
    fd                # Modern find replacement
    tmux              # Terminal multiplexer
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
