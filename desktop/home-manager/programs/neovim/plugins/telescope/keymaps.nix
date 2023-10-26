{
  pkgs,
  ...
}: {
  programs.nixvim.plugins.telescope.keymaps = {
		"<leader><leader>" = {
			action = "find_files";
			desc = "Telescope find files";
		};
		"<leader>g" = {
			action = "git_files";
			desc = "Telescope find git files";
		};
		"<leader>fg" = {
			action = "live_grep";
			desc = "Telescope live grep";
		};
  }; 
}
