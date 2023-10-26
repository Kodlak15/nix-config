{pkgs, ...}: {
  programs.nixvim.plugins.lsp.servers.gopls = {
    enable = true;
    autostart = true;
    filetypes = ["go"];
    installLanguageServer = true;
  };
}
