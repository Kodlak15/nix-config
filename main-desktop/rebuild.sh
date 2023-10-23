#!/usr/bin/env bash

FLAKE="/home/cody/.nix-config/main-desktop#main-desktop"
EFIPART="/dev/disk/by-label/EFI-NIXOS"

mount_efi() {
  if [[ -z "$(mount | grep /boot)" ]]; then
    echo "Mounting $EFIPART at /boot..."
    mount "$EFIPART" /boot
  fi
}

rebuild() {
  nixos-rebuild switch --flake "$FLAKE"
}

user="$(whoami)"
case $user in
  root) 
    echo "Rebuilding using flake: $FLAKE"
    mount_efi
    rebuild 
    ;;
  *) 
    echo "Cannot rebuild as current user: $user" 
    exit 1
    ;;
esac
