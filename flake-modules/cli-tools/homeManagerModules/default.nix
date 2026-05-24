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
    # pkgs-unstable.devbox #
    pkgs-unstable.devenv #
    sops                 # Secret editor for sops-nix
  ];

  # ── Enable flags ──────────────────────────────────────────────────
  # Toggle these at a glance without digging into config details below
  programs = {
    direnv.enable = true;
    zsh.enable = true;
    git.enable = true;
    mise.enable = true;
  };

  # ── Program configurations ────────────────────────────────────────
  programs = {
    direnv = {
      mise.enable = true;
    };

    zsh = {
      envExtra = ''
        # sops-nix age key — lets CLI `sops` find the decryption key
        export SOPS_AGE_KEY_FILE="$HOME/.config/sops/age/keys.txt"
      '';
      initContent = ''
        eval "$(/opt/homebrew/bin/brew shellenv zsh)"
        # eval "$(devbox global shellenv)"
      '';
    };

    git = {
      settings.user = {
        email = "kmarcusxiii@gmail.com";
        name = "Keith";
      };
    };

    mise = {
      enableZshIntegration = true;
      # globalConfig kept empty — mise/config.toml written manually via xdg.configFile
      # because the TOML serializer expands nested attrsets into [parent.child] headers
      # which mise's parser doesn't support for [env.*] entries.
      globalConfig = { };
    };
  };
}
