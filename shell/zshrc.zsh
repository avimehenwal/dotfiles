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
export ABBR_AUTOLOAD=1
export ABBR_USER_ABBREVIATIONS_FILE=${BASE}/abbreviations.sh

PLUGINS=${BASE}/plugins
source ${PLUGINS}/internals.zsh
source ${PLUGINS}/myFunctions.zsh
source ${PLUGINS}/gitFzf.zsh
source ${PLUGINS}/projectManagement.zsh
generateProjectAlias

fpath+=${ZDOTDIR:-~}/.zsh_functions
fpath=($fpath "/home/avi/.zfunctions")

# THEME
eval "$(starship init zsh)"

# Line Editor Mode
set -o vi

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
