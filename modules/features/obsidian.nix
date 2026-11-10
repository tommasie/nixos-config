{
  flake.modules.homeManager.obsidian = {
    programs.obsidian = {
      enable = false;
      package = null;
      vaults = {
        main = {
          enable = true;
          target = "protondrive/pc_vault";
        };
      };
    };
  };
}
