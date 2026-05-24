perSystem: {
  lib,
  config,
  pkgs,
  pkgs-unstable,
  ...
}: let
  # Apps to auto-start at login via macOS Login Items (System Settings → General → Login Items)
  # These register as type:app (0x2) entries — no "run in background" notification.
  loginItems = [
    {
      name = "Tabby";
      path = "/Volumes/Macintosh Dock/Applications/Tabby.app";
    }
    {
      name = "Mac Mouse Fix";
      path = "/Volumes/Macintosh Dock/Applications/Mac Mouse Fix.app";
    }
  ];

  makeLoginLine = {
    name,
    path,
  }: ''
    if not (exists login item "${name}") then
      make login item at end with properties {name:"${name}", path:"${path}", hidden:false}
    end if
  '';
in {
  # ── sops-nix: age key for secret decryption ─────────────────
  sops = {
    age.keyFile = "${config.users.users.keith.home}/.config/sops/age/keys.txt";
  };

  nixpkgs.config = {
    android_sdk.accept_license = true;
    allowUnfree = true;
  };

  nix = {
    settings = {
      # Multi-user daemon mode — requires build-users-group to delegate builds
      build-users-group = "nixbld";
      experimental-features = ["flakes" "nix-command"];

      # Build parallelism (auto = detect available cores)
      max-jobs = "auto";

      # Keep build logs and derivations for debugging
      keep-build-log = true;
      keep-derivations = true;

      # Automatic store optimization disabled (matching committed default)
      auto-optimise-store = false;

      # Binary cache substituters
      substituters = ["https://cache.nixos.org/"];
      trusted-public-keys = ["cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="];
    };
  };

  # Autostart colima at login via LaunchAgent (brew services won't work for nix-installed colima)
  # launchd.user.agents.colima = {
  #   enable = true;
  #   serviceConfig = {
  #     Label = "com.github.colima";
  #     ProgramArguments = [
  #       "${pkgs-unstable.colima}/bin/colima"
  #       "start"
  #     ];
  #     RunAtLoad = true;
  #     KeepAlive = false;
  #     StandardOutPath = "/tmp/colima.stdout.log";
  #     StandardErrorPath = "/tmp/colima.stderr.log";
  #   };
  # };

  environment.systemPackages = with pkgs; [
    # Core CLI utilities
    ripgrep
    wget
    tree
    jq
    fzf

    # Nix tooling
    nil # Nix language server
    alejandra # Nix formatter

    # Container runtime (Colima from nixpkgs-unstable — stable nixpkgs has EOL lima)
    pkgs-unstable.colima
    docker
    docker-compose
    docker-buildx
  ];

  system.defaults = {
    dock.autohide = true;
    dock.tilesize = 32;
    dock.persistent-apps = [
      {app = "/System/Applications/Apps.app";}
      # { app = "/System/Volumes/Preboot/Cryptexes/App/System/Applications/Safari.app"; }
      {app = "/Volumes/Macintosh Dock/Applications/Zen.app";}
      {app = "/System/Applications/Messages.app";}
      {app = "/System/Applications/Mail.app";}
      {app = "/System/Applications/Maps.app";}
      {app = "/System/Applications/Photos.app";}
      {app = "/System/Applications/FaceTime.app";}
      {app = "/System/Applications/Calendar.app";}
      {app = "/System/Applications/Contacts.app";}
      {app = "/System/Applications/Reminders.app";}
      {app = "/System/Applications/Notes.app";}
      {app = "/System/Applications/TV.app";}
      {app = "/System/Applications/Music.app";}
      {app = "/System/Applications/App Store.app";}
      {app = "/System/Applications/System Settings.app";}
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
      cleanup = "uninstall";
    };
    caskArgs.appdir = "/Volumes/Macintosh Dock/Applications";
    taps = [
      {
        name = "jundot/omlx";
        clone_target = "https://github.com/jundot/omlx";
        force_auto_update = true;
      }
      {
        name = "lizardbyte/homebrew";
        clone_target = "https://github.com/LizardByte/homebrew-homebrew";
        force_auto_update = true;
      }
    ];
    brews = [
      {
        name = "omlx";
        start_service = true;
      }
      "sunshine"
    ];
    casks = [
      "android-studio"
      "betterdisplay"
      "epic-games"
      "mac-mouse-fix"
      "raycast"
      "rectangle-pro"
      "stats"
      "zen"
      "vscodium"
      "tabby"
    ];
  };

  # Autostart Tabby at login via LaunchAgent
  # launchd.user.agents.tabby = {
  #   serviceConfig = {
  #     Label = "com.github.tabby";
  #     ProgramArguments = [
  #       "open"
  #       "/Volumes/Macintosh Dock/Applications/Tabby.app"
  #       "--args"
  #       "-silent"
  #       "-launchcontext=boot"
  #     ];
  #     RunAtLoad = true;
  #     KeepAlive = false;
  #     LimitLoadToSessionType = "Aqua";
  #   };
  # };

  # Register apps as macOS Login Items (no background notifications)
  system.activationScripts.login-items.text = ''
    sudo -u keith osascript -e '
      tell application "System Events"
        ${builtins.concatStringsSep "\n        " (map makeLoginLine loginItems)}
      end tell
    ' 2>/dev/null || true
  '';
}
