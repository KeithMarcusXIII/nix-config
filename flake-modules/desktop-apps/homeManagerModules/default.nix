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
    iina 
    # moonlight-qt 
    wechat
  ];
}
