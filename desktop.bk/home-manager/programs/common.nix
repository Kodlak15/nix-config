{
  pkgs,
  ...
}: {
  # Packages to install to user profile
  home.packages = with pkgs; [
    # System info
    neofetch
    # Browsers
    librewolf
    brave
    # Chat
    webcord
    # Utilities
    eza 
    ripgrep
    fzf
    tree
    # Wallpaper
    swww
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
}

