{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        lua-ls.enable = true;
        html.enable = true;
        cssls.enable = true;
        gopls.enable = true;
        eslint.enable = true;
        nil_ls.enable = true;
        pylsp.enable = true;
        pyright.enable = true;
        hls.enable = true;
        intelephense.enable = true;
        jsonls.enable = true;
        rust-analyzer.enable = true;
        svelte.enable = true;
        tsserver.enable = true;
        yamlls.enable = true;
      };
    };
    lspkind.enable = true;
    none-ls.enable = true;
  };
}
