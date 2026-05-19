perSystem:
{ lib, config, pkgs, pkgs-unstable, ... }:
{
  home.packages = with pkgs; [
    bat                  # cat with syntax highlighting
    btop                 # Process/resource monitor
    delta                # git diff viewer
    eza                  # Modern ls replacement
    fd                   # Modern find replacement
    tmux                 # Terminal multiplexer
    pkgs-unstable.devbox #
  ];

  programs.direnv.enable = true;

  programs.zsh = {
    enable = true;
    profileExtra = ''
      eval "$(/opt/homebrew/bin/brew shellenv zsh)"
    '';
  };

  programs.git = {
    enable = true;
    settings.user = {
      email = "kmarcusxiii@gmail.com";
      name = "Keith";
    };
  };
}
