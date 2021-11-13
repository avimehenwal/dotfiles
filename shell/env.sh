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
# resolve issue with bold formatting https://github.com/sharkdp/bat/issues/652
export MANROFFOPT="-c"
export MANPAGER="sh -c 'sed -e s/.\\\\x08//g | bat --language man -p'"
# export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

# LOCALE
export LANG=en_US.UTF-8

# PROGRAMS
export EDITOR=nvim
# export BROWSER=brave-browser
export BROWSER=firefox
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
export FZF_DEFAULT_OPTS="
--ansi
--cycle
--border
--preview-window=right:60%
"
# --preview 'bat --color=always --line-range :300 {}'

# export FORGIT_FZF_DEFAULT_OPTS="
# --ansi
# --exact
# --border
# --cycle
# --reverse
# --height '90%'
# "
export FORGIT_LOG_FZF_OPTS="
--height '100%""'
"
export CHEAT_CONFIG_PATH="$HOME/dotfiles/cheat/conf.yml"
export CHEAT_USE_FZF=true
# starship prompt
export STARSHIP_CONFIG=$HOME/dotfiles/starship/starship.toml

# END
