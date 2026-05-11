perSystem:
{ lib, config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # Already present
    iina
    vscodium

    # Requested GUI applications
    android-studio
    moonlight-qt
    wechat-uos

    # Notable CLI tools (migrated from brew leaves + recommended dev tools)
    apktool          # Android APK reverse engineering
    bat              # cat with syntax highlighting
    btop             # Process/resource monitor
    delta            # git diff viewer
    direnv           # Per-directory environment variables
    eza              # Modern ls replacement
    fd               # Modern find replacement
    gh               # GitHub CLI
    payload-dumper-go # Android payload dumper
    scrcpy           # Android device screen mirroring
    tmux             # Terminal multiplexer
    uv               # Fast Python package manager (astral.sh)
  ];
}
