perSystem: {
  lib,
  config,
  pkgs,
  # pkgs-unstable,
  ...
}: {
  imports = [
    ./vscodium
    ./opencodecommit
  ];

  home.packages = with pkgs; [
    iina # Modern media player
    moonlight-qt # NVIDIA GameStream / Sunshine client
    wechat # WeChat desktop client
    tailscale-gui # Tailscale GUI client for macOS
  ];
}
