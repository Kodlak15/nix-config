#!/usr/bin/env bash

librewolf() {
	exec librewolf &
}

spotify() {
	exec spotify &
}

steam() {
	exec steam &
}

discord() {
	exec discord &
}

case "$1" in
	--librewolf) librewolf ;;
	--spotify) spotify ;;
	--steam) steam ;;
	--discord) discord ;;
	*) echo "Invalid command..."
esac 
