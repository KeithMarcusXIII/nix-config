     Flake-parts: writing custom flake modules | Vladimir Timofeenko's blog

1.  [~vtimofeenko](https://vtimofeenko.com/)
2.  /[blog](..)
3.  /[flake parts writing custom flake modules](.)

*   [rss](/index.xml)
*   [projects](/projects/)

# Flake-parts: writing custom flake modules

Published on May 1, 2024

# Table of contents

*   [Background](#background)
*   [Example: typical use case for consuming modules](#example-typical-use-case-for-consuming-modules)
*   [Example: writing configurable inputs bumper](#example-writing-configurable-inputs-bumper)
    *   [Interface](#interface)
    *   [The module](#the-module)
    *   [Example usage](#example-usage)
*   [Example: composable homeManagerModules](#example-composable-homemanagermodules)
*   [Example: organizing code using flake modules](#example-organizing-code-using-flake-modules)
    *   [`flake.nix`](#flakenix)
    *   [Declaring a package](#declaring-a-package)
    *   [Writing a NixOS module](#writing-a-nixos-module)
    *   [Writing a Home Manager module](#writing-a-home-manager-module)
    *   [Scaling to multiple flake-modules](#scaling-to-multiple-flake-modules)

A primer on writing [flake-parts](https://flake.parts) reusable flake modules.

# Background [#](#background "header link")

[Flake-parts](https://flake.parts) is a project that, on the surface, is in the same field as flake-utils, flake-tools and a couple of other abstractions on top of the standard flake syntax. Its killer feature, however, is in the flake modules which allow reusing one flake’s components in another flake.

Flake modules behave very similarly to NixOS or Home Manager modules, but they act on the flake itself, changing its outputs.

I have been on board the flake-parts train for quite a while and find it indispensable for both maintaining a couple of long-running projects and setting up quick ad-hoc flakes that might later evolve into a new project or get merged into a pre-existing project.

# Example: typical use case for consuming modules [#](#example-typical-use-case-for-consuming-modules "header link")

The module I use in pretty much all of my projects is [devshell](https://flake.parts/options/devshell). When combined with [direnv](https://direnv.net/), it shows a neat menu whenever I `cd` into a project directory:

```
❯ cd $<projectDir>
direnv: loading /tmp/tmp.JfrD4VJy4a/.envrc
direnv: using flake
direnv: nix-direnv: using cached dev shell
🔨 Welcome to devshell

[[general commands]]

  hello - print hello
  menu  - prints this menu

direnv: export +DEVSHELL_DIR +IN_NIX_SHELL +NIXPKGS_PATH +PRJ_DATA_DIR +PRJ_ROOT +name ~PATH ~XDG_DATA_DIRS
```

And this is achieved with a `flake.nix` file that looks like this:

flake.nix with simple devshell

```nix
{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    devshell.url = "github:numtide/devshell";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ inputs.devshell.flakeModule ];
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      perSystem =
        _:
        {
          devshells.default = {
            commands = [
              {
                help = "print hello";
                name = "hello";
                command = "echo hello";
              }
            ];
          };
        };
    };
}
```

All aspects of the displayed menu and the underlying devshell can be configured through a corresponding [flake module option](https://flake.parts/options/devshell#options). The options are also programmable, for example if your flake includes several packages, they can all be dynamically exposed in that menu:

```
❯ menu        

[[general commands]]

  hello       - print hello
  menu        - prints this menu

[this flake's packages]

  run-cmatrix - run flake's package run-cmatrix
  run-cowsay  - run flake's package run-cowsay
```

Sample flake.nix with dynamic devshell commands

```nix
{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    devshell.url = "github:numtide/devshell";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ inputs.devshell.flakeModule ];
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      perSystem =
        { pkgs, self', ... }:
        let
          inherit (pkgs) lib;
        in
        {
          packages = rec {
            default = cowsay;
            inherit (pkgs) cowsay cmatrix;
          };
          devshells.default = {
            commands =
              lib.pipe self'.packages [ # Take own packages
                lib.attrsToList # Turn into a list of { name = "hello"; value = pkgs.hello; }
                (lib.filter (a: a.name != "default")) # Remove "default" package
                (map (a: rec {
                  name = "run-${a.name}";
                  help = "run flake's package ${name}";
                  package = a.value;
                  category = "this flake's packages";
                })) # Transform the list into the schema compatible with devshell commands
              ]
              ++ [ # Manually specified commands
                {
                  help = "print hello";
                  name = "hello";
                  command = "echo hello";
                }
              ]

            ;
          };
        };
    };
}
```

# Example: writing configurable inputs bumper [#](#example-writing-configurable-inputs-bumper "header link")

When I work on flake projects, I frequently need to bump inputs one by one. These actions are usually followed by commits with creative messages like “bumping inputs”, “\[ci\] bump inputs” or “ff”.

Let’s write a flake module which creates devshell commands for specific modules which need to be bumped often. This would basically be a wrapper around `nix flake update --commit-lock-file` with an optional `--update-input` that shows up in project’s `$PATH` for quick access.

For the purposes of this section, “provider” flake is the one containing bumper flake module and the “consumer” flake is the one that imports it.

## Interface [#](#interface "header link")

Starting with the interface in `flake.nix`. Unlike `services.` and `programs.` options in NixOS modules, there is no convention for `option.enable` for flake-modules. So the consumer would import this module like so:

```nix
{
  inputs.bumper-flake-module.url = "<url>";
  inputs.devshell.url = "github:numtide/devshell";
  input1 = "<ref_1>"; # This input needs to be bumped often
  input2 = "<ref_2>"; # This input needs to be bumped often

  outputs =
  # ...
  {
    imports = [
      inputs.devshell.flakeModule
      bumper-flake-module.flakeModule
    ];
  
    perSystem = _: {
      bumper = {
        changingInputs = [ "input1" "input2" ];
        bumpAllInputs = true; # Adds a "bump all inputs" command
      };
    }
  };
}
```

And then see the commands in a menu:

```
direnv: using flake
direnv: nix-direnv: using cached dev shell
🔨 Welcome to devshell
# ...
[flake management]

  flake-bump-all-inputs       - Bump all inputs
  flake-bump-input1           - Bump input input1
  flake-bump-input2           - Bump input input2
```

## The module [#](#the-module "header link")

The flake modules operate the same way as NixOS modules – by computing a fixed point for the merge operation on attrsets. Similar to the standard modules, the modules are a function, but unlike the standard modules the default arguments are components of the consumer flake instead of the NixOS configuration.

For proper variable binding, it’s possible to use the `importApply` pattern to produce the flake module based on the values in the provider flake.

The full source code for the module and the script is [here](https://github.com/VTimofeenko/writing-flake-modules/blob/master/example-1-configurable-inputs-bumper/provider/bumperModule.nix), but the most important parts are:

```nix
# Top-level parameters that are bound to the provider flake
# These are passed from `flake.nix` using importApply
{ flake-parts-lib, nixpkgs-lib, ... }:
# ...
# These values would bind to the consumer flake when this flake module is imported:
{ config, self, inputs, ... }:
# ...
# This is an example of using the consumer's flake values to generate the
# scripts
      help =
        # Double-check that the input actually exists
        # This is not strictly necessary as the wrapped nix flake does the same thing, but it's an illustration of referring to the consumer flake (self.inputs)
        assert assertMsg (builtins.elem inputName (
          builtins.attrNames self.inputs
        )) "Input '${inputName}' does not exist in current flake. Check bumper settings.";
        "Bump input ${inputName}";
# ...
```

This module gets turned into a flake module in `flake.nix` by [importing](https://github.com/VTimofeenko/writing-flake-modules/blob/master/example-1-configurable-inputs-bumper/provider/flake.nix#L17) `bumperModule.nix` and applying it to the arguments passed from provider flake (`flake-parts-lib` and `nixpkgs-lib`).

The bumper script source is [here](https://github.com/VTimofeenko/writing-flake-modules/blob/master/example-1-configurable-inputs-bumper/provider/bump-input). It’s a thin wrapper around `nix flake update`, so it’s not terribly interesting.

## Example usage [#](#example-usage "header link")

This is what the consumer experience would look like when using this module:

```
direnv: using flake
direnv: nix-direnv: renewed cache
🔨 Welcome to devshell

[[general commands]]

  menu                  - prints this menu

[flake management]

  flake-bump-all-inputs - Bump all inputs
  flake-bump-bumper     - Bump input bumper

direnv: export +DEVSHELL_DIR +IN_NIX_SHELL +NIXPKGS_PATH +PRJ_DATA_DIR +PRJ_ROOT +name ~PATH ~XDG_DATA_DIRS
# <a commit is pushed out to bumper repo>
❯ flake-bump-bumper    
# ...
# And we have a commit with the custom message:
❯ git log -1 --pretty=format:%s%b
[ci]: bumping bumperFlake lock file updates:

• Updated input 'bumper':
    'github:VTimofeenko/writing-flake-modules/d78ffddd6d9523bddcc9f7700543c3b252830f3f?dir=example-1-configurable-inputs-bumper/provider' (2024-05-01)
  → 'github:VTimofeenko/writing-flake-modules/d870ba6194b17e10be72e65d21fc2793c3863212?dir=example-1-configurable-inputs-bumper/provider' (2024-05-01)
```

A sample flake is in the same repository, under [“consumer”](https://github.com/VTimofeenko/writing-flake-modules/tree/master/example-1-configurable-inputs-bumper/consumer).

# Example: composable homeManagerModules [#](#example-composable-homemanagermodules "header link")

Let’s build a flake module which will allow `homeManagerModules` output to compose, like `nixosModules` do. A flake module like that becomes necessary when multiple flake modules declare `homeManagerModules` output and flake-parts becomes confused about merging those modules.

To demonstrate this ([“bad” flake](https://github.com/VTimofeenko/writing-flake-modules/tree/master/example-2-composable-home-manager-modules/bad-flake)):

```nix
# flake.nix
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

# hmModule1.nix
_:
{
  flake.homeManagerModules.foo-1 =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.cowsay ];
    }
  ;
}

# hmModule2.nix
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

`nix flake check` would complain:

```
       error: The option `flake.homeManagerModules' is defined multiple times while it's expected to be unique.

       Definition values:
       - In `/nix/store/8bxvqk4349b3irgk45w8fy06wjb7sqc6-source/hmModule1.nix':
           {
             foo-1 = <function, args: {pkgs}>;
           }
       - In `/nix/store/8bxvqk4349b3irgk45w8fy06wjb7sqc6-source/hmModule2.nix':
           {
             foo-2 = <function, args: {pkgs}>;
           }
       Use `lib.mkForce value` or `lib.mkDefault value` to change the priority on any of these definitions.
```

This happens because `homeManagerModules` is just a random output with no specified way to merge it.

NixOS modules, on the other hand, don’t produce the same error (just replace `flake.homeManagerModules` with `flake.nixosModules`). This happens because flake-parts explicitly define how to merge the `flake.nixosModules` option [here](https://github.com/hercules-ci/flake-parts/blob/main/modules/nixosModules.nix). Solution is to do a bit of `s;nixosModules;homeManagerModules;g`:

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

And import it in the flake ([“good” flake](https://github.com/VTimofeenko/writing-flake-modules/tree/master/example-2-composable-home-manager-modules/good-flake)):

```patch
        imports = [
+         ./mkHomeManagerOutputsMerge.nix
          ./hmModule1.nix
          ./hmModule2.nix
        ];
```

Now `nix flake check` stops complaining:

```
❯ nix flake check && echo "SUCCESS"
warning: unknown flake output 'homeManagerModules'
warning: The check omitted these incompatible systems: aarch64-darwin, aarch64-linux, x86_64-darwin
Use '--all-systems' to check all.
SUCCESS
```

# Example: organizing code using flake modules [#](#example-organizing-code-using-flake-modules "header link")

TL;DR: [example code](https://github.com/VTimofeenko/writing-flake-modules/tree/master/example-3-organizing-code).

In addition to the aforementioned output reusability/configuration across flakes I found flake-modules very useful for code organization within a monorepo-like project.

Say you have a project that has the following outputs:

1.  Exposes a package definition (`packages.foo`)
2.  Has a NixOS module for that package (`nixosModules.foo`)
3.  Has a home manager module for that package (`homeManagerModules.foo`)
4.  Has checks for different aspects of the package

With the standard approach, the code implementing all of those outputs could be scattered across different directories (package in `packages/foo`, modules in `modules/nixos`, etc.) and in different parts of the `flake.nix` file.

This might lead to related code changes being done in different directories complicating the diffs.

Flake modules allow putting all that code in a single directory (say, `flake-modules/foo`) and importing it once in the `flake.nix` file.

This section follows the development process of the sample flake module with trusty `pkgs.hello` being the stand-in for `packages.foo`. The main syntax inspiration is [“Dogfood a Reusable Flake Module”](https://flake.parts/dogfood-a-reusable-module) from the official documentation.

## `flake.nix` [#](#flakenix "header link")

The easy part: setting up `flake.nix` and importing the future flake module:

```shell
❯ cd $(mktemp -d)
❯ mkdir -p flake-modules/foo
❯ nix flake init -t github:hercules-ci/flake-parts
wrote: /tmp/tmp.9EKwLKT4Fi/flake.nix
# Stub flake module so flake show works
❯ echo "_: {}" > flake-modules/foo/default.nix
❯ $EDITOR flake.nix
```

Resulting flake.nix with the module import

```nix
{
  description = "Flake with a flake module";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } (
      { withSystem, flake-parts-lib, ... }:
      let
        inherit (flake-parts-lib) importApply;
        foo-flake-mod = importApply ./flake-modules/foo { inherit withSystem; };
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

Now `nix flake show` shows (for now, an empty) flake:

```shell
❯ nix flake show
path:/tmp/tmp.9EKwLKT4Fi?lastModified=1714330880&narHash=sha256-DSvBWp/ReLzfchwoOJpzm%2BONWgyZjVwnrf/m1GJfmvo%3D
```

## Declaring a package [#](#declaring-a-package "header link")

To add a package, the `flake-modules/foo/default.nix` should now be changed to look like this:

```nix
# The importApply argument. Use this to reference things defined locally,
# as opposed to the flake where this is imported.
localFlake:

# Regular module arguments; self, inputs, etc all reference the final user flake,
# where this module was imported.
{ lib, config, self, inputs, ... }:
{
  perSystem = { system, ... }: {
    packages.foo = localFlake.withSystem system ({ config, pkgs, ... }:
      pkgs.callPackage ./pkgs/foo.nix { } 
    );
  };
}
```

With `pkgs/foo.nix` consisting of:

```nix
# A very realistic package that exposes pkgs.hello
# For a real package this would be a call to a mkDerivation-like function
{ hello }:
hello
```

After this, `nix flake show` displays:

```
❯ nix flake show                    
path:/tmp/tmp.9EKwLKT4Fi?lastModified=1714331937&narHash=sha256-JyIOTbNOufPZkVbx35sFU4e2iyKbPpCI0B3NgXBP6DM%3D
└───packages
    ├───aarch64-darwin
    │   └───foo omitted (use '--all-systems' to show)
    ├───aarch64-linux
    │   └───foo omitted (use '--all-systems' to show)
    ├───x86_64-darwin
    │   └───foo omitted (use '--all-systems' to show)
    └───x86_64-linux
        └───foo: package 'hello-2.12.1'
```

Note that no additional changes in `flake.nix` are needed, the changes propagate through the imports.

## Writing a NixOS module [#](#writing-a-nixos-module "header link")

Let’s write a simple module that creates a systemd service running our `package.foo`.

While writing this post, I discovered that Flake-parts has a special API that pulls the per-system attributes into the modules, called [`moduleWithSystem`](https://flake.parts/module-arguments.html?highlight=modulewith#modulewithsystem). It works very much like `withSystem`, so let’s add it to `flake.nix` inherit point:

```patch
# flake.nix
- { withSystem, flake-parts-lib, ... }:
+ { withSystem, moduleWithSystem, flake-parts-lib, ... }:

- foo-flake-mod = importApply ./flake-modules/foo { inherit withSystem };
+ foo-flake-mod = importApply ./flake-modules/foo { inherit withSystem moduleWithSystem; };
```

Then, let’s add the module to `flake-modules/foo/default.nix`:

```patch
{
  perSystem = { system, ... }: {
    packages.foo = localFlake.withSystem system ({ config, pkgs, ... }:
      pkgs.callPackage ./pkgs/foo.nix {}
    );
  };

+  flake.nixosModules.foo = localFlake.moduleWithSystem (
+    perSystem@{ config }: import ./nixosModules perSystem;
+  );
}
```

And the module code itself:

```nix
perSystem: # How the per-system part of flake is passed
{ lib, ... }: # Standard module arguments
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

The module now shows up in `nix flake show`:

```patch
+├───nixosModules
+│   └───foo: NixOS module
└───packages
    ├───aarch64-darwin
...
```

To demonstrate how it works, let’s add a `check` for it inside `perSystem`:

```patch
perSystem = 
    { system, ... }:
    {
    # ...
+     checks.foo-nixos-module = localFlake.withSystem system (
+       {
+         config,
+         pkgs,
+         ...
+       }:
+       pkgs.testers.runNixOSTest {
+         name = "foo-nixos-module";
+         nodes.machine1 =
+           _: # { config, pkgs, ... }:
+           {
+             imports = [ self.nixosModules.foo ];
+           };
+         testScript = ''
+           machine.wait_for_unit("foo")
+           _, output = machine.systemctl("status foo")
+
+           assert "Hello, world" in output
+         '';
+       }
+     );
  };
```

And `nix flake check` is happy:

```shell
❯ nix flake check && echo "SUCCESS"
warning: The check omitted these incompatible systems: aarch64-darwin, aarch64-linux, x86_64-darwin
Use '--all-systems' to check all.
SUCCESS
```

To be fair, `moduleWithSystem` is not the only way to pass the flake’s package to a NixOS module. Other alternatives include:

1.  Declaring an overlay (btw flake parts makes it [easy](https://flake.parts/options/flake-parts-easyoverlay)) and asking that the developer of the consumer flake to include that overlay in their instance of pkgs.
    
    Then, just use `pkgs` in the module as usual.
    
2.  The module code in `nixosModules/default.nix` is not technically a module, it’s a function of `perSystem` argument that produces a module. The flake’s `self` reference can be passed same way and then the `self.packages.${pkgs.system}` can be extracted from it in the module code.
    
    This was my pattern of choice, but I will try switching to `moduleWithSystem` moving forward.
    

## Writing a Home Manager module [#](#writing-a-home-manager-module "header link")

In a manner that is very similar to `nixosModules.foo`, we can write a Home Manager module.

One important thing about this output is that it’s not one of the standard flake-parts `flake` API. In practice this means that if we have two flake modules declaring homeManagerModules outputs, there will be a conflict when they are both imported. Fixing it would need another flake module that would help flake-parts merging the non-standard output. See [corresponding section](#example-composable-homemanagermodules) for an example.

Here’s the content of `homeManagerModules/default.nix`. The only adjustments needed are Home Manager-specific `systemd.user.services` options:

```nix
perSystem:
{ lib, ... }:
{
  systemd.user.services.foo = {
    Service = {
      Type = "simple";
      ExecStart = lib.getExe perSystem.config.packages.foo;
    };
    Install.WantedBy = [ "default.target" ];
  };
}
```

The check for it could look like this:

```nix
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
            # Login
            machine.wait_until_tty_matches("1", "login: ")
            machine.send_chars("alice\n")
            machine.wait_until_tty_matches("1", "Password: ")
            machine.send_chars("hunter2\n")
            machine.wait_until_tty_matches("1", "alice\@machine")

            # Wait for everything to start
            machine.wait_for_unit("home-manager-alice.service")
            _, output = machine.systemctl("status foo", user="alice")

            assert "Hello, world" in output
          '';
        }
      );
```

Which keeps `nix flake check` happy.

## Scaling to multiple flake-modules [#](#scaling-to-multiple-flake-modules "header link")

Much like `foo` flake-module, a `bar` flake module could be written and merged into the resulting flake through flake-parts imports. Keep in mind that for non-standard outputs (like `homeManagerModules`), it’s necessary to tell flake-parts how to merge them.

As an example, in my [dotfiles/homelab/etc. repository](https://github.com/VTimofeenko/monorepo-machine-config) I have certain reusable parts of my configuration split into [flake-modules](https://github.com/VTimofeenko/monorepo-machine-config/tree/master/flake-modules).

## Tags

*   [nix](https://vtimofeenko.com/tags/nix)
*   [flake-parts](https://vtimofeenko.com/tags/flake-parts)

Content on this site is licensed under [CC-BY-SA](https://creativecommons.org/licenses/by-sa/4.0/).