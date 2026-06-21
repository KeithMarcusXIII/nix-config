localFlake: {
  lib,
  config,
  self,
  inputs,
  ...
}: {
  flake.darwinModules.cli-tools = localFlake.moduleWithSystem (
    perSystem @ {config}: localFlake.importApply ./darwinModules perSystem
  );
  flake.homeManagerModules.cli-tools = localFlake.moduleWithSystem (
    perSystem @ {config}: localFlake.importApply ./homeManagerModules perSystem
  );
}
