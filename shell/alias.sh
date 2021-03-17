#!/usr/bin/env bash 
#  @avimehenwal - updated 2020-Dec
#
#    / \  | (_) __ _ ___  ___  ___
#   / _ \ | | |/ _` / __|/ _ \/ __|
#  / ___ \| | | (_| \__ \  __/\__ \
# /_/   \_\_|_|\__,_|___/\___||___/
#
# Types of aliases
#
# 1. Simple Aliases
# 2. Suffix Aliases
# 3. Functions for Aliases With Parameters
# 4. Global Aliases
# 5. Operating system specific aliases
#
# A global alias is aggressive. Once registered, it replaces all
# occurrences of the alias name with the specified command.
# https://thorsten-hans.com/5-types-of-zsh-aliases

# Changing/making/removing directory
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias -g ..='cd ..'
alias -g ...='cd ../..'
alias -g ....='cd ../../..'
alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'

# Import autogenerated Aliases from Plugins
# generateProjectAlias

function d() {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -10
  fi
}
compdef _dirs d

# List directory contents
alias la='ls --color=always -lAh | fzf'

alias md='mkdir -p'
alias rd=rmdir
alias refresh="exec zsh"

# Suffix aliases
alias -s md='bat -l md'
alias -s json='bat -l json'

# Commands - frequently used
alias c='${COPY_PRG}'
alias l='less --RAW-CONTROL-CHARS --quit-if-one-screen --no-init'
alias p='wl-paste'
alias nv='$EDITOR'
alias lt='exa --long --classify --group-directories-first --links --header --tree --level=1'
alias fd='fd --color always'
alias cp='cp --verbose --interactive'

# Commands - common
alias zshrc='$EDITOR $HOME/.zshrc'
alias bashrc='$EDITOR $HOME/.bashrc'
alias sysinfo='clear && screenfetch'

# Conditional alias
prettyping --help >/dev/null && alias pping='prettyping'

# open terminal failed: missing or unsuitable terminal: xterm-256color
alias rg='rg --pretty'
alias tmux='export TERM=xterm && tmux'
alias vifm='export TERM=xterm-256color && vifm'
alias bat='bat --color=always'
alias env='env | bat --language=bash | fzf'
# todo fzf unset from list of env vars
alias rsync='rsync --progress --verbose'
# might want to use normal tmux commands
# alias tmux='byobu-tmux'
alias psa='ps aux | fzf'
alias bindkey='bindkey | sed s/\"//g | column --table | bat --style=grid,numbers'

# ZSH Specific
alias fpath='print -l $fpath'

# System Management
alias publicip='curl ifconfig.me'

# FZF inspired
# Package Manager
alias brewl='brew list | fzf --preview-window=right:65% --preview="brew info {} | bat --color=always --highlight-line 2 -l gitlog"'
alias brews='brew install $(brew search | fzf --preview-window=right:65% --preview="brew info {} | bat --color=always
--highlight-line 2 -l gitlog")'

# Git
alias gcl='git clone --progress --verbose'
alias gca='git commit --amend'

