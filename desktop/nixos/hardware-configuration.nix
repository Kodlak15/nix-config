# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["nvme" "ahci" "thunderbolt" "xhci_pci" "usb_storage" "usbhid" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/063f0d8d-c9a8-439d-9753-d2a177fc630b";
    fsType = "btrfs";
    options = ["subvol=@"];
  };

  boot.initrd.luks.devices."nixos-crypt".device = "/dev/disk/by-uuid/93d41d59-c9c5-4960-a27b-afeb217fd11e";

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/063f0d8d-c9a8-439d-9753-d2a177fc630b";
    fsType = "btrfs";
    options = ["subvol=@home"];
  };

  fileSystems."/tmp" = {
    device = "/dev/disk/by-uuid/063f0d8d-c9a8-439d-9753-d2a177fc630b";
    fsType = "btrfs";
    options = ["subvol=@tmp"];
  };

  fileSystems."/var" = {
    device = "/dev/disk/by-uuid/063f0d8d-c9a8-439d-9753-d2a177fc630b";
    fsType = "btrfs";
    options = ["subvol=@var"];
  };

  swapDevices = [];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp7s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
