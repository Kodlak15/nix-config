#!/usr/bin/env bash

# Remove whitespace and parentheses from all file names in current directory

IFS=$'\n'
files="$(ls .)"
read -d '' -ra array <<< "$files"

for fname in "${array[@]}"; do
	new_fname="$(echo "$fname" | tr -d ' ')"
	new_fname="${new_fname/\(/-}"
	new_fname="${new_fname/\)/}"
	mv "$fname" "$new_fname" 2> /dev/null
done
