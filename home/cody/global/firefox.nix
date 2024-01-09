{pkgs, ...}: {
  programs.firefox = {
    package = pkgs.firefox-devedition;
    enable = true;
  };
}
