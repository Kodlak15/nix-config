{
  pkgs,
  ...
}: {
  imports = [
    ./lsp
		./cmp
    ./treesitter
		./telescope
		./neo-tree
  ];
}
