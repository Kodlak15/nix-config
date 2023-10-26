{pkgs, ...}: {
  programs.nixvim.plugins = {
    cmp-nvim-lsp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp_luasnip.enable = true;
    nvim-cmp = {
      enable = true;
      autoEnableSources = true;
      sources = [
        {name = "nvim_lsp";}
        {name = "luasnip";}
        {name = "path";}
        {name = "buffer";}
      ];
      mapping = {
        "<cr>" = "cmp.mapping.confirm({ select = true })";
        "<tab>" = {
          action = ''
             function(fallback)
              if cmp.visible() then
            		cmp.select_next_item()
            	elseif luasnip.expandable() then
            	  luasnip.expand()
            	elseif luasnip.expand_or_jumpable() then
                 luasnip.expand_or_jump()
            	elseif check_backspace() then
            	  fallback()
            	else
            		fallback()
            	end
            end
          '';
          modes = ["i" "s"];
        };
      };
    };
  };
}
