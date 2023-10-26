{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./neovim
    ./common.nix
    ./git.nix
    ./alacritty.nix
    ./zsh.nix
    ./eww.nix
  ];
}
