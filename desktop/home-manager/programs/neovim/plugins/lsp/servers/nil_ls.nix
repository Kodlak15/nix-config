{pkgs, ...}: {
  programs.nixvim.plugins.lsp.servers.nil_ls = {
    enable = true;
    autostart = true;
    filetypes = ["nix"];
    installLanguageServer = true;
    settings.formatting.command = [""]; # TODO
  };
}
