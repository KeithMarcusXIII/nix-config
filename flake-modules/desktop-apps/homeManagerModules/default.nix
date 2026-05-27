perSystem: {
  lib,
  config,
  pkgs,
  # pkgs-unstable,
  ...
}: {
  imports = [
    ./vscodium
  ];

  home.packages = with pkgs; [
    iina # Modern media player
    moonlight-qt # NVIDIA GameStream / Sunshine client
    wechat # WeChat desktop client
  ];
}
