#!/usr/bin/env bash

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
	--spotify) spotify ;;
	--steam) steam ;;
	--discord) discord ;;
	*) echo "Invalid command..."
esac 
