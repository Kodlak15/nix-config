{pkgs, ...}: {
  programs.nixvim.keymaps = [
    {
      # Better escape insert mode
      mode = "i";
      key = "jk";
      action = "<esc>";
      options = {
        silent = true;
        remap = false;
      };
    }
    {
      # Better escape insert mode
      mode = "i";
      key = "kj";
      action = "<esc>";
      options = {
        silent = true;
        remap = false;
      };
    }
    {
      # Toggle neo-tree
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle<CR>";
      options = {
        silent = true;
        remap = false;
      };
    }
  ];
}
