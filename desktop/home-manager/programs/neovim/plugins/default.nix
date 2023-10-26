{pkgs, ...}: {
  imports = [
    ./lsp
    ./cmp
    ./treesitter
    ./telescope
    ./neo-tree
    ./alpha
		./lualine
		./bufferline
		./which-key
    ./comment-nvim
    ./indent-blankline
  ];

  programs.nixvim.plugins = {
		nix.enable = true;
    luasnip.enable = true;
    lsp-format.enable = true;
    cmp-nvim-lua.enable = true;
    cmp-npm.enable = true;
    mini = {
      enable = true;
      modules = {}; # TODO
    };
  };
}
