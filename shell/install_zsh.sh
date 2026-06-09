#!/usr/bin/env bash

# script to install zsh

set -e

echo "Checking for zsh installation."
if ! command -v zsh &> /dev/null
then
	echo "Installing zsh..."
	sudo apt -y install zsh
else
	echo "zsh is already installed."
fi

# install oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
