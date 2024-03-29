{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        lua-ls.enable = true;
        html = {
          enable = true;
          filetypes = [
            "html"
          ];
        };
        htmx = {
          enable = true;
          filetypes = [
            "html"
            "templ"
            "rust"
          ];
        };
        emmet_ls = {
          enable = true;
          filetypes = [
            "html"
            "templ"
            "rust"
          ];
        };
        cssls = {
          enable = true;
          extraOptions = {
            settings = {
              css.lint.unknownAtRules = "ignore";
            };
          };
        };
        ccls.enable = true;
        clangd.enable = true;
        cmake.enable = true;
        gopls = {
          enable = true;
          filetypes = [
            "go"
            "templ"
          ];
        };
        eslint.enable = true;
        nil_ls.enable = true;
        pylsp.enable = true;
        pyright.enable = true;
        hls.enable = true;
        intelephense.enable = true;
        jsonls.enable = true;
        rust-analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
        };
        svelte.enable = true;
        tsserver.enable = true;
        yamlls.enable = true;
        # efm.enable = true;
        templ.enable = true;
        tailwindcss = {
          enable = true;
          filetypes = [
            "html"
            "css"
            "scss"
            "javascript"
            "typescript"
            "svelte"
            "rust"
            "templ"
            "go"
          ];
          extraOptions = {
            init_options.userLanguages.rust = "html";
          };
        };
      };
    };
    conform-nvim = {
      enable = true;
      formatOnSave = {
        timeoutMs = 500;
        lspFallback = true;
      };
      formatters = {}; # Custom formatters
      formattersByFt = {
        lua = [ "stylua" ];
        nix = [ "alejandra" ];
        bash = [ "shfmt" ];
        javascript = [ "prettier" ];
        typescript = [ "prettier" ];
        html = [ "prettier" ];
        json = [ "prettier" ];
        c = [ "clang_format" ];
        python = [ "isort" "black" ];
        haskell = [ "fourmolu" ];
        rust = [ "rustfmt" ];
      };
      notifyOnError = false;
    };
    # efmls-configs = {
    #   enable = true;
    #   setup = {
    #     bash = {
    #       formatter = "shfmt";
    #       linter = "shellcheck";
    #     };
    #     c = {
    #       formatter = "clang_format";
    #       linter = "cpplint";
    #     };
    #     cmake = {
    #       # formatter = "gersemi";
    #       linter = "cmake_lint";
    #     };
    #     cpp = {
    #       formatter = "clang_format";
    #       linter = "cppcheck";
    #     };
    #     css = {
    #       formatter = "prettier";
    #       linter = "stylelint";
    #     };
    #     dockerfile = {
    #     };
    #     go = {
    #       formatter = "gofmt";
    #       linter = "golangci_lint";
    #     };
    #     haskell = {
    #       formatter = "fourmolu";
    #     };
    #     html = {
    #       formatter = "prettier";
    #     };
    #     javascript = {
    #       formatter = "prettier";
    #       linter = "eslint";
    #     };
    #     json = {
    #       formatter = "prettier";
    #     };
    #     lua = {
    #       formatter = "stylua";
    #       linter = "luacheck";
    #     };
    #     markdown = {
    #       formatter = "cbfmt";
    #       linter = "markdownlint";
    #     };
    #     nix = {
    #       formatter = "alejandra";
    #       linter = "statix";
    #     };
    #     php = {
    #       formatter = "phpcbf";
    #       linter = "phpcs";
    #     };
    #     python = {
    #       formatter = "black";
    #       linter = "pylint";
    #     };
    #     rust = {
    #       formatter = "rustfmt";
    #     };
    #     scss = {
    #       formatter = "prettier";
    #       linter = "stylelint";
    #     };
    #     sh = {
    #       formatter = "shfmt";
    #       linter = "shellcheck";
    #     };
    #     sql = {
    #       formatter = "sql-formatter";
    #     };
    #     toml = {
    #       formatter = "taplo";
    #     };
    #     typescript = {
    #       formatter = "prettier";
    #       linter = "eslint";
    #     };
    #     yaml = {
    #       formatter = "yq";
    #     };
    #   };
    };
  # };
}
