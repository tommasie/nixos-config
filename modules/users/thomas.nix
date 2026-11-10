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

      programs.git.settings.user = {
        name = "Thomas Collerton";
        email = "tho.collerton@gmail.com";
      };

      sops.secrets.github_token = { };
      home.sessionVariables = {
        GH_TOKEN = "$(cat ${config.sops.secrets.github_token.path})";
      };

      xdg.enable = true;
    };
}
