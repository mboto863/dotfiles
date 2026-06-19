#!/usr/bin/env bash
# usage:
# curl -L  https://raw.githubusercontent.com/mboto863/dotfiles/atlantic/bootstrap.sh > x && chmod +x x && sudo ./x


# user variables
#export $ME='mboto'

# script variables
#MYHOME="/home/$ME"

# Usage of this requires a temp user with root privileges, to be authenticated with 1password, which is then forgotten in teardown. Check xero/dotfiles/setup.git.
#ASME="sudo -u $ME"

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
	stow \
	zsh \
	zsh-syntax-highlighting \
	tmux \
        btop

# =============================================================================
# BROOT
# =============================================================================

# broot dependencies
# Install the rust development environment
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh     
# Other dependencies.
sudo dnf install libxcb make automake gcc gcc-c++ kernel-devel -y
# Install broot via cargo, with clipboard features.
cargo install --locked --features clipboard broot 

# Change default shell to zsh.
sudo chsh -s $(which zsh) $(whoami)

# i do not want these dirs to be symlinks
_echo "creating directory skeletons"
mkdir -p \
	"$HOME"/.{config,local,cache} \
	"$HOME"/.local/{bin,share,state}

#_echo "setting up dotfiles"
#ASME git clone git@github.com:mboto863/dotfiles.git $MYHOME/.local/src/dotfiles &&
#	cd $MYHOME/.local/src/dotfiles &&
#	$ASME stow zsh -t $MYHOME
