{
  pkgs,
  config,
  ...
}: {
  programs.eww = {
    enable = true;
    configDir = "/home/cody/dotfiles/eww/bars/default";
  };
}
