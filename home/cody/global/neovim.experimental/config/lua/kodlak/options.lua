local options = {
  ignorecase          = true,  
  smartcase           = true,
  mouse 	            = "a",
  number              = true,
  nu 		              = true,
  relativenumber      = true,
  shiftwidth          = 2,
  tabstop             = 2,
  softtabstop         = 2,
  expandtab           = true,
  showmode            = false,
  smartcase           = true,
  smartindent         = true,
  signcolumn          = "yes",
  termguicolors       = true,
  timeoutlen          = 300,
  undofile            = true,
  undolevels          = 10000,
  wrap                = false,
  hlsearch            = false,
  incsearch           = true,
  clipboard           = "unnamedplus",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
