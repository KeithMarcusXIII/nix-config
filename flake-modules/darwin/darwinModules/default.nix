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
  ];

  system.defaults = {
    dock.autohide = true;
    dock.tilesize = 32;
    dock.persistent-apps = [
      { app = "/System/Applications/Apps.app"; }
      # { app = "/System/Volumes/Preboot/Cryptexes/App/System/Applications/Safari.app"; }
      { app = "/Applications/Zen.app"; }
      { app = "/System/Applications/Messages.app"; }
      { app = "/System/Applications/Mail.app"; }
      { app = "/System/Applications/Maps.app"; }
      { app = "/System/Applications/Photos.app"; }
      { app = "/System/Applications/FaceTime.app"; }
      { app = "/System/Applications/Calendar.app"; }
      { app = "/System/Applications/Contacts.app"; }
      { app = "/System/Applications/Reminders.app"; }
      { app = "/System/Applications/Notes.app"; }
      { app = "/System/Applications/TV.app"; }
      { app = "/System/Applications/Music.app"; }
      { app = "/System/Applications/App Store.app"; }
      { app = "/System/Applications/System Settings.app"; }
    ];
    finder.ShowPathbar = true;
    finder.ShowStatusBar = true;
  };

  homebrew = {
    enable = true;
    onActivation = {
      extraFlags = [
        "--verbose"
      ];
      cleanup = "zap";
      extraEnv = {
        HOMEBREW_CASK_OPTS = "--appdir=/Volumes/Macintosh\\ Dock/Applications";
      };
    };
    taps = [
      {
        name = "jundot/omlx";
        clone_target = "https://github.com/jundot/omlx";
        force_auto_update = true;
      }
    ];
    brews = [
      # {
      #   name = "omlx";
      #   start_service = true;
      # }
    ];
    casks = [
      # "android-studio"
      # "betterdisplay"
      # "mac-mouse-fix"
      "raycast"
      # "rectangle-pro"
      # "stats"
      # "zen"
    ];
  };
}
