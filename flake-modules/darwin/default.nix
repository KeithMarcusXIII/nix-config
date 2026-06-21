localFlake: {
  lib,
  config,
  self,
  inputs,
  ...
}: {
  flake = {
    darwinModules.default = localFlake.moduleWithSystem (
      perSystem @ {config}: localFlake.importApply ./darwinModules perSystem
    );
    homeManagerModules.darwin = localFlake.moduleWithSystem (
      perSystem @ {config}: localFlake.importApply ./homeManagerModules perSystem
    );
  };
}
