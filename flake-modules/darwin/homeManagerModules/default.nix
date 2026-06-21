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

  # ── MCP servers (global registry) ───────────────────────────
  # Consumed by VSCodium (enableMcpIntegration), OpenCodeCommit,
  # or any other editor/tool that supports programs.mcp.
  programs.mcp.enable = true;

  programs.mcp = {
    servers = {
      # NixOS MCP — query nixpkgs, NixOS options, and more
      # https://github.com/utensils/mcp-nixos
      nixos = {
        command = "mcp-nixos";
      };
    };
  };

  # ── macOS application bundles ────────────────────────────
  # rsync copies .app bundles from home.packages to a custom
  # volume path (not the default ~/Applications/Home Manager Apps),
  # matching the Homebrew cask appdir.
  targets.darwin.copyApps = {
    enable = true;
    directory = "/Volumes/Macintosh Dock/Users/keith/Applications";
  };
}
