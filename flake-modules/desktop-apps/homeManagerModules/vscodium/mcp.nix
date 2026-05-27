{config, ...}: {
  # ── VSCodium MCP integration ──────────────────────────────────
  # Picks up servers from the global programs.mcp.servers registry
  # (defined in flake-modules/darwin/homeManagerModules/default.nix)
  # and merges them with any VSCodium-specific overrides below.
  programs.vscodium.profiles.default = {
    enableMcpIntegration = true;
    userMcp = {
      # VSCodium-specific MCP servers (merged with global registry,
      # userMcp taking precedence on conflicts).
    };
  };
}
