{ self, ... }:
{
  flake.modules.homeManager.fw13 = {
    imports = with self.modules.homeManager; [
      firefox
      gnome
      obsidian
    ];
  };
}
