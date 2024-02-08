#!/usr/bin/env bash

librewolf() {
	exec librewolf &
}

firefox() {
	exec firefox-devedition &
}

spotify() {
	exec spotify &
}

steam() {
	if [[ -n "$(command -v nvidia-offload)" ]]; then
		exec nvidia-offload steam &
	else
	  exec steam &
	fi
}

discord() {
	exec webcord &
}

gimp() {
	exec gimp &
}

case "$1" in
	--librewolf) librewolf ;;
	--firefox) firefox ;;
	--spotify) spotify ;;
	--steam) steam ;;
	--discord) discord ;;
	--gimp) gimp ;;
	*) echo "Invalid command..."
esac 
