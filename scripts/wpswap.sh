#!/usr/bin/env bash

# TODO:
# - error handling
# - allow for custom effects
# - refactor some messy code (next/prev come to mind)
# - consider restricting files/folders users input to those within $WPDIR

# Set the path the the swww binary
SWWW="$(which swww)"

# Set the path to the folder containing the wallpaper state
# - $STATE/current is a symlink to the current wallpaper
# - $STATE/temp is a symlink to some temporary wallpaper selection (for eww dashboard)
STATE="$HOME/.local/state/swww"

# Set the directory holding the wallpaper
# Directory should hold a set of categorized photos
# Ex:
# $WPDIR
# | - nature
#     | - nature1.jpg
#     | - nature2.jpg
#     | - nature3.jpg
# | - cities
#     | - cities1.jpg
#     | - cities2.jpg
#     | - cities3.jpg
# | - pets
#     | - pets1.jpg
#     | - pets2.jpg
#     | - pets3.jpg
# | - ...
WPDIR="$HOME/nix-config/home/cody/local/denali/images/wallpaper/"

# Transition variables
export TRANSITION_TYPE="wipe"
export TRANSITION_POS="0.75,0.9"
export TRANSITION_STEP="180"
export TRANSITION_DURATION="0.5"
export TRANSITION_ANGLE="180"

# Create a directory in .local to store wallpaper state
setup() {
	if [[ ! -d "$STATE" ]]; then
		mkdir -p "$STATE"
		dir="$(echo * | awk -F ' ' '{print $1}')"
		relpath="$(echo "$dir"/* | awk -F ' ' '{print $1}')"
		fpath="$WPDIR/$relpath"

		ln -sf "$fpath" "$STATE/current"
		ln -sf "$fpath" "$STATE/temp"
		ln -snf "$(wp_dir)" "$STATE/directory"
		ln -snf "$(temp_dir)" "$STATE/temp_directory"
	else
		case "$1" in
		-s | --setup)
			echo "State folder $STATE already exists!"
			echo "Delete $STATE and re-run setup if you wish to setup from scratch"
			;;
		esac
	fi
}

# Get the file name of the current wallpaper
wp_path() {
	# echo "$(readlink "$STATE/current")"
	readlink "$STATE/current"
}

# Get the directory in which the current wallpaper is held
wp_dir() {
	fpath="$(wp_path)"
	dir="$(echo "$fpath" | sed 's![^/]*$!!')"
	echo "${dir%/}"
}

# TODO
# Get the file name of the current wallpaper
temp_path() {
	# echo "$(readlink "$STATE/temp")"
	readlink "$STATE/temp"
}

# TODO
# Get the directory in which the temp wallpaper is held
temp_dir() {
	fpath="$(temp_path)"
	dir="$(echo "$fpath" | sed 's![^/]*$!!')"
	echo "${dir%/}"
}

# Set the wallpaper as $STATE/current
set_current() {
	$SWWW img \
		--transition-type $TRANSITION_TYPE \
		--transition-pos $TRANSITION_POS \
		--transition-step $TRANSITION_STEP \
		--transition-duration $TRANSITION_DURATION \
		--transition-angle $TRANSITION_ANGLE \
		"$STATE/current"
}

# Set the wallpaper as $STATE/temp
set_temp() {
	$SWWW img \
		--transition-type $TRANSITION_TYPE \
		--transition-pos $TRANSITION_POS \
		--transition-step $TRANSITION_STEP \
		--transition-duration $TRANSITION_DURATION \
		--transition-angle $TRANSITION_ANGLE \
		"$STATE/temp"

	# ln -sf "$STATE/temp" "$STATE/current"
	ln -sf "$(temp_path)" "$STATE/current"
	ln -snf "$(temp_dir)" "$STATE/directory"
}

# Set the wallpaper as some user specified file
set_file() {
	$SWWW img \
		--transition-type $TRANSITION_TYPE \
		--transition-pos $TRANSITION_POS \
		--transition-step $TRANSITION_STEP \
		--transition-duration $TRANSITION_DURATION \
		--transition-angle $TRANSITION_ANGLE \
		"$1"

	ln -sf "$1" "$STATE/current"
	ln -snf "$(wp_dir)" "$STATE/directory"
}

# Set the image directory as some user specified path
# Set the wallpaper as the first file found in that directory
# TODO : May be a good idea to find a way to handle when user does not use absolute path
set_dir() {
	fpath="$(find "$1" -maxdepth 1 -type f -printf "%f\n" | head -n 1)"

	$SWWW img \
		--transition-type $TRANSITION_TYPE \
		--transition-pos $TRANSITION_POS \
		--transition-step $TRANSITION_STEP \
		--transition-duration $TRANSITION_DURATION \
		--transition-angle $TRANSITION_ANGLE \
		"$1/$fpath"

	ln -sf "$1/$fpath" "$STATE/current"
	ln -snf "$(wp_dir)" "$STATE/directory"
}

# Swap the current temp file for a new one, passed as an argument
swap_current() {
	ln -sf "$1" "$STATE/current"
	ln -snf "$(wp_dir)" "$STATE/directory"
}

# Swap the current temp file for a new one, passed as an argument
swap_temp() {
	ln -sf "$1" "$STATE/temp"
	ln -snf "$(temp_dir)" "$STATE/temp_directory"
}

# Swap the current temp directory for a new one, passed as an argument
swap_temp_dir() {
	fpath="$(find "$1" -maxdepth 1 -type f -printf "%f\n" | head -n 1)"
	ln -sf "$1/$fpath" "$STATE/temp"
	ln -snf "$(temp_dir)" "$STATE/temp_directory"
}

# Swap the current wallpaper for the next image in the current active directory
# NOTE:: sed is 1-indexed by default, thus the need to add 1 to i
# TODO : this could probably be refactored
next() {
	if [[ "$1" == "--next-temp" ]]; then
		dir="$(temp_dir)"
		fpath="$(temp_path)"
		files="$(find "$dir" -type f | sort)"
		fc="$(echo "$files" | wc -l)"

		for ((i = 0; i <= fc; i++)); do
			fname="$(echo "$files" | sed -n "$((i + 1))p")"
			if [[ "$fname" == "$fpath" ]]; then
				next_idx="$(echo "($i + 1) % $fc" | bc)"
				break
			fi
		done

		next_fname="$(echo "$files" | sed -n "$((next_idx + 1))p")"
		swap_temp "$next_fname"
	else
		dir="$(wp_dir)"
		fpath="$(wp_path)"
		files="$(find "$dir" -type f | sort)"
		fc="$(echo "$files" | wc -l)"

		for ((i = 0; i <= fc; i++)); do
			fname="$(echo "$files" | sed -n "$((i + 1))p")"
			if [[ "$fname" == "$fpath" ]]; then
				next_idx="$(echo "($i + 1) % $fc" | bc)"
				break
			fi
		done

		next_fname="$(echo "$files" | sed -n "$((next_idx + 1))p")"
		set_file "$next_fname"
	fi
}

# Swap the current wallpaper for the previous image in the specified directory
# NOTE:: sed is 1-indexed by default, thus the need to add 1 to i
# TODO : this could probably be refactored
prev() {
	if [[ "$1" == "--prev-temp" ]]; then
		dir="$(temp_dir)"
		fpath="$(temp_path)"
		files="$(find "$dir" -type f | sort)"
		fc="$(echo "$files" | wc -l)"

		for ((i = 0; i <= fc; i++)); do
			fname="$(echo "$files" | sed -n "$((i + 1))p")"
			if [[ "$fname" == "$fpath" ]]; then
				if [[ "$i" == 0 ]]; then
					prev_idx="$(echo "$fc - 1" | bc)"
				else
					prev_idx="$(echo "($i - 1) % $fc" | bc)"
				fi
				break
			fi
		done

		prev_fname="$(echo "$files" | sed -n "$((prev_idx + 1))p")"
		swap_temp "$prev_fname"
	else
		dir="$(wp_dir)"
		fpath="$(wp_path)"
		files="$(find "$dir" -type f | sort)"
		fc="$(echo "$files" | wc -l)"

		for ((i = 0; i <= fc; i++)); do
			fname="$(echo "$files" | sed -n "$((i + 1))p")"
			if [[ "$fname" == "$fpath" ]]; then
				if [[ "$i" == 0 ]]; then
					prev_idx="$(echo "$fc - 1" | bc)"
				else
					prev_idx="$(echo "($i - 1) % $fc" | bc)"
				fi
				break
			fi
		done

		prev_fname="$(echo "$files" | sed -n "$((prev_idx + 1))p")"
		set_file "$prev_fname"
	fi
}

# Print the available commands
print_help() {
	echo "\
------------------------------------------------------------
Available commands:
------------------------------------------------------------
-p | --path)          Print the file path for the current wallaper to stdout
-d | --dir)           Print the path to the directory holding the current wallpaper to stdout
-v | --temp-path)     Print the path to the temp wallpaper to stdout
-w | --temp-dir)      Print the path to the directory holding the temp wallpaper to stdout
-D | --set-dir        Set the image directory as some specified path
-s | --setup)         As of now simply tells you to delete the state folder and run again
-c | --current)       Set the wallpaper to $STATE/current
-C | --swap-current)  Set $STATE/current to some specified file
-t | --temp)          Set the wallpaper to $STATE/temp
-T | --swap-temp)     Set $STATE/temp to some specified file
-W | --swap-temp-dir) Set $STATE/temp_directory to some specified directory
-f | --fname)         Set the wallpaper to some specified file
-n | --next)          Swap the current wallpaper for the next image in the current directory
                      --next-temp) Swap the temp wallpaper instead
-P | --prev)          Swap the current wallpaper for the previous image in the current directory
                      --prev-temp) Swap the temp wallpaper instead
-h | --help)          Print the available commands to stdout"
}

# Acts as the entry point for the script
run() {
  # Set the working directory
  cd "$WPDIR" || exit

	# Set up if necessary
	setup "$1"

	# Handle argument(s)
	case "$1" in
	-p | --path) wp_path ;;
	-d | --dir) wp_dir ;;
	-v | --temp-path) temp_path ;;
	-w | --temp-dir) temp_dir ;;
	-D | --set-dir) set_dir "$2" ;;
	-s | --setup) setup ;;
	-c | --current) set_current ;;
	-C | --swap-current) swap_current "$2" ;;
	-t | --temp) set_temp ;;
	-T | --swap-temp) swap_temp "$2" ;;
	-W | --swap-temp-dir) swap_temp_dir "$2" ;;
	-f | --fname) set_file "$2" ;;
	-n | --next) next "$2" ;;
	-P | --prev) prev "$2" ;;
	-h | --help | *) print_help ;;
	esac

	# Uncomment this line if using pywal
	# Set terminal colors based on current image
	wal -i "$(wp_path)" -n

	# Uncomment this line if using pywal
	# Reload eww bar to load new colors
	eww reload

	# Uncomment this line if using pywal
	# Reload eww bar to load new colors
	# source "/home/cody/.zshrc"
	
	sleep 4

	# Get a list of all running Zsh processes
  zsh_pids=$(pgrep -l zsh | awk '{print $1}')

  # Iterate through each Zsh process and execute the function
  for pid in $zsh_pids; do
    # Check if the process is still running
    if ps -p "$pid" > /dev/null; then
      # Execute the function within the Zsh process
      zsh -c "source $HOME/.zshrc" -p "$pid"
			echo "Sourced .zshrc for process $pid"
    fi
  done
}

# Call run function to run the script
run "$1" "$2"
