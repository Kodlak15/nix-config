#!/usr/bin/env bash

rebuild() {
  nixos-rebuild switch --flake /home/cody/.nix-config/main-desktop#main-desktop
}

user="$(whoami)"
case $user in
  root) 
    rebuild 
    ;;
  *) 
    echo "Cannot rebuild as user: $user" 
    exit 1
    ;;
esac
