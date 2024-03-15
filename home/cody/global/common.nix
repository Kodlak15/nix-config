{pkgs, ...}: {
  home.packages = with pkgs; [
    # Browsers
    librewolf
    brave
    tor-browser-bundle-bin

    # Debuggin and Rerverse engineering
    gdb
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
    inotify-tools
    unzip

    # Dev tools
    trunk

    # Markdown editor
    logseq

    # Wallpaper
    swww

    # Markdown viewer/editor
    glow

    # Security
    gnupg

    # Network analysis
    nmap
    wireshark

    # Flipper Zero software
    qflipper

    # Gaming
    webcord # discord alternative
    winetricks
    wineWowPackages.waylandFull

    # Containerisation and virtualisation
    virt-manager
    docker-compose

    # View and/or edit images
    imv
    gimp

    # Paint
    pinta

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
    # linuxKernel.packages.linux_zen.ddcci-driver (need to fix for laptop brightness control, broke with update)

    # File expolorer
    xfce.thunar

    # Terminal multiplexer
    # zellij

    # Yubikey
    yubikey-personalization

    # Screenshots
    grim
    slurp

    # Pywal
    pywal
    python311Packages.colorthief

    # Neovim/Vim plugins
    # neovim
    vimPlugins.friendly-snippets
    vimPlugins.nvim-treesitter-parsers.templ
  ];
}
