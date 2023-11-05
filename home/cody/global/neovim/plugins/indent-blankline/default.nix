{
  imports = [
  ];

  programs.nixvim.plugins.indent-blankline = {
    enable = false;
    scope.enabled = false;
    indent = {
      char = "|";
      tabChar = "|";
    };
    exclude = {
      buftypes = [
        "terminal"
        "nofile"
        "quickfix"
        "prompt"
      ];
      filetypes = [
        "alpha"
        "dashboard"
        "neo-tree"
        "Trouble"
        "trouble"
        "notify"
        "toggleterm"
        "lspinfo"
        "packer"
        "checkhealth"
        "help"
        "man"
        "gitcommit"
        "TelescopePrompt"
        "TelescopeResults"
        "\'\'"
      ];
    };
  };
}
