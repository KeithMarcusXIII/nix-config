perSystem:
{ lib, config, pkgs, ... }:
{
  # Let home-manager share the darwin nixpkgs instance (config + overlays)
  home-manager.useGlobalPkgs = true;

  nixpkgs.config = {
    android_sdk.accept_license = true;
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    # Core CLI utilities
    git
    ripgrep
    wget
    tree
    jq
    fzf

    # Container runtime (Colima + Docker CLI)
    colima
    docker
    docker-compose
    docker-buildx

    # Services & system-level tools
    sunshine
    qemu
    ollama
  ];

  homebrew = {
    enable = true;
    casks = [
      # macOS GUI apps (not in nixpkgs)
      "android-studio"
      "betterdisplay"
      "mac-mouse-fix"
      "raycast"
      "rectangle-pro"
      "stats"
      "zen-browser"
    ];
  };
}
