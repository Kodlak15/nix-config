#!/usr/bin/env bash

set -e

# Set the working directory
cd /home/cody/nix-config

mount_efi() {
	efipart="/dev/disk/by-label/EFI-NIXOS"
	if [[ -z "$(mount | grep /boot)" ]]; then 
    echo "Mounting $efipart at /boot..."
    sudo mount "$efipart" /boot
	fi
}

rebuild_nix() {
	mount_efi # Mount boot partition 
  nixos-rebuild switch --flake ".#$flake" --impure
}

rebuild_home() {
	if [[ -n $(pgrep -x ".eww-wrapped") ]]; then
	  killall ".eww-wrapped"
	fi
  home-manager switch --flake ".#cody@$flake" --impure
	eww open bar
}

flake="$1"
option="$2"
case $option in
	-n | --nix) rebuild_nix ;;
	-h | --home) rebuild_home ;;
	*) rebuild_home ;;
esac
