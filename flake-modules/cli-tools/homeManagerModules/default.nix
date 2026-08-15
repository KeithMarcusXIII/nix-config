perSystem: {
  lib,
  config,
  pkgs,
  # pkgs-unstable,
  ...
}: {
  home.packages = with pkgs; [
    bat
    btop
    delta
    eza
    fd 
    tmux 
    devenv
    # secretspec
    sops 
    bws
    docker
    docker-compose
    docker-buildx
    mcp-nixos
    yubikey-manager
    pnpm
    exiftool
    immich-go
    repomix
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
    mise = {
      enable = true;
    };
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

        # Auto-load known sops-nix secrets as environment variables.
        # Add new secret names to the list below (one per line).
        # Each maps to /run/secrets/<name> and exports as UPPERCASE_WITH_UNDERSCORES.
        _sops_secrets=(
          bws-access-token
          omlx-api-key
          github-token
        )
        for _secret_name in "''${_sops_secrets[@]}"; do
          _secret_file="/run/secrets/$_secret_name"
          [ -f "$_secret_file" ] || continue
          _secret_key="$(echo "$_secret_name" | tr '[:lower:]-' '[:upper:]_')"
          _secret_val="$(cat "$_secret_file" 2>/dev/null)"
          [ -n "$_secret_val" ] && export "$_secret_key=$_secret_val"
        done
        unset _sops_secrets _secret_name _secret_file _secret_key _secret_val

        # Workaround: secretspec's BWS provider hardcodes --server-url https://bitwarden.com
        # (the web vault) instead of using the BWS CLI's correct defaults.
        # This wrapper strips the flag so BWS hits api.bitwarden.com.
        # See scripts/bws-secretspec.sh
        export SECRETSPEC_BWS_CLI_PATH="$HOME/.config/nix/scripts/bws-secretspec.sh"
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
      # globalConfig left empty — written as raw text via xdg.configFile below
      # because pkgs.formats.toml quotes dotted keys (spec-correct) but mise's
      # config parser can't handle quoted TOML keys (e.g. "python.uv_venv_auto").
      globalConfig = { };
    };
  };

  # Hand-written mise config to avoid TOML serializer quoting dotted keys.
  # Keys like python.uv_venv_auto and _.python.venv must remain unquoted
  # because mise's parser doesn't handle quoted TOML keys.
  xdg.configFile."mise/config.toml".text = ''
    [tools]
    "nix:uv" = "latest"

    [env]
    _.python.venv = {
      path = ".venv", 
      create = true,
    }

    [settings]
    experimental = true
    python.uv_venv_auto = "create|source"
  '';

}
