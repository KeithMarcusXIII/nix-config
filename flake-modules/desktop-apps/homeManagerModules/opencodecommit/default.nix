{
  config,
  lib,
  pkgs,
  ...
}: {
  # ── LaunchAgent: Inject DEEPSEEK_API_KEY from sops-nix into launchd ──
  #
  # The opencodecommit extension reads the API key from the DEEPSEEK_API_KEY
  # environment variable (configured in config.toml as key-env = "DEEPSEEK_API_KEY").
  # sops-nix decrypts the key at the default system-level path, owned by keith:staff
  # with mode 0400 for user-readability (see darwinModules/default.nix).
  # This LaunchAgent reads that file and sets the env var in the user's launchd
  # domain at login, making it available to GUI applications like VSCodium.
  #
  # The sops-nix default path on macOS/nix-darwin is typically /run/secrets/<name>.
  # After darwin-rebuild switch, verify with:
  #   launchctl print user/$(id -u) | grep DEEPSEEK
  # If the env var appears, VSCodium will inherit it on next launch.
  launchd.agents.opencodecommit-env = {
    enable = true;
    config = {
      Label = "com.opencodecommit-env";
      ProgramArguments = [
        "/bin/sh"
        "-c"
        ''
          keyFile="/run/secrets/deepseek-api-key"
          if [ -f "$keyFile" ]; then
            launchctl setenv DEEPSEEK_API_KEY "$(cat "$keyFile")"
          else
            echo "WARNING: $keyFile not found — opencodecommit will not have API key" >&2
            logger -t opencodecommit-env "ERROR: $keyFile not found"
          fi
        ''
      ];
      RunAtLoad = true;
    };
  };
}
