{
  imports = [
  ];

  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      ensureInstalled = "all";
      indent = true;
    };

    treesitter-context = {
      enable = true;
      mode = "cursor";
      maxLines = 3;
    };

    treesitter-refactor = {
      enable = true;
    };

    ts-autotag = {
      enable = true;
    };
  };
}
