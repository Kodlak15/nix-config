{
  pkgs,
  ...
}: {
	imports = [
	];

  programs.nixvim.plugins.treesitter = {
    enable = true;
    ensureInstalled = "all";
  }; 
}
