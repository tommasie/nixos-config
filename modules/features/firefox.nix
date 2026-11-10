{ inputs, ... }:

{
  flake.modules.homeManager.firefox =
    { pkgs, config, ... }:
    {
      programs.firefox = {
        enable = true;
        configPath = "${config.xdg.configHome}/mozilla/firefox";
        profiles.default = {
          id = 0;
          name = "default";
          isDefault = true;
          search = {
            default = "ddg";
            order = [
              "ddg"
              "google"
            ];
            force = true;
            engines = {
              bing.metaData.hidden = true;
            };
          };
          extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
            ublock-origin
            privacy-badger
            proton-pass
            proton-vpn
            tree-style-tab
          ];
          settings = {
            "browser.startup.page" = 3; # Restore previous session's tabs
          };
        };
      };
    };
}
