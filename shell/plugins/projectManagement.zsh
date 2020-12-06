#!/bin/zsh
#
# AUTHOR      : avimehenwal
# DATE        : 06-Dec-2020
# PURPOSE     : ZSH Plugin
# FILENAME    : projectManagement.zsh
#
# interactive sane options when switching b/w project
# things which you often do

# --preview='echo -e "size={5} number-of-hard-links={2}\nowner={3} group={4}]\n{1} user,group,others Permissions"; bat --color=always {-1}'\

# Todo: display bat->file and tree->dir preview
function ll() {
  local head="{1} user,group,others Permission \#hard-links={2}"
  local lsFZF="fzf \
--multi \
--header-lines=1 \
--bind ctrl-a:select-all \
--preview-window=right:50% \
--preview='echo $head; bat --color=always {-1}'\
"
  locallsCMD="ls \
--color=always \
--classify \
--group-directories-first \
--block-size=K \
-halt\
"
  # maybe because of eval newlines in echo are not reported
  eval ${lsCMD} | eval ${lsFZF}
}
# unfunction ll; unalias ll;source projectManagement.zsh; ll

# list files in project for editing
function lf() {
  local RG='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git}"'
  $EDITOR $(
    eval ${RG} | fzf \
      --multi \
      --bind ctrl-a:select-all \
      --preview-window=right:65% \
      --preview='stat {-1}; bat --color=always {-1}'
  )
}

# regex match doesnt work on zsh
# [[ $line =~ ^- ]] && echo file
# [[ $line =~ ^d ]] && echo directory

# END
