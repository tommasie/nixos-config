{
  flake.modules.homeManager.git = {
    programs.git = {
      enable = true;
      settings = {
        alias = {
          co = "checkout";
          st = "status";
          br = "branch";
        };
        core.editor = "vim";
        init.defaultBranch = "main";
        safe.directory = "*";
      };
    };

    programs.gh = {
      enable = true;
    };
  };
}
