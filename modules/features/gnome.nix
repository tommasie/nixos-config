{
  flake.modules.homeManager.gnome =
    { pkgs, ... }:
    {
      home.packages = with pkgs.gnomeExtensions; [
        clipboard-history
        vitals
        tray-icons-reloaded
        user-themes
        dash-to-panel
      ];

      dconf = {
        enable = true;
        settings."org/gnome/shell" = {
          always-show-log-out = true;
          disable-user-extensions = false;
          enabled-extensions = [
            "clipboard-history@alexsaveau.dev"
            "Vitals@CoreCoding.com"
          ];
        };
      };
    };
}
