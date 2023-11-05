{lib, ...}:
{
  programs.nixvim.options = {
    ignorecase = true;
    expandtab = false;
    mouse = "a";
    number = true;
    relativenumber = true;
    shiftwidth = 2;
    showmode = false;
    smartcase = true;
    smartindent = true;
    signcolumn = "yes";
    tabstop = 2;
    termguicolors = true;
    # termguicolors = lib.mkForce false;
    timeoutlen = 300;
    undofile = true;
    undolevels = 10000;
    wrap = false;
  };
}
