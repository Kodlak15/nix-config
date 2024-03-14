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
      group = vim.api.nvim_create_autogroup("kodlak-lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        -- Go to definition for word under cursor
        -- Press <C-t> to go back
        map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

        -- Find references for word under cursor
        map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
      end
    },
  end
}
