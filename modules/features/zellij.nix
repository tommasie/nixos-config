{
  flake.modules.homeManager.zellij = {
    programs.zellij = {
      enable = true;
      enableFishIntegration = true;
      exitShellOnExit = true;
      settings = {
        # use Wayland clipboard
        copy_command = "wl-copy";
        show_startup_tips = false;
      };
    };
  };
}
