#!/bin/bash

# Function to check if a program is installed
ensure_installed() {
	# Check if the program is installed
	if ! command -v "$1" &>/dev/null; then
		echo "Error: $1 is not installed. Installation required."
		exit 1
	fi
}
