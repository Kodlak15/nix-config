#!/usr/bin/env bash

for ((i = 1; i <= 10; i++)); do
	hyprctl dispatch workspace "$i"
	windows="$(hyprctl workspaces | grep -A 2 "ID $i" | grep windows | awk -F ' ' '{print $2}')"
	for ((j = 0; j < "$windows"; j++)); do
		echo "hello from workspace $i, window $j"
	done
done

hyprctl dispatch workspace "1"
