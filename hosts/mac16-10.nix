{
  config,
  pkgs,
  lib,
  ...
}: {
  system.stateVersion = 6;
  system.primaryUser = "keith";

  time.timeZone = "Asia/Kuala_Lumpur";

  # Disable HTML documentation build due to build failure
  # https://github.com/nix-darwin/nix-darwin/issues/1817
  documentation.enable = false;
  system.tools.darwin-uninstaller.enable = false;

  users.users.keith = {
    home = "/Users/keith";
  };

  # Whether to restart the computer after a power failure.
  power.restartAfterPowerFailure = true;
  power.sleep = {
    # Amount of idle time (in minutes) until the computer sleeps.
    computer = "never";
    # Amount of idle time (in minutes) until displays sleep.
    display = 10;
    # Amount of idle time (in minutes) until hard disks sleep.
    harddisk = "never";
  };

  # Host-specific nix daemon settings (overrides shared defaults)
  nix.settings.trusted-users = ["root" "@admin"];

  # Increase GPU wired memory limit from default (~3 GB) to 12 GB.
  # iogpu.wired_limit_mb is a private Apple sysctl — not guaranteed across
  # macOS versions. Runs during activation (darwin-rebuild + boot via
  # activate-system). Since macOS does not persist sysctl values across
  # reboots, this re-applies the setting every time the system activates.
  system.activationScripts.iogpu-wired-limit.text = ''
    sysctl -w iogpu.wired_limit_mb=12288 2>/dev/null || true
  '';
}
