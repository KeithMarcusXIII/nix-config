{config, ...}: {
  programs.vscodium.profiles.default.userSettings = {
    # ── Zoo Code (BMAD agent) ─────────────────────────────────
    "zoo-code.debug" = false;
    "zoo-code.allowedCommands" = [
      "git log"
      "git diff"
      "git show"
      "python3 /Users/keith/.config/nix/_bmad/scripts/resolve_customization.py --skill /Users/keith/.config/nix/.agents/skills/bmad-agent-architect --key agent"
      "python3 /Users/keith/.config/nix/_bmad/scripts/resolve_customization.py --skill /Users/keith/.config/nix/.agents/skills/bmad-quick-dev --key workflow"
    ];
    "zoo-code.deniedCommands" = [];

    # ── Git ──────────────────────────────────────────────────
    "git.autofetch" = true;

    # ── jnoortheen.nix-ide ───────────────────────────────────
    # Language server: "nil" (fast) or "nixd" (options completion)
    "nix.enableLanguageServer" = true;
    "nix.serverPath" = "nil";
    "nix.serverSettings" = {
      nil = {
        formatting = {
          command = ["alejandra"];
        };
      };
      nixd = {
        formatting = {
          command = ["alejandra"];
        };
        options = {
          nix-darwin = {
            expr = "(builtins.getFlake (toString ./.)).darwinConfigurations.mac16-10.options";
          };
          home-manager = {
            expr = "(builtins.getFlake (toString ./.)).homeConfigurations.keith.options";
          };
        };
      };
    };

    "opencodecommit.backendOrder" = [
        "custom-api"
        "codex"
        "opencode"
        "claude"
        "gemini"
    ];
    "opencodecommit.api.custom" = {
        "model" = "deepseek-v4-flash";
        "endpoint" = "https://api.deepseek.com";
        "keyEnv" = "DEEPSEEK_API_KEY";
        "prModel" = "deepseek-v4-pro";
        "cheapModel" = "deepseek-v4-flash";
    };
  };
}
