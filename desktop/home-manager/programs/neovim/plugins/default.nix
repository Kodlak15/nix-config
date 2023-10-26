{
  pkgs,
  ...
}: {
  imports = [
    ./lsp
    ./treesitter
		./telescope
  ];
}
