#!/bin/bash

# AUTHOR      : avimehenwal
# DATE        : 25-Oct-2020
# PURPOSE     : deploy dotfiles
# FILENAME    : deploy.sh
#
# Deploy all dotfiles to corresponding configuration folders
# Folders are not created by stow
#
# DEPENDENCY: GNU Stow
#
# stow -v --dir=$HOME/dotfiles --target=$HOME/.config/git --stow git
# stow -v --dir=$HOME/dotfiles --target=$HOME/.config/git --delete git

SOURCE=$HOME/dotfiles
PARTIAL=$HOME/.config
# BASE_CMD="stow --verbose=2 --dir=$SOURCE"
BASE_CMD="stow -v --dir=$SOURCE"

# CONFIG_DIRS=(nvim alacritty Code fish ranger vifm)
CONFIG_DIRS=(nvim alacritty vifm git cheat)

function create_dir() {
	# CONFLICT when stowing alacritty: existing target is not owned by stow: alacritty.yml
	rm -rv --force $TARGET
	mkdir --parents --verbose $TARGET
}

function usage() {
	toilet -f standard "avi dotfiles"
	cat <<EOF
	avimehenwal dotfiles @2020

	USAGE:	deploy.sh <link|unlink>

	deploy.sh link   - to generate symlinks to config directories
	deploy.sh unlink - to remove symlinks from system config files
	deploy.sh shell  - to use zshrc,bashrc from dotfiles and remove from $HOME
	deploy.sh code   - use vscode configs from dotfiles
	deploy.sh code!  - remove vscode configs from dotfiles

EOF
}

function remove_if_file_or_symlink_exists() {
	local FILE_NAME=$1
	if [[ -f $FILE_NAME || -L $FILE_NAME || -d $FILE_NAME ]]; then
		rm -rvf $FILE_NAME
	fi
}

function install_homedir_config() {
	# zsh
	ZSHRC=$HOME/.zshrc
	BASHRC=$HOME/.bashrc
	GITCONFIG=$HOME/.gitconfig

	remove_if_file_or_symlink_exists $ZSHRC
	remove_if_file_or_symlink_exists $BASHRC
	remove_if_file_or_symlink_exists $GITCONFIG

	ln --symbolic --verbose $SOURCE/shell/zshrc.zsh $ZSHRC
	ln --symbolic --verbose $SOURCE/shell/bashrc.bash $BASHRC
	ln --symbolic --verbose $HOME/dotfiles/HOME/.gitconfig $GITCONFIG
}

function install_vim() {
	VIM_TARGET=$HOME/.vim/
	[ ! -d "$VIM_TARGET" ] && mkdir --parents $VIM_TARGET
	$BASE_CMD --target=$VIM_TARGET --stow vim
}

function install_vscode() {
	# depending on platform
  #   Windows %APPDATA%\Code\User\settings.json
  #   macOS $HOME/Library/Application Support/Code/User/settings.json
  #   Linux $HOME/.config/Code/User/settings.json

  	# remove settings and snippets files if already exists
	if [[ "$OSTYPE" == "linux-gnu"* ]]; then
		stow -v --dir=$HOME/dotfiles/Code --target=$HOME/.config/Code/User User
	elif [[ "$OSTYPE" == "darwin"* ]]; then
		# remove_if_file_or_symlink_exists $HOME/Library/Application\ Support/Code/User/settings.json
		# remove_if_file_or_symlink_exists $HOME/Library/Application\ Support/Code/User/snippets
		stow -v --dir=$HOME/dotfiles/Code --target=$HOME/Library/Application\ Support/Code/User User
		# elif [[ "$OSTYPE" == "win32" ]]; then
					# I'm not sure this can happen.
	fi
}

function uninstall_vscode() {
	if [[ "$OSTYPE" == "linux-gnu"* ]]; then
		stow -v --dir=$HOME/dotfiles/Code --target=$HOME/.config/Code/User --delete User
	elif [[ "$OSTYPE" == "darwin"* ]]; then
		stow -v --dir=$HOME/dotfiles/Code --target=$HOME/Library/Application\ Support/Code/User --delete User
	fi
}

function uninstall_vim() {
	$BASE_CMD --target=$HOME/.vim/ --delete vim
}

# MAIN
# initalize and pull submodules
# git submodule update --init --recursive
for PRG in "${CONFIG_DIRS[@]}"; do
	TARGET=$PARTIAL/$PRG
	STOW="$BASE_CMD --target=$TARGET"

	case "$1" in
	clean | unlink)
		$STOW --delete $PRG
		uninstall_vim
		;;
	link)
		create_dir
		$STOW --stow $PRG
		;;
	shell)
		install_homedir_config
		exit 0
		;;
	vim)
		install_vim
		exit 0
		;;
	vim!)
		uninstall_vim
		exit 0
		;;
	code)
		install_vscode
		exit 0
		;;
	code!)
		uninstall_vscode
		exit 0
		;;
	*)
		usage
		exit 0
		;;
	esac
done

# END
