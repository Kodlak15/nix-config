{ 
  inputs, 
  outputs, 
  config, 
  pkgs, 
  lib, 
  hyprland, 
  ...
}: {
  imports =
    [ 
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Import home-manager NixOS module
      inputs.home-manager.nixosModules.home-manager
    ];

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  # Enable flakes and the new cl tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable unfree software on a per-package basis
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
      "nvidia-persistenced"
    ];

  # Add home configurations
  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      cody = import ../home-manager/default.nix;
    };
  };

  # Booloader (maybe remove)
  boot = {
    initrd = {
      kernelModules = [ "nvidia" ];
    };
    extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
  };

  # Nvidia
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
  };

  # Hyprland
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Include necessary kernel modules
  boot.initrd.availableKernelModules = [
    "cryptd"
  ];

  # Set up LUKS device
  boot.initrd.luks.devices = {
    nixos-crypt = {
      device = lib.mkDefault "/dev/disk/by-label/NIXOS";
      allowDiscards = true;
    };
  };

  # Set up networking
  networking.hostName = "nixos";
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "US/Pacific";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # TODO this should probably be handled in home-manager directory
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cody = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "input" "tty" ]; 
    packages = with pkgs; [
      librewolf
      brave
      tree
    ];
  };

  # Declare system applications
  environment.systemPackages = with pkgs; [
    neovim
    tmux
    wget
    curl
    git
    gh
    gnupg
    pass
  ];

  # Declare environment variables
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";     # Instruct electron apps to use wayland
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable dbus
  services.dbus.enable = true;


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
