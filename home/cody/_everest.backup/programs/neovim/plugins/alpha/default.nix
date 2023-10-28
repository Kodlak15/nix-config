{
  programs.nixvim.plugins.alpha = {
    enable = true;
    iconsEnabled = true;
    layout = [
      {
        type = "padding";
        val = 2;
      }
      {
        opts = {
          hl = "Type";
          position = "center";
        };
        type = "text";
        val = [
          "  ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗  "
          "  ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║  "
          "  ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║  "
          "  ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║  "
          "  ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║  "
          "  ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝  "
        ];
      }
      {
        type = "padding";
        val = 2;
      }
      {
        type = "group";
        val = [
          {
            command = "<CMD>ene <CR>";
            desc = "  New file";
            shortcut = "e";
          }
          {
            command = ":qa<CR>";
            desc = "  Quit Neovim";
            shortcut = "SPC q";
          }
        ];
      }
      {
        type = "padding";
        val = 2;
      }
      {
        opts = {
          hl = "Keyword";
          position = "center";
        };
        type = "text";
        val = "Ya know it's funny, what's happening to us. Our lives have become digital. Our friends, now virtual.   ";
      }
      {
        opts = {
          hl = "Keyword";
          position = "center";
        };
        type = "text";
        val = "And, anything you could ever wanna know is just a click away. Experiencing the world through second    ";
      }
      {
        opts = {
          hl = "Keyword";
          position = "center";
        };
        type = "text";
        val = "hand information isn't enough. If we want authenticity we have to initiate it. We will never know our  ";
      }
      {
        opts = {
          hl = "Keyword";
          position = "center";
        };
        type = "text";
        val = "full potential unless we push ourselves to find it. It's this self-discovery that inevitably takes us  ";
      }
      {
        opts = {
          hl = "Keyword";
          position = "center";
        };
        type = "text";
        val = "to the wildest places on earth.                                                                        ";
      }
      {
        opts = {
          hl = "Keyword";
          position = "center";
        };
        type = "text";
        val = "- Travis Rice                                                                                          ";
      }
    ];
  };
}
