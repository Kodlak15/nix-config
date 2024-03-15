{
  imports = [
    ./plugins
    ./keymaps.nix
    ./options.nix
    ./autoCmd.nix
  ];

  programs.nixvim = {
    enable = true;
    globals = {
      mapleader = " ";
    };
    filetype = {
      extension = {
        templ = "templ";
      };
    };
    colorschemes = {
      tokyonight = {
        enable = false;
        style = "night";
      };
      catppuccin = {
        enable = false;
        flavour = "mocha";
        terminalColors = true;
      };
      rose-pine = {
        enable = true;
        transparentBackground = true;
        transparentFloat = true;
        style = "main";
      };
    };
    viAlias = true;
    vimAlias = true;
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
    # Attempt to create autocmd for formatting .templ files
    extraConfigLua = ''
      local templ_format = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local filename = vim.api.nvim_buf_get_name(bufnr)
        local cmd = "templ fmt " .. vim.fn.shellescape(filename)

        vim.fn.jobstart(cmd, {
          on_exit = function()
            -- Reload the buffer only if it's still the current buffer
            if vim.api.nvim_get_current_buf() == bufnr then
              vim.cmd('e!')
            end
          end,
        })
      end

      vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = templ_format})
    '';
  };
}
