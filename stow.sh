#!/bin/bash

set -e # Enable strict error handling
source utils.sh

# Script to check and install stow, then stow files in the current directory

# Check the operating system
os_name=$(uname)

# Function to check stow installation
check_and_install_stow() {
	# Check if stow is installed
	if ! command -v stow &>/dev/null; then
		echo "Stow is not installed. Installing..."

		# Call the appropriate install function based on OS
		case $os_name in
		Linux)
			install_stow_linux
			;;
		Darwin)
			install_stow_macos
			;;
		*)
			echo "** Could not identify operating system. Stow installation not attempted."
			;;
		esac
	else
		echo "Stow is already installed."
	fi
}

# Function to install stow on Debian/Ubuntu
install_stow_linux() {
	if which dpkg &>/dev/null; then
		echo "Installing stow using apt (assuming Debian-based distro)"
		sudo apt install stow
	elif which pacman &>/dev/null; then
		echo "Installing stow using pacman (assuming Arch-based distro)"
		sudo pacman -S stow
	else
		echo "** This script is not currently configured for your package manager."
		echo "** Please consult your distribution's documentation for instructions on installing stow."
	fi
}

# Function to install stow on macOS
install_stow_macos() {
	echo "Installing stow using brew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &>/dev/null
	brew install stow
}

# Function to stow files in current directory
stow_current_directory() {
	echo "Stowing files in the current directory..."
	stow */ --adopt
	git restore .
}

# Call the check_and_install_stow function
check_and_install_stow
ensure_installed stow
stow_current_directory
