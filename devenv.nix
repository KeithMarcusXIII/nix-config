let
  # Read GitHub token from the build environment.
  # Injected by .envrc via `bws secret list ... | sed 's/^/export /'`
  # This is impure (breaks reproducibility) but acceptable for dev environments.
  githubToken = builtins.getEnv "GITHUB_PAT";
  firecrawlKey = builtins.getEnv "FIRECRAWL_API_KEY";
in
  {
    pkgs,
    lib,
    config,
    inputs,
    ...
  }: {
    # https://devenv.sh/basics/
    env.GREET = "devenv";

    # https://devenv.sh/packages/
    packages = with pkgs; [
      mcp-nixos
      secretspec
      bws
    ];

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
    scripts.hello.exec = ''
      echo hello from $GREET
    '';

    # https://devenv.sh/basics/
    enterShell = ''
      hello         # Run scripts directly
      git --version # Use packages
    '';

    # https://devenv.sh/tasks/
    # tasks = {
    #   "myproj:setup".exec = "mytool build";
    #   "devenv:enterShell".after = [ "myproj:setup" ];
    # };

    # https://devenv.sh/tests/
    enterTest = ''
      echo "Running tests"
      git --version | grep --color=auto "${pkgs.git.version}"
    '';

    # https://devenv.sh/git-hooks/
    # git-hooks.hooks.shellcheck.enable = true;

    mcp.servers = {
      "nixos" = {
        command = "mcp-nixos";
        alwaysAllow = [
          "nix"
          "nix_versions"
        ];
      };

      # ----- stdio: local devenv CLI -------------------------------------------------
      "devenv" = {
        command = "devenv";
        args = ["mcp"];
        alwaysAllow = [
          "search_options"
          "search_packages"
          "list_processes"
        ];
      };

      # ----- stdio: firecrawl via pnpx -----------------------------------------------
      "firecrawl" = {
        command = "pnpx";
        args = ["firecrawl-mcp"];
        env = {
          # FIRECRAWL_API_KEY = config.secretspec.secrets.FIRECRAWL_API_KEY or "";
          FIRECRAWL_API_KEY = firecrawlKey;
        };
        alwaysAllow = [
          "firecrawl_search"
          "firecrawl_scrape"
        ];
      };

      # ----- streamable-http: GitHub Copilot MCP ------------------------------------
      "github" = {
        url = "https://api.githubcopilot.com/mcp/";
        # transportType auto-injected as "streamable-http" by the module for url servers
        headers = {
          Authorization = "Bearer ${githubToken}";
        };
        alwaysAllow = [
          "get_file_contents"
          "search_code"
        ];
        # Tier 1 read tools removed from disabledTools — enables
        # codebase/issue/PR/release browsing (13 tools, +11 net new).
        # 45 total tools across all MCP servers (target: ≤60).
        disabledTools = [
          "add_comment_to_pending_review"
          "add_issue_comment"
          "add_reply_to_pull_request_comment"
          "assign_copilot_to_issue"
          "create_branch"
          "create_or_update_file"
          "create_pull_request"
          "create_pull_request_with_copilot"
          "create_repository"
          "delete_file"
          "fork_repository"
          "get_copilot_job_status"
          "get_label"
          "get_release_by_tag"
          "get_team_members"
          "get_teams"
          "issue_write"
          "list_issue_types"
          "list_repository_collaborators"
          "merge_pull_request"
          "pull_request_review_write"
          "push_files"
          "request_copilot_review"
          "run_secret_scanning"
          "search_users"
          "sub_issue_write"
          "update_pull_request"
          "update_pull_request_branch"
        ];
      };
    };

    # Opt out of IDE targets you don't use (all default true)
    # mcp.roo.enable = false;     # .roo/mcp.json
    # mcp.vscode.enable = false;  # .vscode/mcp.json
    # mcp.cursor.enable = false;  # .cursor/mcp.json

    # See full reference at https://devenv.sh/reference/options/

    # See full reference at https://devenv.sh/reference/options/
  }
