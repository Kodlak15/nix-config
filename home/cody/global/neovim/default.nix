{pkgs, ...}:
{
  imports = [
    ./plugins
    ./keymaps.nix
    ./options.nix
    ./autoCmd.nix
  ];

  programs.nixvim = {
    enable = true;
    globals = {
      mapleader = " ";
    };
    filetype = {
      extension = {
        templ = "templ";
      };
    };
    extraPlugins = [ pkgs.vimPlugins.pywal-nvim ];
    colorscheme = "pywal";
    colorschemes = {
      tokyonight = {
        enable = false;
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
