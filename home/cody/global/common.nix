{pkgs, ...}: {
  home.packages = with pkgs; [
    # Browsers
    # firefox-devedition-unwrapped
    firefox-devedition
    librewolf
    brave
    tor-browser-bundle-bin

    # Dev
    gdb

    # Rerverse engineering
    ghidra

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
    
    # View and/or edit images
    imv
    gimp

    # Paint
    krita

    # Media
    spotify
    playerctl
    pavucontrol
    vlc
    ffmpeg

    # Screen recording/streaming
    obs-studio

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
