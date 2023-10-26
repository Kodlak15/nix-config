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
    {
      # Previous buffer
      mode = "n";
      key = "<S-h>";
      action = "<cmd>BufferLineCyclePrev<CR>";
      options = {
        silent = true;
        remap = false;
      };
    }
    {
      # Next buffer
      mode = "n";
      key = "<S-l>";
      action = "<cmd>BufferLineCycleNext<CR>";
      options = {
        silent = true;
        remap = false;
      };
    }
    {
      # Pin buffer
      mode = "n";
      key = "<leader>bp";
      action = "<cmd>BufferLineTogglePin<CR>";
      options = {
        silent = true;
        remap = false;
      };
    }
    {
      # Delete unpinned buffers
      mode = "n";
      key = "<leader>bP";
      action = "<cmd>BufferLineGroupClose ungrouped<CR>";
      options = {
        silent = true;
        remap = false;
      };
    }
    {
      # Open dashboard
      mode = "n";
      key = "<leader>;";
      action = "<cmd>Alpha<CR>";
      options = {
        silent = true;
        remap = false;
      };
    }
  ];
}
