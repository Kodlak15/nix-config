{
  inputs,
  pkgs,
  lib,
  ...
}: {
  # -------------------------------------------------------
  # Imports
  # -------------------------------------------------------
  imports = [
    ./hardware-configuration.nix
  ];

  # -------------------------------------------------------
  # Enable flakes and the new cl tool
  # -------------------------------------------------------
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # -------------------------------------------------------
  # Nix settings
  # -------------------------------------------------------
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  # -------------------------------------------------------
  # Enable unfree software on a per-package basis
  # -------------------------------------------------------
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
      "nvidia-persistenced"
      "steam"
      "steam-original"
      "steam-run"
      "intelephense"
      "cudatoolkit"
    ];

  # -------------------------------------------------------
  # Boot configuration
  # -------------------------------------------------------
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd = {
      availableKernelModules = [
        "cryptd"
      ];
      luks.devices = {
        nixos-crypt = {
          device = lib.mkDefault "/dev/disk/by-label/NIXOS";
          allowDiscards = true;
        };
      };
    };
  };

  # -------------------------------------------------------
  # Nvidia
  # -------------------------------------------------------
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
  };

  # -------------------------------------------------------
  # NixOS programs
  # -------------------------------------------------------
  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    zsh = {
      enable = true;
    };
  };

  # -------------------------------------------------------
  # System services
  # -------------------------------------------------------
  services = {
    openssh.enable = true;
    dbus.enable = true;
    printing.enable = true;
    xserver = {
      videoDrivers = ["nvidia"];
      libinput.enable = true;
    };
  };

  # -------------------------------------------------------
  # Default programs
  # -------------------------------------------------------
  users = {
    defaultUserShell = pkgs.zsh;
  };

  # -------------------------------------------------------
  # Environment
  # -------------------------------------------------------
  environment = {
    shells = with pkgs; [zsh];
  };

  # -------------------------------------------------------
  # Fonts
  # -------------------------------------------------------
  fonts.packages = with pkgs; [
    nerdfonts
  ];

  # -------------------------------------------------------
  # Networking
  # -------------------------------------------------------
  networking = {
    hostName = "everest";
    wireless.enable = true; # Enables wireless support via wpa_supplicant.
  };

  # Set your time zone.
  time.timeZone = "US/Pacific";

  # -------------------------------------------------------
  # Internationalisation properties.
  # -------------------------------------------------------
  i18n.defaultLocale = "en_US.UTF-8";

  # -------------------------------------------------------
  # Audio
  # -------------------------------------------------------
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # -------------------------------------------------------
  # Virtualisation
  # -------------------------------------------------------
  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
  };

  programs.dconf = {
    enable = true;
  };

  # -------------------------------------------------------
  # User account
  # -------------------------------------------------------
  # users.users.cody = {
  #   initialPassword = "towerponyforestjeep";
  #   isNormalUser = true;
  #   extraGroups = ["wheel" "video" "input" "tty"];
  #   openssh.authorizedKeys.keys = [];
  # };

  users.users.cody = {
    initialPassword = "towerponyforestjeep";
    isNormalUser = true;
    extraGroups = ["wheel" "audio" "video" "input" "docker" "libvirtd"];
    openssh.authorizedKeys.keys = [];
  };

  # -------------------------------------------------------
  # System packages
  # -------------------------------------------------------
  environment.systemPackages = with pkgs; [
    tmux
    wget
    curl
    git
    gh
    gnupg
    pass
    wineWowPackages.wayland
    nix-prefetch-git
    home-manager
    gnumake
  ];

  # -------------------------------------------------------
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  # -------------------------------------------------------
  system.stateVersion = "23.05"; # Did you read the comment?
}
