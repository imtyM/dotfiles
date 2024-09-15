#!/bin/bash

set -e # Enable strict error handling

if grep -q 'ID=nixos' /etc/os-release; then
	echo "This install script does not support NixOS."
	exit 1
fi

# Call the stow script to stow files
./stow.sh
