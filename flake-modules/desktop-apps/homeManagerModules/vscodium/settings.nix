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

    # ── Commit AI ────────────────────────────────────────────
    "commit-ai.servers" = [
      {
        type = "openai";
        baseURL = "https://api.deepseek.com";
        apiKey = "sk-89282f1621234014b9a60b1f8af8ad46";
        models = [
          {
            name = "deepseek-v4-flash";
            enabled = true;
          }
        ];
      }
    ];
    "commit-ai.reasoningEffort" = "low";

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
  };
}
