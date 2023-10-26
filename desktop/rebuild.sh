#!/usr/bin/env bash

FLAKE="/home/cody/nix-config/desktop#hypr"
HOMEMGR="/home/cody/nix-config/desktop#cody@hypr"
EFIPART="/dev/disk/by-label/EFI-NIXOS"

validate_user() {
  user="$(whoami)"
  expected="$1"
  if [[ ! "$user" == "$expected" ]]; then
    echo "Cannot rebuild as current user: $user"
    echo "Expected user: $expected"
    exit 1
  fi
}

mount_efi() {
  if [[ -z "$(mount | grep /boot)" ]]; then
    echo "Mounting $EFIPART at /boot..."
    sudo mount "$EFIPART" /boot
  fi
}

rebuild_nix() {
  expected_user="root"
  validate_user $expected_user
  echo "Rebuilding system configuration using flake: $FLAKE"
  nixos-rebuild switch --flake "$FLAKE" --impure
}

rebuild_home() {
  expected_user="cody"
  validate_user $expected_user
  echo "Rebuilding home configuration using flake: $HOMEMGR"
  home-manager switch --flake "$HOMEMGR" --impure
}

# Assure that the efi boot partition is mounted
mount_efi       

# -------------------------------------------------------
# Rebuild according to user input
# -------------------------------------------------------
option="$1"
case $option in
-n | --nix) 
  rebuild_nix 
  ;;
h | --home) 
  rebuild_home
  ;;
*) 
  rebuild_home
  ;;
esac