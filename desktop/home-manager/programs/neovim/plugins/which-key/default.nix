{
	pkgs,
	...
}: {
  imports = [
	];

	programs.nixvim.plugins.which-key = {
		enable = true;
	};
}