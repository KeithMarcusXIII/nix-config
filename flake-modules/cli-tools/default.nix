localFlake:
{ lib, config, self, inputs, ... }:
{
  flake.homeManagerModules.cli-tools = localFlake.moduleWithSystem (
    perSystem@{ config }: localFlake.importApply ./homeManagerModules perSystem
  );
}
