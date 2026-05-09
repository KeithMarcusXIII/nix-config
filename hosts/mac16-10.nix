{ config, pkgs, lib, ... }:
{
  system.stateVersion = 5;

  users.users.keith = {
    isNormalUser = true;
    createHome = true;
    home = "/Users/keith";
  };
}
