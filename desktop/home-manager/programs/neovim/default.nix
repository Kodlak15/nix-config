{
  pkgs,
  ...
}: {
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

    colorschemes = {
      tokyonight = {
        enable = true;
	      style = "night";
      };
    };
  };
}
