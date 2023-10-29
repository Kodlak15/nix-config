# {inputs, ...}:
{
  programs.nixvim.plugins.notify = {
    enable = true;
    timeout = 3000;
    # maxHeight = inputs.nixvim.config.helpers.mkRaw ''
    #   function()
    #     return math.floor(vim.o.lines * 0.75)
    #   end
    # '';
    # maxWidth = helpers.mkRaw ''
    #   function()
    #     return math.floor(vim.o.columns * 0.75)
    #   end
    # '';
    # onOpen = helpers.mkRaw ''
    #   function(win)
    #     vim.api.nvim_win_set_config(win, { zindex = 100 })
    #   end
    # '';
  };
}
