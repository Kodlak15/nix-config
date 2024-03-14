-- Colorscheme
return {
  -- Rose Pine theme (https://github.com/rose-pine/neovim)
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        disable_background = true,
      })

      vim.cmd("colorscheme rose-pine")
    end
  },
}
