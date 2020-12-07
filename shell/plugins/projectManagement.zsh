#!/bin/zsh
#  ____            _   __  __                 _
# |  _ \ _ __ ___ (_) |  \/  | __ _ _ __ ___ | |_
# | |_) | '__/ _ \| | | |\/| |/ _` | '_ ` _ \| __|
# |  __/| | | (_) | | | |  | | (_| | | | | | | |_
# |_|   |_|  \___// | |_|  |_|\__, |_| |_| |_|\__|
#               |__/          |___/
#
# AUTHOR      : avimehenwal
# DATE        : 06-Dec-2020
# PURPOSE     : ZSH Plugin
# FILENAME    : projectManagement.zsh
#
# interactive sane options when switching b/w project
# things which you often do

# --preview='echo -e "size={5} number-of-hard-links={2}\nowner={3} group={4}]\n{1} user,group,others Permissions"; bat --color=always {-1}'\

MyProjects=(dotfiles b2c plangs fan-gallery avimehenwal2 avimehenwal.in)

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

# Projects
treeGraph() {
  git fetch --all --quiet
  # tree --du --si --sort=size -C -d -L 1 -i $LOC
  tree --du --sort=size --noreport -i -d -L 1 |
    sed 1d |
    sed s/]// |
    awk '{print $3"\t"$2}' |
    termgraph --title "${PWD}" --color red
}

pp() {
  # http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#index-colors
  autoload -U colors
  colors
  # echo $bold_color$bg[red]bold red${reset_color} plain
  # echo $bold_color$fg[white]$bg[black]bold red${reset_color} plain
  # echo $bold_color$fg[black]$bg[green]bold red${reset_color} plain
  # echo $bold_color$fg[black]$bg[blue]bold red${reset_color} plain
  # echo $bold_color$fg[black]$bg[magenta]bold red${reset_color} plain
  # echo $bold_color$fg[black]$bg[cyan]bold red${reset_color} plain
  # echo $bold_color$fg[black]$bg[white]bold red${reset_color} plain

  local result=""
  echo 📌 $bold_color$fg[black]$bg[yellow] MyProjects ${reset_color} ${MyProjects}
  for PROJ in ${MyProjects[@]}; do
    local loc=$(find ~ -maxdepth 2 -type d -name ${PROJ} -print)
    result+="$bold_color$fg[green]${PROJ}${reset_color} ${loc}\n"
  done
  selection=$(echo -e ${result} |
    column --table --table-columns Name,Path |
    fzf --header-lines=1 \
    --height=70% \
    --preview 'tree -C -L 1 {-1} --sort=mtime -r')
  cd $(echo $selection | awk '{print $2}') && treeGraph
}

generateProjectAlias() {
  for PROJ in ${MyProjects[@]}; do
    local loc=$(find ~ -maxdepth 2 -type d -name ${PROJ} -print)
    local value="cd ${loc} && treeGraph"
    alias $PROJ="${value}"
    # echo "alias $PROJ='$value'"
  done
}

# regex match doesnt work on zsh
# [[ $line =~ ^- ]] && echo file
# [[ $line =~ ^d ]] && echo directory

# END
