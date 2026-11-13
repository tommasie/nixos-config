{
  flake.modules.homeManager.zellij =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.wl-clipboard ];
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
