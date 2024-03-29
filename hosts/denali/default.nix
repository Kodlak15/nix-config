{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
      "nvidia-persistenced"
      "steam"
      "steam-original"
      "steam-run"
      "cudatoolkit"
    ];

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

  hardware = {
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = true;
      nvidiaSettings = true;
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };

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

  services = {
    openssh.enable = true;
    dbus.enable = true;
    printing.enable = true;
    xserver = {
      videoDrivers = ["nvidia"];
      libinput.enable = true;
    };
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };
    getty.autologinUser = "cody";
  };

  security = {
    rtkit.enable = true;
  };

  users = {
    defaultUserShell = pkgs.zsh;
  };

  environment = {
    shells = with pkgs; [zsh];
    variables = {
      EDITOR = "nvim";
    };
  };

  fonts.packages = with pkgs; [
    nerdfonts
  ];

  networking = {
    hostName = "denali";
    networkmanager.enable = true;
    firewall.enable = true;
  };

  time.timeZone = "US/Pacific";

  i18n.defaultLocale = "en_US.UTF-8";

  sound.enable = true;
  hardware.pulseaudio.enable = false;

  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
  };

  programs.dconf = {
    enable = true;
  };

  users.users.cody = {
    initialPassword = "towerponyforestjeep";
    isNormalUser = true;
    extraGroups = ["wheel" "audio" "video" "input" "dialout" "docker" "libvirtd" "wireshark"];
    openssh.authorizedKeys.keys = [];
  };

  environment.systemPackages = with pkgs; [
    tmux
    wget
    curl
    git
    gh
    gnupg
    pass
    nix-prefetch-git
    home-manager
    gnumake
    bc
    killall
  ];

  system.stateVersion = "23.05";
}
