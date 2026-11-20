{ self, ... }:
{
  flake.modules.homeManager.common =
    { config, pkgs, ... }:
    {
      imports = with self.modules.homeManager; [
        fish
        git
        nixvim
        zellij
        sops
      ];

      home.stateVersion = "25.05";

      home.packages = with pkgs; [
        lazygit
        jq
      ];

      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
      };

      xdg.enable = true;
    };
}
