#!/bin/bash

# SOURCE=$(pwd)
# DESTINATION=$HOME

# stow --stow --verbose \ 
# 	--dir=${SOURCE}/git \
# 	--target=${DESTINATION} \
# 	--simulate

LN="ln --symbolic --verbose"

remove_file_if_exists () {
	local FILE=$1
	[ -e ${FILE} ] && rm -rfv ${FILE}
}

install_multiuser_gitconfig () {
	local GITCONFIG=~/.gitconfig
	
	remove_file_if_exists ${GITCONFIG}
	${LN} ${PWD}/git/gitconfig-base ${GITCONFIG}
	
	# TEST
	ls -halt ${GITCONFIG}
}

install_bashrc () {
	local BASHRC=${PWD}/shell/bashrc
	local BASHRC_TARGET=~/.bashrc

	# pre-condition
	remove_file_if_exists ${BASHRC_TARGET}
	
	# command
	${LN} ${BASHRC} ${BASHRC_TARGET}

	# test
	ls -halt ${BASHRC_TARGET}
}

# MAIN
install_bashrc
install_multiuser_gitconfig