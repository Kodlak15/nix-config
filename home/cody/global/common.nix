{pkgs, ...}: {
  home.packages = with pkgs; [
    neofetch
    librewolf
    brave
    webcord
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
  ];
}
