perSystem:
{ lib, config, pkgs, ... }:
{
  home.packages = with pkgs; [
    bat               # cat with syntax highlighting
    btop              # Process/resource monitor
    delta             # git diff viewer
    direnv            # Per-directory environment variables
    eza               # Modern ls replacement
    fd                # Modern find replacement
    nix-direnv        # Fast cached nix-direnv for direnv
    tmux              # Terminal multiplexer
  ];
}
