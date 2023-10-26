{
  pkgs,
  ...
}: {
  programs.nixvim.keymaps = [
    { # Better escape insert mode
      mode = "i";
      key = "jk";
      action = "<ESC>";
      options = {
        silent = true;
        remap = false;
      };
    }
    { # Better escape insert mode
      mode = "i";
      key = "kj";
      action = "<ESC>";
      options = {
        silent = true;
        remap = false;
      };
    }
  ]; 
}
