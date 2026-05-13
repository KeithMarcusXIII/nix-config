perSystem:
{ lib, config, pkgs, ... }:
{
  home.packages = with pkgs; [
    uv                # Fast Python package manager (astral.sh)

    # Android reverse-engineering & device tools
    apktool           # Android APK reverse engineering
    payload-dumper-go # Android payload dumper
    scrcpy            # Android device screen mirroring
  ];
}
