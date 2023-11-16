{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        lua-ls.enable = true;
        html.enable = true;
        cssls.enable = true;
        ccls.enable = true;
        clangd.enable = true;
        cmake.enable = true;
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
        efm.enable = true;
      };
    };
    efmls-configs = {
      enable = true;
      setup = {
        bash = {
          formatter = "shfmt";
          linter = "shellcheck";
        };
        c = {
          formatter = "clang_format";
          linter = "cpplint";
        };
        cmake = {
          formatter = "gersemi";
          linter = "cmake_lint";
        };
        cpp = {
          formatter = "clang_format";
          linter = "cppcheck";
        };
        css = {
          formatter = "prettier";
          linter = "stylelint";
        };
        dockerfile = {
        };
        go = {
          formatter = "gofmt";
          linter = "golangci_lint";
        };
        haskell = {
          formatter = "fourmolu";
        };
        html = {
          formatter = "prettier";
        };
        javascript = {
          formatter = "prettier";
          linter = "eslint";
        };
        json = {
          formatter = "prettier";
        };
        lua = {
          formatter = "stylua";
          linter = "luacheck";
        };
        make = {
        };
        markdown = {
          formatter = "cbfmt";
          linter = "markdownlint";
        };
        nix = {
          formatter = "alejandra";
          linter = "statix";
        };
        php = {
          formatter = "phpcbf";
          linter = "phpcs";
        };
        python = {
          formatter = "black";
          linter = "pylint";
        };
        rust = {
          formatter = "rustfmt";
        };
        scss = {
          formatter = "prettier";
          linter = "stylelint";
        };
        sh = {
          formatter = "shfmt";
          linter = "shellcheck";
        };
        sql = {
          formatter = "sql-formatter";
        };
        toml = {
          formatter = "taplo";
        };
        typescript = {
          formatter = "prettier";
          linter = "eslint";
        };
        yaml = {
          formatter = "yq";
        };
      };
    };
  };
  programs.nixvim.extraConfigLua = ''
    local nvim_lsp = require('lspconfig')
    local servers = { 'templ' }
    for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      },
    }
    end
  '';
}
