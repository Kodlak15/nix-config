{pkgs, ...}: {
  imports = [
    ./servers
  ];

  programs.nixvim.plugins.lsp = {
    enable = true;
  };
}
