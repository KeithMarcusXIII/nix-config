perSystem: {
  lib,
  config,
  pkgs,
  # pkgs-unstable,
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
  # ── sops-nix: decrypt secrets ───────────────────────────────
  sops = {
    age.keyFile = "${config.users.users.keith.home}/.config/sops/age/keys.txt";
    defaultSopsFile = ../../../secrets/secrets.yaml;
    secrets."github-token" = {
      path = "${config.users.users.keith.home}/.config/nix/nix.conf.d/50-github-token.conf";
      owner = config.users.users.keith.name;
      group = "staff";
      mode = "0400";
    };
    # Decrypts DeepSeek API key at the default sops-nix path. The key is consumed
    # by a home-manager LaunchAgent that runs launchctl setenv on login, injecting
    # DEEPSEEK_API_KEY into the user's launchd domain for GUI apps like VSCodium.
    # See _bmad-output/planning-artifacts/opencodecommit-secret-injection.md
    secrets."deepseek-api-key" = {
      owner = config.users.users.keith.name;
      group = "staff";
      mode = "0400";
    };
    secrets."bws-access-token" = {
      owner = config.users.users.keith.name;
      group = "staff";
      mode = "0400";
    };
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

  # Ensure nix-darwin's activate-system retries if the external nix store
  # volume isn't mounted yet at boot. Without KeepAlive, a transient failure
  # (exit 126) permanently prevents darwin-rebuild from being available.
  launchd.daemons.activate-system = {
    serviceConfig = {
      KeepAlive = {
        SuccessfulExit = false;
      };
      ThrottleInterval = 10;
    };
  };

  # oMLX LLM inference server — data on external volume via --base-path.
  # Replaces Homebrew-managed service (start_service = false below).
  launchd.user.agents.omlx = {
    serviceConfig = {
      ProgramArguments = [
        "/opt/homebrew/bin/omlx" "serve"
        "--base-path" "/Volumes/Macintosh Dock/Users/keith/.omlx"
      ];
      KeepAlive = true;
      RunAtLoad = true;
      WorkingDirectory = "/Volumes/Macintosh Dock/Users/keith/.omlx";
      # Console output (startup banner, binding info) — separate from oMLX's
      # application log at {base_path}/logs/server.log.  Uses ~/Library/Logs
      # per macOS user launch agent conventions.
      StandardOutPath = "/Users/keith/Library/Logs/omlx/launchd.log";
      StandardErrorPath = "/Users/keith/Library/Logs/omlx/launchd.log";
      EnvironmentVariables = {
        PATH = "/opt/homebrew/bin:/opt/homebrew/sbin:/usr/bin:/bin:/usr/sbin:/sbin";
      };
    };
  };

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
        start_service = false;
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
      "pearcleaner"
      "ungoogled-chromium"
      "folx"
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

  # Prepare directories for services that depend on the external volume.
  # oMLX data lives on /Volumes/Macintosh Dock; the launchd agents for
  # oMLX and Mac Mouse Fix retry via KeepAlive until the volume appears.
  system.activationScripts.external-volume-services.text = ''
    omlxBase="/Volumes/Macintosh Dock/Users/keith/.omlx"
    if [ -d "/Volumes/Macintosh Dock" ]; then
      mkdir -p "$omlxBase"/{models,cache,logs}
    fi
    # macOS convention: user launch agent logs in ~/Library/Logs/<service>/
    mkdir -p /Users/keith/Library/Logs/omlx
    mkdir -p /Users/keith/Library/Logs/mac-mouse-fix
  '';
}
