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
          linter = "alex";
        };
        go = {
          formatter = "gofmt";
          linter = "golangci_lint";
        };
        haskell = {
          formatter = "fourmolu";
          linter = "alex";
        };
        html = {
          formatter = "prettier";
          linter = "alex";
        };
        javascript = {
          formatter = "prettier";
          linter = "eslint";
        };
        json = {
          formatter = "prettier";
          linter = "alex";
        };
        lua = {
          formatter = "stylua";
          linter = "luacheck";
        };
        make = {
          linter = "alex";
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
          linter = "alex";
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
          linter = "alex";
        };
        toml = {
          formatter = "taplo";
          linter = "alex";
        };
        typescript = {
          formatter = "prettier";
          linter = "eslint";
        };
        yaml = {
          formatter = "yq";
          linter = "alex";
        };
      };
    };
  };
}
