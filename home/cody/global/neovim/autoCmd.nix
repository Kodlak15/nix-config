{
  programs.nixvim.autoCmd = [
    # { # THIS DOES NOT WORK
    #   event = [ "BufWritePre" ];
    #   pattern = [ "*.templ" ];
    #   command = "vim.lsp.buf.format";
    # }
  ];
}
