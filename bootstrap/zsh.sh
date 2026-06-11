#!/usr/bin/env bash

# Script to install zsh

set -e

sudo dnf update
echo "Checking for zsh installation."
if ! command -v zsh &> /dev/null
then
	echo "Installing zsh..."
	sudo dnf -y install zsh
else
	echo "zsh is already installed."
fi

sudo dnf -y install zsh-syntax-highlighting
