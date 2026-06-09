#!/usr/bin/env bash

# Script to install zsh

set -e

echo "Checking for zsh installation."
if ! command -v zsh &> /dev/null
then
	echo "Installing zsh..."
	sudo apt -y install zsh
else
	echo "zsh is already installed."
fi

# Check if oh-my-zsh is present
if [ -d $HOME/.oh-my-zsh ];
then
	echo "oh-my-zsh is present locally. Skipping installation of oh-my-zsh."
else
	# Install oh-my-zsh
	echo "Installing oh-my-zsh..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

	source ~/.zshrc

	echo "Installing plugins..."

	echo "Installing syntax highlighting"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH/custom/plugins/zsh-syntax-highlighting
fi

