{
	pkgs,
	...
}: {
  imports = [
	];

	programs.nixvim.plugins.bufferline = {
		enable = true;
	};
}
