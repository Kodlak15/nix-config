{pkgs, ...}:
{
  imports = [
    ./plugins
    ./keymaps.nix
    ./options.nix
  ];

  programs.nixvim = {
    enable = true;
    globals = {
      mapleader = " ";
    };
    extraPlugins = [ pkgs.vimPlugins.pywal-nvim ];
    # colorscheme = "pywal";
    colorschemes = {
      tokyonight = {
        enable = true;
        style = "night";
      };
      catppuccin = {
        enable = false;
        flavour = "mocha";
        terminalColors = true;
      };
    };
    viAlias = true;
    vimAlias = true;
  };
}
