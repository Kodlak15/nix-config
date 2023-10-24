{
  pkgs,
  config,
  ...
}: {
  programs.eww = {
    enable = true;
    configDir = "${config.users.users.cody.home}/.config/eww";
  };
}
