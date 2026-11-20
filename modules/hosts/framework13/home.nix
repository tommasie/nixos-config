{ self, ... }:
{
  flake.modules.homeManager.fw13 =
    { config, ... }:
    {
      imports = with self.modules.homeManager; [
        firefox
        gnome
        obsidian
      ];

      home.username = "thomas";
      home.homeDirectory = "/home/thomas";

      sops.secrets.github_token = { };
      sops.secrets.git_identity = { };

      programs.git.includes = [ { path = config.sops.secrets.git_identity.path; } ];

      home.sessionVariables = {
        GH_TOKEN = "$(cat ${config.sops.secrets.github_token.path})";
      };

    };
}
