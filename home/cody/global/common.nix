{pkgs, ...}: {
  home.packages = with pkgs; [
    # Browsers
    librewolf
    brave
    tor-browser-bundle-bin

    # Dev

    # System info
    neofetch
    nix-output-monitor
    btop
    lsof
    nvtop
    lm_sensors
    pciutils
    usbutils

    # System tools
    eza
    ripgrep
    fzf
    tree
    socat
    file
    which
    tree
    p7zip
    jq
    ydotool

    # Wallpaper
    swww

    # Markdown viewer
    glow

    # Security
    gnupg

    # Network analysis
    nmap

    # Gaming
    discord
    winetricks
    wineWowPackages.waylandFull

    # Containerisation and virtualisation
    virt-manager
    docker-compose
    
    # View images
    imv

    # Music and sound
    spotify
    playerctl
    pavucontrol

    # Power and brightness
    acpi
    brightnessctl
    linuxKernel.packages.linux_zen.ddcci-driver

    # File expolorer
    xfce.thunar

    # Yubikey
    yubikey-personalization

    # Screenshots
    grim 
    slurp

    # Pywal
    pywal
    python311Packages.colorthief

    # Neovim/Vim plugins
    vimPlugins.friendly-snippets
  ];
}
