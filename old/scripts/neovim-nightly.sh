#!/bin/bash -x
#
# AUTHOR  : avimehenwal
# CREATED : Fri Dec  4 02:55:25 PM CET 2020
# PURPOSE : install neovim nightly build

set -o verbose
name=nvim.appimage
path=/tmp
dest=$(whereis nvim | awk '{print $2}')

curl -L https://github.com/neovim/neovim/releases/download/nightly/$name \
	-o $path/$name
chmod +x $path/$name
sudo mv --verbose /$path/$name $dest

function brew_nvim() {
	# Nightly version
	brew install --HEAD neovim

	# Sometimes you need to update
	brew upgrade neovim --fetch-HEAD
}

# https://tldp.org/LDP/abs/html/options.html

# END
