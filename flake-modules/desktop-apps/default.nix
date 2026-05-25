localFlake: {
  lib,
  config,
  self,
  inputs,
  ...
}: {
  flake.homeManagerModules.desktop-apps = localFlake.moduleWithSystem (
    perSystem @ {config}: localFlake.importApply ./homeManagerModules perSystem
  );
}
