perSystem:
{ lib, config, pkgs, pkgs-unstable, ... }:
{
  home.packages = with pkgs-unstable; [
    iina              # Modern media player
    moonlight-qt      # NVIDIA GameStream / Sunshine client
    wechat            # WeChat desktop client
  ];
}
