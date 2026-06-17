perSystem: {
  lib,
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # Android reverse-engineering & device tools
    android-tools
    apktool # Android APK reverse engineering
    payload-dumper-go # Android payload dumper
    scrcpy # Android device screen mirroring
  ];
}
