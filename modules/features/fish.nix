{
  flake.modules.homeManager.fish =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.grc ];
      programs.fish = {
        enable = true;
        plugins = [
          {
            name = "grc";
            src = pkgs.fishPlugins.grc.src;
          }
          {
            name = "fish-ssh-agent";
            src = pkgs.fetchFromGitHub {
              owner = "danhper";
              repo = "fish-ssh-agent";
              rev = "f10d957";
              sha256 = "10c0sg5nyh36mk2xlnxw9fw00w8yraj11nbwhm0rw1fjnd1yhnkh";
            };
          }
        ];
      };

    };
}
