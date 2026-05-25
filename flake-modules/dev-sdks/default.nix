localFlake: {
  lib,
  config,
  self,
  inputs,
  ...
}: {
  flake.homeManagerModules.dev-sdks = localFlake.moduleWithSystem (
    perSystem @ {config}: localFlake.importApply ./homeManagerModules perSystem
  );
}
