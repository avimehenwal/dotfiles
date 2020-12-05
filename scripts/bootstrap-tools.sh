#!/bin/bash
#
# AUTHOR      : avimehenwal
# DATE        : 05-Dec-2020
# FILENAME    : bootstrap-tools.sh
#
# Install commonly used CLI tools (if not already installed)
# Idempotent Behaviour via dnf,Homebrew package managers

PIP=(termgraph)
BREW=(git-flow-avh zplug diff-so-fancy)
DNF=(zsh fish bat fd-find toilet figlet)

# Todo
# -> better logs with colors and log level formats
# -> perhaps a dry-run feature which displays commands it will run
# -> check if Homebrew is already installed or not else install it

loop_over() {
  local CMD=$1
  shift
  # rebuild array with rest of the arguments
  local LIST=("$@")
  for ITEM in ${!LIST[@]}; do
    echo "$CMD ${LIST[$ITEM]}"
    $CMD ${LIST[$ITEM]}
  done
}

from_brew() {
  # command sub-command option
  local CMD="brew install --verbose"
  # use quotes " when passing arguments
  loop_over "${CMD}" "${BREW[@]}"
}

from_pip() {
  local CMD="python -m pip install"
  loop_over "${CMD}" "${PIP[@]}"
}

from_dnf() {
  sudo dnf install -y ${DNF[@]}
}

from_git() {
  # with zplug and dnf, keybinding are NOT working
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
}

test() {
  [ -x $HOME/.local/bin/diff-so-fancy ] && echo Y || echo N
}

# MAIN
from_dnf
from_pip
from_brew
from_git

# END
