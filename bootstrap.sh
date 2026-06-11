#!/usr/bin/env bash
# usage:
# curl -L  https://raw.githubusercontent.com/mboto863/dotfiles/atlantic/bootstrap.sh > x && chmod +x && sudo ./x


# user variables
export $ME='mboto'

# script variables
MYHOME="/home/$ME"
ASME="sudo -u $ME"

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

# i do not want this dirs to be symlinks
_echo "creating directory skeletons"
$ASME mkdir -p \
	$MYHOME/.{config,local} \
	$MYHOME/.local/{bin,docs,cache,lib,share,src,state} \
	$MYHOME/.local/state/zsh

_echo "setting up dotfiles"
$ASME git clone git@github.com:mboto863/dotfiles.git $MYHOME/.local/src/dotfiles &&
	cd $MYHOME/.local/src/dotfiles &&
	$ASME stow zsh -t $MYHOME
