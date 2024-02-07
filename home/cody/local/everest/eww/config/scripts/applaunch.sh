#!/usr/bin/env bash

librewolf() {
	exec librewolf &
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
	# exec discord &
	exec webcord &
}

case "$1" in
	--librewolf) librewolf ;;
	--spotify) spotify ;;
	--steam) steam ;;
	--discord) discord ;;
	*) echo "Invalid command..."
esac 
