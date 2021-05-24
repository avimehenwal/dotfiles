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

export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

BASE=$HOME/dotfiles/shell
source ${BASE}/zplug.zsh
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

# Plugin Configurations
PLUGINS=${BASE}/plugins

export ABBR_AUTOLOAD=1
export ABBR_USER_ABBREVIATIONS_FILE=${BASE}/abbreviations.sh

source ${PLUGINS}/internals.zsh
source ${PLUGINS}/myFunctions.zsh
source ${PLUGINS}/gitFzf.zsh

fpath+=${ZDOTDIR:-~}/.zsh_functions
fpath=($fpath "/home/avi/.zfunctions")

# THEME
( $(command -v starship > /dev/null )) && eval "$(starship init zsh)" || echo "starship theme NOT INSTALLED"

# Line Editor Mode
# set -o vi

# Perl - Larry Wall
PATH="/home/avi/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/avi/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/avi/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/avi/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/avi/perl5"; export PERL_MM_OPT;

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
export GNUBINS="$(find /usr/local/opt -type d -follow -name gnubin -print)";

for bindir in ${GNUBINS[@]}; do
  export PATH=$bindir:$PATH;
done;
