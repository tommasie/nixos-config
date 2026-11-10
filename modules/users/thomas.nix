{ self, ... }:
{
  flake.modules.homeManager.thomas =
    { config, pkgs, ... }:
    {
      imports = with self.modules.homeManager; [
        fish
        git
        nixvim
        zellij
        sops
      ];

      home.username = "thomas";
      home.homeDirectory = "/home/thomas";
      home.stateVersion = "25.05";

      home.packages = with pkgs; [
        direnv
        nix-direnv
        lazygit
        jq
      ];

      sops.secrets.github_token = { };
      sops.secrets.git_identity = { };

      programs.git.includes = [ { path = config.sops.secrets.git_identity.path; } ];
      # programs.git.settings.user = {
      #   name = "Thomas Collerton";
      #   email = "tho.collerton@gmail.com";
      # };

      home.sessionVariables = {
        GH_TOKEN = "$(cat ${config.sops.secrets.github_token.path})";
      };

      xdg.enable = true;
    };
}
