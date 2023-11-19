#!/usr/bin/env bash

core_temp() {
	temp_sum=0
	cores=8

	for ((i = 0; i < cores; i++)); do
		temp="$(sensors | grep "Core $i" | awk -F '+' '{print $2}' | awk -F '°' '{print $1}')"
		temp_sum="$(echo "$temp_sum + $temp" | bc)"
	done

	echo "$temp_sum / $cores" | bc 
}

cpu_usage() {
	idle="$(vmstat 1 2 | tail -1 | awk '{print $15}')"
	echo "100 - $idle" | bc
}

case $1 in 
	--core-temp) core_temp ;;
	--cpu-usage) cpu_usage ;;
esac
