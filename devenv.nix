# let
#   # Read GitHub token from the build environment.
#   # Injected by .envrc via `bws secret list ... | sed 's/^/export /'`
#   # This is impure (breaks reproducibility) but acceptable for dev environments.
#   githubToken = builtins.getEnv "GITHUB_PAT";
#   firecrawlKey = builtins.getEnv "FIRECRAWL_API_KEY";
# in
{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: let
  firecrawlApiKey = config.secretspec.secrets.FIRECRAWL_API_KEY or "";
  githubToken = config.secretspec.secrets.GITHUB_PAT or "";
  openRouterApiKey = config.secretspec.secrets.OPENROUTER_API_KEY or "";
  omlxApiKey = config.secretspec.secrets.OMLX_API_KEY or "";
in {
  # https://devenv.sh/basics/
  env = {
    GREET = "devenv";
    FIRECRAWL_API_KEY = firecrawlApiKey;
    GITHUB_PAT = githubToken;
    OPENROUTER_API_KEY = openRouterApiKey;
    OMLX_API_KEY = omlxApiKey;
  };

  # https://devenv.sh/packages/
  packages = with pkgs; [
    mcp-nixos
    repomix
  ];
  /*
  ++ [
    # secretspec v0.11.0 — built from source to support project-level [providers]
    (pkgs.rustPlatform.buildRustPackage {
      pname = "secretspec";
      version = "0.11.0";
      src = pkgs.fetchFromGitHub {
        owner = "cachix";
        repo = "secretspec";
        rev = "v0.11.0";
        hash = "sha256-wNM4M1WmY4qn+rAS3bwV+0xyYxPj5tSCZNgzgpZzxLo=";
      };
      cargoHash = "sha256-+za3JfcgTHSteOAWh7PXQx30WsdA3ApBswY4ALeacJ8=";
    })
  ];
  */

  # https://devenv.sh/languages/
  languages.javascript = {
    enable = true;
    package = pkgs.nodejs_24;
    pnpm.enable = true;
  };
  languages.python = {
    enable = true;
    venv = {
      enable = true;
    };
  };

  # https://devenv.sh/processes/
  # processes.dev.exec = "${lib.getExe pkgs.watchexec} -n -- ls -la";

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/scripts/
  # scripts.hello.exec = ''
  #   echo hello from $GREET
  # '';

  # https://devenv.sh/basics/
  # enterShell = ''
  #   hello         # Run scripts directly
  #   git --version # Use packages
  # '';

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };

  # https://devenv.sh/tests/
  # enterTest = ''
  #   echo "Running tests"
  #   git --version | grep --color=auto "${pkgs.git.version}"
  # '';

  # https://devenv.sh/git-hooks/
  # git-hooks.hooks.shellcheck.enable = true;
}
