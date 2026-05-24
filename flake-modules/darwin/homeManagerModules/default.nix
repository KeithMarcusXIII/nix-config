perSystem:
{ lib, config, pkgs, ... }:
{
  # All user packages migrated to named homeManagerModules:
  #   cli-tools, dev-sdks, desktop-apps
  # See flake.nix → home-manager.users.keith.imports
  home.packages = [ ];

  # ── sops-nix: decrypt GitHub token to nix.conf include dir ──
  sops.secrets."github-token" = {
    sopsFile = ../../../secrets/secrets.yaml;
    path = "${config.home.homeDirectory}/.config/nix/nix.conf.d/50-github-token.conf";
    owner = config.users.users.keith.name;
    group = "staff";
  };

  # ── nix.conf: include the decrypted snippet ─────────────────
  nix.extraOptions = ''
    !include ${config.home.homeDirectory}/.config/nix/nix.conf.d/50-github-token.conf
  '';
}
