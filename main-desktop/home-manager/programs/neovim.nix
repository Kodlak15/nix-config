{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.neovim = {
    enable = true;
    # TODO: this is bad practice, should build config Nix way eventually
    extraConfig = lib.fileContents /home/cody/dotfiles/nvim/lazyvim/init.lua;
  };
}
