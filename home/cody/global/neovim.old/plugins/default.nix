{
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
    ./comment
    ./indent-blankline
    ./noice
    ./notify
    ./packer
    ./todo-comments
  ];

  programs.nixvim.plugins = {
    nix.enable = true;
    luasnip = {
      enable = true;
      fromVscode = [{ paths = /nix/store/3v949yzy8qgz89wrcwp5w66p544mynl8-vimplugin-friendly-snippets-2023-10-01; }];
    };
    lsp-format = {
      enable = true;
      lspServersToEnable = "all";
    };
    cmp-nvim-lua.enable = true;
    cmp-npm.enable = true;
    mini = {
      enable = true;
      modules = {
        ai = {
          n_lines = 500;
          search_method = "cover_or_next";
          custom_objects = {};
        };
        indentscope = {
          symbol = "|";
          options.try_as_border = true;
        };
      };
    };
    nvim-autopairs.enable = true;
    notify = {
      enable = true;
      backgroundColour = "#000000";
    };
  };
}
