#!/usr/bin/env bash

librewolf() {
	exec librewolf &
}

spotify() {
	exec spotify &
}

steam() {
	if [[ ! -z $(command -v nvidia-offload) ]]; then
	  exec nvidia-offload steam &
	else
		exec steam &
	fi
}

discord() {
	if [[ ! -z $(command -v nvidia-offload) ]]; then
	  exec nvidia-offload discord &
	else
		exec discord &
	fi
}

case "$1" in
	--librewolf) librewolf ;;
	--spotify) spotify ;;
	--steam) steam ;;
	--discord) discord ;;
	*) echo "Invalid command..."
esac 
