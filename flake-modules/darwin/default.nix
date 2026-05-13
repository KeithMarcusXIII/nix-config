localFlake:
{ lib, config, self, inputs, ... }:
{
  perSystem =
    { system, ... }:
    {
      checks.darwin-module-check = localFlake.withSystem system (
        { pkgs, ... }:
        pkgs.runCommand "darwin-module-check" { } "touch $out"
      );
    };

  flake.darwinModules.default = localFlake.moduleWithSystem (
    perSystem@{ config }: localFlake.importApply ./darwinModules perSystem
  );
}
