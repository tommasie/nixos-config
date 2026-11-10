{ inputs, ... }:
{
  flake.modules.homeManager.nixvim =
    { pkgs, ... }:
    {
      imports = [ inputs.nixvim.homeModules.nixvim ];

      programs.nixvim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;

        opts = {
          #      relativenumber = true;
          number = true;
          expandtab = true;
          tabstop = 2;
          shiftwidth = 2;
        };

        keymaps = [
          {
            action = "Neotree filesystem reveal left";
            key = "<leader>tt";
          }
        ];

        autoCmd = [
          {
            desc = "Auto formatter for Nix files";
            command = "!nixfmt %";
            event = "BufWritePost";
            pattern = "*.nix";
          }
        ];

        colorschemes.catppuccin.enable = true;

        plugins = {
          nix.enable = true;

          rustaceanvim.enable = true;

          lightline.enable = true;

          neo-tree.enable = true;

          telescope = {
            enable = true;
            keymaps = {
              "<leader>ff" = {
                action = "find_files";
                options = {
                  "desc" = "Telescope find files";
                };
              };
            };
          };
          # Dependency for telescope
          web-devicons.enable = true;

          treesitter = {
            enable = false;
            highlight.enable = false;
            indent.enable = true;
            folding.enable = false;
          };

        };
      };
    };
}
