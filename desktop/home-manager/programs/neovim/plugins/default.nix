{pkgs, ...}: {
  imports = [
    ./lsp
    ./cmp
    ./treesitter
    ./telescope
    ./neo-tree
    ./alpha
  ];

  programs.nixvim.plugins = {
    luasnip.enable = true;
    lsp-format.enable = true;
    alpha = {
      enable = true;
      iconsEnabled = true;
    };
  };
}
