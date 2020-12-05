#!/bin/bash
#
# AUTHOR      : avimehenwal
# DATE        : 05-Dec-2020
# PURPOSE     : shared environment variables
# FILENAME    : env.sh
#
# Shell agnostic environment variables for default programs
# shared with bash,zsh,fish

# MANPAGES
# use bat to color man pages
export MANPATH="/usr/local/man:$MANPATH"
export MANPAGER="sh -c 'sed -e s/.\\\\x08//g | bat --language man -p'"
# export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

# LOCALE
export LANG=en_US.UTF-8

# PROGRAMS
export EDITOR=vim
export BROWSER=brave-browser
# CopyQ only works on X and not on Wayland desktop environment
export COPY_PRG=wl-copy

# else vifm coloscheme fails, BUT tmux needs TERM=xterm else wont start
# debug term colors command
# echo $TERM
# tput colors
# infocmp -x
# export TERM=xterm
export TERM=xterm-256color

# FZF
export FZF_DEFAULT_OPTS='--cycle --border'
# export FZF_DEFAULT_COMMAND

# END
