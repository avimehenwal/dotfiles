# brew install zplug
export ZPLUG_HOME=/home/linuxbrew/.linuxbrew/opt/zplug
source $ZPLUG_HOME/init.zsh
source $HOME/dotfiles/zsh/plugins.zsh

plugins=(zsh-autosuggestions zsh-syntax-highlighting zsh-abbr)

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Use FZF keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Source all files from submodule
# source <(cat $HOME/REPO/aviscripts/*)

# generate aliases and source them
# $HOME/REPO/aviscripts/convert_fish_abbr_2_bash_alias.sh
# source $HOME/.bash_aliases
source $HOME/dotfiles/zsh/alias.zsh
source $HOME/dotfiles/zsh/keybindings.sh
source $HOME/dotfiles/zsh/path.sh

# ENVIRONMENT VARIABLES

# default programs
export EDITOR=vim
export BROWSER=brave-browser

# else vifm coloscheme fails, BUT tmux needs TERM=xterm else wont start
# debug term colors command
# echo $TERM
# tput colors
# infocmp -x
# export TERM=xterm
export TERM=xterm-256color

# Load fish like auto expanding abbreviation
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
abbr && clear
screenfetch
