#!/bin/bash
#
# AUTHOR      : avimehenwal
# DATE        : 05-Dec-2020
# FILENAME    : bootstrap-tools.sh
#
# Install commonly used CLI tools (if not already installed)
# Idempotent Behaviour via dnf,Homebrew package managers

PIP=(termgraph vim-vint)
BREW=(git-flow-avh zplug diff-so-fancy spark rename lazygit lazydocker jesseduffield/lazynpm/lazynpm)
DNF=(ShellCheck perl-Graph-Easy zsh fish cloc bat cargo flatpak cpan starship curl httpie exa ncdu wget hunspel parallel libwebp-tools fira-code-fonts fd-find toilet figlet prettyping)
CARGO=()
# https://docs.flatpak.org/en/latest/first-build.html
# flatpak install https://flathub.org/repo/appstream/org.freeplane.App.flatpakref

# Todo
# -> better logs with colors and log level formats
# -> perhaps a dry-run feature which displays commands it will run
# -> check if Homebrew is already installed or not else install it

loop_over() {
  local CMD=$1
  shift
  # rebuild array with rest of the arguments
  local LIST=("$@")
  for ITEM in "${!LIST[@]}"; do
    echo "$CMD ${LIST[$ITEM]}"
    $CMD "${LIST[$ITEM]}"
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

from_cargo() {
  local CMD="cargo install"
  loop_over "${CMD}" "${CARGO[@]}"
}

from_dnf() {
  sudo dnf install -y "${DNF[@]}"
}

from_git() {
  # with zplug and dnf, keybinding are NOT working
  fzf --version || git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
}

from_curl() {
  nvm || curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
}

test() {
  [ -x "$HOME/.local/bin/diff-so-fancy" ] && echo Y || echo N
}

# MAIN
from_dnf
from_pip
from_brew
from_git
from_curl
from_cargo

# END
