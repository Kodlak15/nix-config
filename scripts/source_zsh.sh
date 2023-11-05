#!/usr/bin/env bash

set -e

# Get a list of all running Zsh processes
zsh_pids=$(pgrep -l zsh | awk '{print $1}')

# Iterate through each Zsh process and send a command to reload .zshrc
for pid in $zsh_pids; do
  # Check if the process is still running
  if ps -p $pid > /dev/null; then
    # Focus on the GNOME Terminal window
    alacritty --window-with-process=$pid
    # Send the source command to the Zsh process
    sleep 0.5 # Adjust this delay as needed
    xdotool key ctrl+shift+t type 'source ~/.zshrc'
    xdotool key Return
    echo "Sourced .zshrc for process $pid"
  fi
done

