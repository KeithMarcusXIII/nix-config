{ config, pkgs, lib, ... }:
{
  system.stateVersion = 5;
  system.primaryUser = "keith";

  users.users.keith = {
    home = "/Users/keith";
  };
}
