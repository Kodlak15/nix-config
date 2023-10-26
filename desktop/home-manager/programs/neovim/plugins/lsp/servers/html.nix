{pkgs, ...}: {
  programs.nixvim.plugins.lsp.servers.html = {
    enable = true;
    autostart = true;
    filetypes = ["html"];
    installLanguageServer = true;
  };
}
