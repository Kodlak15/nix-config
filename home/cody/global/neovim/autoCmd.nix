{
  programs.nixvim.autoCmd = [
    # { # THIS DOES NOT WORK
    #   event = [ "BufWritePre" ];
    #   pattern = [ "*.templ" ];
    #   command = "vim.lsp.buf.format";
    # }
    # { # THIS DOES NOT WORK
    #   event = [ "BufWritePre" ];
    #   pattern = [ "*.templ" ];
    #   callback = "vim.lsp.buf.format";
    # }
  ];
}
