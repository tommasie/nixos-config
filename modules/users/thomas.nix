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
        lazygit
        jq
      ];

      sops.secrets.github_token = { };
      sops.secrets.git_identity = { };

      programs.git.includes = [ { path = config.sops.secrets.git_identity.path; } ];

      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
      };

      home.sessionVariables = {
        GH_TOKEN = "$(cat ${config.sops.secrets.github_token.path})";
      };

      xdg.enable = true;
    };
}
