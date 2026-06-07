---
source: "https://github.com/VTimofeenko/writing-flake-modules"
commit: "a1bc156d374f2c1dbe52b8ce9a0a080ce738a490"
generated: "2026-06-06T15:07:00Z"
topic: "flake-parts"
description: "Minimal textbook examples: configurable inputs bumper, composable homeManagerModules, organizing code with importApply"
---

This file is a merged representation of a subset of the codebase, containing specifically included files and files not matching ignore patterns, combined into a single document by Repomix.
The content has been processed where content has been compressed (code blocks are separated by ⋮---- delimiter).

# File Summary

## Purpose
This file contains a packed representation of a subset of the repository's contents that is considered the most important context.
It is designed to be easily consumable by AI systems for analysis, code review,
or other automated processes.

## File Format
The content is organized as follows:
1. This summary section
2. Repository information
3. Directory structure
4. Repository files (if enabled)
5. Multiple file entries, each consisting of:
  a. A header with the file path (## File: path/to/file)
  b. The full contents of the file in a code block

## Usage Guidelines
- This file should be treated as read-only. Any changes should be made to the
  original repository files, not this packed version.
- When processing this file, use the file path to distinguish
  between different files in the repository.
- Be aware that this file may contain sensitive information. Handle it with
  the same level of security as you would the original repository.

## Notes
- Some files may have been excluded based on .gitignore rules and Repomix's configuration
- Binary files are not included in this packed representation. Please refer to the Repository Structure section for a complete list of file paths, including binary files
- Only files matching these patterns are included: **/*.nix
- Files matching these patterns are excluded: flake.lock
- Files matching patterns in .gitignore are excluded
- Files matching default ignore patterns are excluded
- Content has been compressed - code blocks are separated by ⋮---- delimiter
- Files are sorted by Git change count (files with more changes are at the bottom)

# Directory Structure
```
example-1-configurable-inputs-bumper/
  consumer/
    flake.nix
  provider/
    bumperModule.nix
    flake.nix
example-2-composable-home-manager-modules/
  bad-flake/
    flake.nix
    hmModule1.nix
    hmModule2.nix
  good-flake/
    flake.nix
    hmModule1.nix
    hmModule2.nix
    mkHomeManagerOutputsMerge.nix
example-3-organizing-code/
  flake-modules/
    foo/
      homeManagerModules/
        default.nix
      nixosModules/
        default.nix
      pkgs/
        foo.nix
      default.nix
  flake.nix
```

# Files

## File: example-1-configurable-inputs-bumper/consumer/flake.nix
```nix
{
  description = "Sample consumer flake for bumper flake module";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    devshell.url = "github:numtide/devshell";
    bumper.url = "github:VTimofeenko/writing-flake-modules?dir=example-1-configurable-inputs-bumper/provider";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.devshell.flakeModule
        inputs.bumper.flakeModule
      ];
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      perSystem = _: {
        devshells.default = { };
        bumper.changingInputs = [ "bumper" ];
        bumper.bumpAllInputs = true;
      };
    };
}
```

## File: example-1-configurable-inputs-bumper/provider/bumperModule.nix
```nix
{ flake-parts-lib, nixpkgs-lib, ... }: # This is the producer flake, the source for the module
let
  inherit (flake-parts-lib) mkPerSystemOption;
  inherit (nixpkgs-lib.lib)
    mkOption
    types
    mkEnableOption
    optional
    assertMsg
    ;
in
{
  config,
  self,
  inputs,
  ...
}: # This would be the consumer flake
{
  options.perSystem = mkPerSystemOption (
    { config, pkgs, ... }:
    let
      # Standard approach -- refer to this module's options' values as `cfg`
      cfg = config.bumper;
    in
    {
      options.bumper.changingInputs = mkOption {
        description = ''
          List of names of quickly changing inputs.

          This list will be turned into shell commands through devshell.
        '';
        type = types.listOf types.str;
        default = [ ];
      };

      # Option declaration
      options.bumper.bumpAllInputs = mkEnableOption "command to bump all inputs and commit";

      # Option implementation on top of devshell module
      config.devshells.default =
        let
          bumpScript = pkgs.writeShellApplication {
            name = "bump-input";
            runtimeInputs = [ ];
            text = builtins.readFile ./bump-input;
          };
        in
        {
          commands =
            (map (inputName: {
              help =
                # Double-check that the input actually exists
                # This is not strictly necessary as the wrapped nix flake does the same thing, but it's an illustration of referring to the consumer flake (self.inputs)
                assert assertMsg (builtins.elem inputName (
                  builtins.attrNames self.inputs
                )) "Input '${inputName}' does not exist in current flake. Check bumper settings.";
                "Bump input ${inputName}";
              name = "flake-bump-${inputName}"; # The name of the resulting script
              command = # bash
                "${pkgs.lib.getExe bumpScript} ${inputName}";
              category = "flake management";
            }) cfg.changingInputs)

            # Add a special case for bumping all inputs by handling the value of bumpAllInputs option
            ++ optional cfg.bumpAllInputs {
              help = "Bump all inputs";
              name = "flake-bump-all-inputs";
              command = # bash
                "${pkgs.lib.getExe bumpScript} \"*\"";
              category = "flake management";
            };
        };
    }
  );
}
```

## File: example-1-configurable-inputs-bumper/provider/flake.nix
```nix
{
  description = "Flake module with a bumper script";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs-lib.url = "github:NixOS/nixpkgs/nixos-unstable?dir=lib";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } (
      { flake-parts-lib, ... }:
      let
        inherit (flake-parts-lib) importApply;
      in
      {
        flake.flakeModule = importApply ./bumperModule.nix {
          inherit flake-parts-lib;
          inherit (inputs) nixpkgs-lib;
        };
      }
    );
}
```

## File: example-2-composable-home-manager-modules/bad-flake/flake.nix
```nix
{
  description = "Flake with two homeManagerModules outputs";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } (
      {
        flake-parts-lib,
        ...
      }:
      {
        imports = [
          ./hmModule1.nix
          ./hmModule2.nix
        ];
        systems = [
          "x86_64-linux"
          "aarch64-linux"
          "aarch64-darwin"
          "x86_64-darwin"
        ];
        perSystem =
          { pkgs, ... }:
          {
            packages.default = pkgs.hello;
          };
      }
    );
}
```

## File: example-2-composable-home-manager-modules/bad-flake/hmModule1.nix
```nix
_:
{
  flake.homeManagerModules.foo-1 =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.cowsay ];
    }
  ;
}
```

## File: example-2-composable-home-manager-modules/bad-flake/hmModule2.nix
```nix
_:
{
  flake.homeManagerModules.foo-2 =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.hello ];
    }
  ;
}
```

## File: example-2-composable-home-manager-modules/good-flake/flake.nix
```nix
{
  description = "Flake with two homeManagerModules outputs";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } (
      {
        flake-parts-lib,
        ...
      }:
      {
        imports = [
          ./mkHomeManagerOutputsMerge.nix
          ./hmModule1.nix
          ./hmModule2.nix
        ];
        systems = [
          "x86_64-linux"
          "aarch64-linux"
          "aarch64-darwin"
          "x86_64-darwin"
        ];
        perSystem =
          { pkgs, ... }:
          {
            packages.default = pkgs.hello;
          };
      }
    );
}
```

## File: example-2-composable-home-manager-modules/good-flake/hmModule1.nix
```nix
_:
{
  flake.homeManagerModules.foo-1 =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.cowsay ];
    }
  ;
}
```

## File: example-2-composable-home-manager-modules/good-flake/hmModule2.nix
```nix
_:
{
  flake.homeManagerModules.foo-2 =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.hello ];
    }
  ;
}
```

## File: example-2-composable-home-manager-modules/good-flake/mkHomeManagerOutputsMerge.nix
```nix
# Flake module that declares flake.homeManagerModules outputs and how to merge it
{
  lib,
  # , self
  flake-parts-lib,
  moduleLocation,
  ...
}:
let
  inherit (lib) mapAttrs mkOption types;
  inherit (flake-parts-lib) mkSubmoduleOptions;
in
{
  options = {
    flake = mkSubmoduleOptions {
      homeManagerModules = mkOption {
        type = types.lazyAttrsOf types.unspecified;
        default = { };
        apply = mapAttrs (
          k: v: {
            _file = "${toString moduleLocation}#homeManagerModules.${k}";
            imports = [ v ];
          }
        );
        description = ''
          Home Manager modules.

          You may use this for reusable pieces of configuration, service modules, etc.
        '';
      };
    };
  };
}
```

## File: example-3-organizing-code/flake-modules/foo/homeManagerModules/default.nix
```nix
perSystem:
{ lib, ... }:
{
  systemd.user.services.foo = {
    Service = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = lib.getExe perSystem.config.packages.foo;
    };
    Install.WantedBy = [ "default.target" ];
  };
}
```

## File: example-3-organizing-code/flake-modules/foo/nixosModules/default.nix
```nix
perSystem: # How the per-system part of flake is passed
{ lib, ... }: # Standard module arguments
# TODO: remainafterexit
{
  systemd.services.foo = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = lib.getExe perSystem.config.packages.foo;
    };
  };
}
```

## File: example-3-organizing-code/flake-modules/foo/pkgs/foo.nix
```nix
# A very realistic package
{ hello }:
hello
```

## File: example-3-organizing-code/flake-modules/foo/default.nix
```nix
# The importApply argument. Use this to reference things defined locally,
# as opposed to the flake where this is imported.
localFlake:

# Regular module arguments; self, inputs, etc all reference the final user flake,
# where this module was imported.
{ lib, config, self, inputs, ... }:
{
  perSystem =
    { system, ... }:
    {
      packages.foo = localFlake.withSystem system (
        { config, pkgs, ... }: pkgs.callPackage ./pkgs/foo.nix { }
      );

      checks.foo-nixos-module = localFlake.withSystem system (
        { config, pkgs, ... }:
        pkgs.testers.runNixOSTest {
          name = "foo-nixos-module";
          nodes.machine1 =
            _: # { config, pkgs, ... }:
            { imports = [ self.nixosModules.foo ]; };
          testScript = ''
            _, output = machine.systemctl("status foo")

            assert "Hello, world" in output
          '';
        }
      );

      checks.foo-hm-module = localFlake.withSystem system (
        { config, pkgs, ... }:
        pkgs.testers.runNixOSTest {
          name = "foo-hm-module";
          nodes.machine1 =
            _: # { config, pkgs, ... }:
            {
              imports = [ inputs.home-manager.nixosModules.home-manager ];
              users.users.alice = {
                isNormalUser = true;
                password = "hunter2";
              };

              home-manager.users.alice =
                _: # { config, ... }: # config is home-manager's config, not the OS one
                {
                  imports = [ self.homeManagerModules.foo ];
                  home.stateVersion = "23.11";
                };
            };
          testScript = ''
            machine.wait_until_tty_matches("1", "login: ")
            machine.send_chars("alice\n")
            machine.wait_until_tty_matches("1", "Password: ")
            machine.send_chars("hunter2\n")
            machine.wait_until_tty_matches("1", "alice\@machine")

            machine.wait_for_unit("home-manager-alice.service")
            _, output = machine.systemctl("status foo", user="alice")

            assert "Hello, world" in output
          '';
        }
      );
    };

  flake.nixosModules.foo = localFlake.moduleWithSystem (
    perSystem@{ config }: localFlake.importApply ./nixosModules perSystem
  );

  flake.homeManagerModules.foo = localFlake.moduleWithSystem (
    perSystem@{ config }: localFlake.importApply ./homeManagerModules perSystem
  );
}
```

## File: example-3-organizing-code/flake.nix
```nix
{
  description = "Flake with a flake module";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs@{ flake-parts, home-manager, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } (
      { withSystem, moduleWithSystem, flake-parts-lib, ... }:
      let
        inherit (flake-parts-lib) importApply;
        foo-flake-mod = importApply ./flake-modules/foo { inherit withSystem moduleWithSystem importApply; };
      in
      {
        imports = [ foo-flake-mod ];
        systems = [
          "x86_64-linux"
          "aarch64-linux"
          "aarch64-darwin"
          "x86_64-darwin"
        ];
        # the rest of the flake.nix
      }
    );
}
```
