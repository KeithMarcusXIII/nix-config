{ config, pkgs, lib, ... }:
{
  system.stateVersion = 6;
  system.primaryUser = "keith";

  time.timeZone = "Asia/Kuala_Lumpur";

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
  };

  # Host-specific nix daemon settings (overrides shared defaults)
  nix.settings.trusted-users = [ "root" "@admin" ];
}
