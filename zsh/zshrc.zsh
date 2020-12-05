#  @avimehenwal - updated 2020-Dec
#
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|

export ZPLUG_HOME=/home/linuxbrew/.linuxbrew/opt/zplug
source $ZPLUG_HOME/init.zsh

source $HOME/dotfiles/zsh/zplug.zsh
source $HOME/dotfiles/zsh/alias.sh
source $HOME/dotfiles/zsh/keybindings.sh
source $HOME/dotfiles/zsh/path.sh
source $HOME/dotfiles/zsh/env.sh
source $HOME/dotfiles/zsh/shared.sh

# Load fish like auto expanding abbreviation
export ABBR_AUTOLOAD=1
export ABBR_USER_ABBREVIATIONS_FILE=$HOME/dotfiles/zsh/abbreviations

# Homebrew completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Use NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

fpath+=${ZDOTDIR:-~}/.zsh_functions

fpath=($fpath "/home/avi/.zfunctions")

# Set Spaceship ZSH as a prompt
autoload -U promptinit
promptinit
prompt spaceship

# load fish like abbreviations
# abbr && clear
# screenfetch
