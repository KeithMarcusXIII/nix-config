perSystem: {
  lib,
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    android-tools
    apktool
    payload-dumper-go
    scrcpy
    nodejs
  ];
}
