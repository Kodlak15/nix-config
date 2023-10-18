{ 
  inputs,
  outputs,
  lib,
  config, 
  pkgs, 
  hyprland,
  ... }: 
{
  imports = [
    inputs.hyprland.homeManagerModules.default
    ./hyprland
  ];

  # Git configuration
  programs.git = {
    enable = true;
    userName = "Kodlak15";
    userEmail = "stanlcod15@gmail.com";
  };

  # Packages to install to user profile
  home.packages = with pkgs; [
    # System info
    neofetch
    # Browsers
    librewolf
    brave
    # Utilities
    eza 
    ripgrep
    fzf
    tree
    # Networking
    socat
    nmap
    # Misc
    file
    which
    tree
    gnupg
    # Nix
    nix-output-monitor
    # Productivity
    glow
    btop
    htop # temporary
    # Syscall monitoring
    lsof
    # System tools
    lm_sensors
    pciutils
    usbutils
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
	draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let home-manager install and manager itself
  programs.home-manager.enable = true;
}
