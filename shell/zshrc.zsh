#  @avimehenwal - updated 2020-Dec
#
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|
#
# zsh shell run command configuration

export ZPLUG_HOME=/home/linuxbrew/.linuxbrew/opt/zplug
source $ZPLUG_HOME/init.zsh

BASE=$HOME/dotfiles/shell
source $BASE/zplug.zsh
source ${BASE}/alias.sh
source ${BASE}/keybindings.sh
source ${BASE}/path.sh
source ${BASE}/env.sh
source ${BASE}/shared.sh

# History - reverse-search
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# MyPlugins
source ${BASE}/plugins/projectManagement.zsh
source ${BASE}/plugins/internals.zsh

# Plugin Configurations
export ABBR_AUTOLOAD=1
export ABBR_USER_ABBREVIATIONS_FILE=${BASE}/abbreviations.sh

# Homebrew completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  autoload -Uz compinit
  compinit
fi

fpath+=${ZDOTDIR:-~}/.zsh_functions
fpath=($fpath "/home/avi/.zfunctions")

# THEME
eval "$(starship init zsh)"

# load fish like abbreviations
# abbr && clear
# screenfetch
