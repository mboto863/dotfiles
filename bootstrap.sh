#!/usr/bin/env bash

 
set -e

# helper functions
function _echo() { printf "\n╓───── %s \n╙────────────────────────────────────── ─ ─ \n" "$1"; }

# install all the things \o/
_echo "Installing packages."
sudo dnf update &&
	sudo dnf install -y \
	curl \
	git \
	python3 \
	python3-pip \
	python3-venv \
	stow \
	zsh \
	zsh-syntax-highlighting
