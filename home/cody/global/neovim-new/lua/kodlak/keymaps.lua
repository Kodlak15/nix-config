-- Set leader key to spacebar
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local k = vim.keymap

-- Escape insert mode with jk or kj
k.set("i", "jk", "<Esc>")
k.set("i", "kj", "<Esc>")
