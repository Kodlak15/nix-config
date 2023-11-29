{
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
        {name = "crates";}
      ];
      mapping = {
        # "<C-n>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })";
        # "<C-p>" = "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })";
        # "<A-j>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })";
        # "<A-k>" = "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })";
        "<Tab>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })";
        "<S-Tab>" = "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })";
        "<C-b>" = "cmp.mapping.scroll_docs(-4)";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-e>" = "cmp.mapping.abort()";
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        # "<tab>" = {
        #   action = ''
        #      function(fallback)
        #       if cmp.visible() then
        #     		cmp.select_next_item()
        #     	elseif luasnip.expandable() then
        #     	  luasnip.expand()
        #     	elseif luasnip.expand_or_jumpable() then
        #          luasnip.expand_or_jump()
        #     	elseif check_backspace() then
        #     	  fallback()
        #     	else
        #     		fallback()
        #     	end
        #     end
        #   '';
        #   modes = ["i" "s"];
        # };
        # "<S-Tab>" = {
        #   action = ''
        #      function(fallback)
        #       if cmp.visible() then
        #     		cmp.select_prev_item()
        #     	elseif luasnip.jumpable(-1) then
        #     	  luasnip.jump(-1)
        #     	else
        #     		fallback()
        #     	end
        #     end
        #   '';
        #   modes = ["i" "s"];
        # };
      };
      snippet.expand = "luasnip";
    };
  };
}
