perSystem: {
  lib,
  config,
  pkgs,
  # pkgs-unstable,
  ...
}: {
  home.packages = with pkgs; [
    bat # cat with syntax highlighting
    btop # Process/resource monitor
    delta # git diff viewer
    eza # Modern ls replacement
    fd # Modern find replacement
    tmux # Terminal multiplexer
    # pkgs-unstable.devbox #
    devenv #
    # secretspec
    sops # Secret editor for sops-nix

    # Container tools (managed alongside colima service)
    docker
    docker-compose
    docker-buildx

    # MCP server for NixOS
    mcp-nixos
  ];

  # ── Colima: container runtime as a user launchd service ──────────
  # services.colima = {
  #   enable = true;
  #   package = pkgs.colima;

  #   profiles.default = {
  #     isActive = true;
  #     isService = true;
  #     setDockerHost = true;
  #     settings = {
  #       cpu = 4;
  #       memory = 8;
  #       disk = 60;
  #       arch = "aarch64";
  #       vmType = "vz";
  #       rosetta = true;
  #     };
  #   };
  # };

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
      silent = true; # Suppress "direnv: export +VAR ..." logging
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
      globalConfig = {};
    };
  };

  launchd.agents.bws-env = {
    enable = true;
    config = {
      Label = "com.bws-env";
      ProgramArguments = [
        "/bin/sh"
        "-c"
        ''
          keyFile="/run/secrets/bws-access-token"
          if [ -f "$keyFile" ]; then
            launchctl setenv BWS_ACCESS_TOKEN "$(cat "$keyFile")"
          else
            echo "WARNING: $keyFile not found — bitwarden secrets manager will not have API key" >&2
            logger -t bws-env "ERROR: $keyFile not found"
          fi
        ''
      ];
      RunAtLoad = true;
    };
  };
}
