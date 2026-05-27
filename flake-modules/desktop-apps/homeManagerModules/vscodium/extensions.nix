{
  config,
  pkgs,
  ...
}: {
  programs.vscodium.profiles.default.extensions = with pkgs.vscode-extensions; [
    jnoortheen.nix-ide
    mkhl.direnv
  ];

  # Extensions not available in nixpkgs — install manually via VSCodium marketplace:
  #   alone.commit-ai           — AI-powered commit message generator
  #   zoocodeorganization.zoo-code — Zoo Code (BMAD agent system)
  #
  # These survive `darwin-rebuild switch` (extensions live in ~/.vscode-oss/extensions/).
  # Only a manual wipe of the extensions directory would require reinstallation.
}
