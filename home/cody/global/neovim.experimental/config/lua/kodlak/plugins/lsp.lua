-- Lsp Configuration
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSPs and related tools
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    -- Useful status updates for LSP
    { "j-hui/fidget.nvim", opts = {} },

    -- Configure LSP for neovim config, runtime, and plugins
    { "folke/neodev.nvim", opts = {} },
  },

  config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kodlak-lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        -- Go to definition for word under cursor (press <C-t> to go back)
        map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

        -- Find references for word under cursor
        map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

        -- Jump to implementation for word under cursor
        map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

        -- Jump to type of word under cursor
        map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

        -- Fuzzy find all symbols in current document
        map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

        -- Fuzzy find all symbols in current workspace 
        map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

        -- Rename variable under cursor
        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

        -- Execute code action
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

        -- Open popup displaying documentation for word under cursor
        map("K", vim.lsp.buf.hover, "Hover documentation")

        -- Go to declaration (NOT definition)
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        -- Highlight references of word under cursor when cursor rests there for a period of time
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHightlightProvider then
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    -- Add capabilities to neovim LSP specification (completions, snippets, etc.)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    -- Enable language servers
    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
    }

    -- Setup mason
    require("mason").setup()

    -- Add other tools for mason to install
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      "stylua" -- Formats lua code
    })
    require("mason-tool-installer").setup { ensure_installed = ensure_installed }

    require("mason-lspconfig").setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end,
      },
    }
  end,
}
