{pkgs, ...}: {
  home.packages = with pkgs; [
    neofetch
    librewolf
    brave
    tor-browser-bundle-bin
    discord
    spotify
    eza
    ripgrep
    fzf
    tree
    swww
    socat
    nmap
    file
    which
    tree
    gnupg
    nix-output-monitor
    glow
    btop
    lsof
    lm_sensors
    pciutils
    usbutils
    nvtop
    docker-compose
    virt-manager
    jq
    playerctl
    pavucontrol
    acpi
    imv
    ydotool
    brightnessctl

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
