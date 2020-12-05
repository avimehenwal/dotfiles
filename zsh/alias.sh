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

# Simple aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
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
alias -s {sh,bash,fish,zsh}='bat -l bash'

# Commands - frequently used
alias c='${COPY_PRG}'
alias p='wl-paste'
alias l='less --RAW-CONTROL-CHARS'

# Commands - common
alias zshrc='$EDITOR $HOME/.zshrc'
alias bashrc='$EDITOR $HOME/.bashrc'

# open terminal failed: missing or unsuitable terminal: xterm-256color
alias tmux='export TERM=xterm && tmux'
alias vifm='export TERM=xterm-256color && vifm'
alias rsync='rsync --progress --verbose'
alias tmux='byobu-tmux'
alias psa='ps aux | fzf'
