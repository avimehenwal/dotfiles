#  @avimehenwal - updated 2020-Dec
#
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|
#
# zsh shell run command configuration

# export ZPLUG_HOME=/home/linuxbrew/.linuxbrew/opt/zplug
# source $ZPLUG_HOME/init.zsh
# export ZPLUG_HOME=/opt/homebrew/opt/zplug

export ZPLUG_HOME=$HOME/.zplug
[ -d $HOME/.zplug ] || curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
source $ZPLUG_HOME/init.zsh

BASE=$HOME/dotfiles/shell
source ${BASE}/zplug.zsh
source ${BASE}/alias.sh
source ${BASE}/keybindings.sh
source ${BASE}/path.sh
source ${BASE}/env.sh
source ${BASE}/shared.sh
# Condtitional loading of zsh settings per platform
if command apt > /dev/null; then
    source ${BASE}/debian.zsh
elif command systemctl > /dev/null; then
    source ${BASE}/systemd.zsh
elif command freebsd-version > /dev/null; then
    source $ZSH_CUSTOM/os/freebsd.zsh
elif [[ `uname` == "Darwin" ]]; then
    source ${BASE}/macos.zsh
elif command kubectl > /dev/null; then
    source $ZSH_CUSTOM/os/kubernetes.zsh
else
    echo 'Unknown OS!'
fi


# History - reverse-search
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Plugin Configurations
PLUGINS=${BASE}/plugins

export ABBR_AUTOLOAD=1
export ABBR_USER_ABBREVIATIONS_FILE=${BASE}/abbreviations.sh

source ${PLUGINS}/internals.zsh
source ${PLUGINS}/myFunctions.zsh
source ${PLUGINS}/gitFzf.zsh

fpath+=${ZDOTDIR:-~}/.zsh_functions

# THEME
( $(command -v starship > /dev/null )) || sh -c "$(curl -fsSL https://starship.rs/install.sh)"
eval "$(starship init zsh)"

# Line Editor Mode
# set -o vi

# Perl - Larry Wall
PATH="/home/avi/perl5/bin${PATH:+:${PATH}}"
export PATH
PERL5LIB="/home/avi/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL5LIB
PERL_LOCAL_LIB_ROOT="/home/avi/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_LOCAL_LIB_ROOT
PERL_MB_OPT="--install_base \"/home/avi/perl5\""
export PERL_MB_OPT
PERL_MM_OPT="INSTALL_BASE=/home/avi/perl5"
export PERL_MM_OPT

excludeFromTmux() {
}

[ -z "${TMUX}" ] && excludeFromTmux

# load fish like abbreviations
# abbr && clear
# screenfetch

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# STARTUP Programs
# start KDE Konsole with byobu-tmux if len(KONSOLE_VERSION) is NOT zero
[ -z "$KONSOLE_VERSION" ] || byobu-tmux

# ls on everytime cd is used to change directory
# autoload -U run-ls-on-cd
# run-ls-on-cd -Uz chpwd () {
#   ls -a;
#   echo "PWD = $PWD"
# }

# Get list of gnubin directories
# export GNUBINS="$(find /usr/local/opt -type d -follow -name gnubin -print)";
# for bindir in ${GNUBINS[@]}; do
#   export PATH=$bindir:$PATH;
# done;

# NVM automatically use the right node version
# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Issues
# https://stackoverflow.com/questions/13762280/zsh-compinit-insecure-directories

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/avi/mySoftwares/google-cloud-sdk-360.0.0-linux-x86_64/google-cloud-sdk/path.zsh.inc' ]; then . '/home/avi/mySoftwares/google-cloud-sdk-360.0.0-linux-x86_64/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/avi/mySoftwares/google-cloud-sdk-360.0.0-linux-x86_64/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/avi/mySoftwares/google-cloud-sdk-360.0.0-linux-x86_64/google-cloud-sdk/completion.zsh.inc'; fi
