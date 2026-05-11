perSystem:
{ lib, config, pkgs, ... }:
{
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
      "betterdisplay"
      "mac-mouse-fix"
      "raycast"
      "rectangle-pro"
      "stats"
      "zen-browser"
    ];
  };
}
