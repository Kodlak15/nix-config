{
  imports = [
  ];

  programs.nixvim.plugins.comment-nvim = {
    enable = true;
    opleader = {
      line = "<Leader>k";
      block = "<Leader>l";
    };
    toggler = {
      line = "<Leader>k";
      block = "<Leader>l";
    };
  };
}
