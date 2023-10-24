{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./common.nix
    ./git.nix
    ./alacritty.nix
    ./zsh.nix
    ./eww.nix
  ];
}
