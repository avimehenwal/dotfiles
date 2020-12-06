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

function d() {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -10
  fi
}
compdef _dirs d

# List directory contents
alias ll='ls -halt'
alias la='ls -lAh'
alias md='mkdir -p'
alias rd=rmdir
alias refresh="source $HOME/.zshrc"

# Projects
treeCmd() {
  git fetch --all --quiet
  # tree --du --si --sort=size -C -d -L 1 -i $LOC
  tree --du --sort=size --noreport -i -d -L 1 |
    sed 1d |
    sed s/]// |
    awk '{print $3"\t"$2}' |
    termgraph --title "${PWD}" --color red
}
alias b2c='cd ~/WORK/b2c && treeCmd'
alias dotfile='cd ~/dotfiles && treeCmd'

# Suffix aliases
alias -s md='bat -l md'
alias -s json='bat -l json'

# Commands - frequently used
alias c='${COPY_PRG}'
alias p='wl-paste'
alias l='less --RAW-CONTROL-CHARS'

# Commands - common
alias zshrc='$EDITOR $HOME/.zshrc'
alias bashrc='$EDITOR $HOME/.bashrc'

# Conditional alias
prettyping --help >/dev/null && alias pping='prettyping'

# open terminal failed: missing or unsuitable terminal: xterm-256color
alias tmux='export TERM=xterm && tmux'
alias vifm='export TERM=xterm-256color && vifm'
alias rsync='rsync --progress --verbose'
alias tmux='byobu-tmux'
alias psa='ps aux | fzf'

# FZF inspired
# Package Manager
alias brewl='brew list | fzf --preview-window=right:65% --preview="brew info {} | bat --color=always --highlight-line 2 -l gitlog"'
