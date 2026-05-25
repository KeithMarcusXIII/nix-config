perSystem: {
  lib,
  config,
  pkgs,
  ...
}: {
  # All user packages migrated to named homeManagerModules:
  #   cli-tools, dev-sdks, desktop-apps
  # See flake.nix → home-manager.users.keith.imports
  home.packages = [];

  # ── nix.conf: include decrypted GitHub token snippet ────────
  # The token is decrypted by darwinModules sops-nix activation
  # (runs as root during darwin-rebuild switch).
  nix.extraOptions = ''
    !include ${config.home.homeDirectory}/.config/nix/nix.conf.d/50-github-token.conf
  '';
}
