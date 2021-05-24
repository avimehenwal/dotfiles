#dd/!/bin/zsh
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

PM_DATA_FILE=$HOME/dotfiles/shell/plugins/project-management/projectNames.data


# list Project Files for editing
function pf() {
  local RG='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git}"'
  $EDITOR $(
    eval ${RG} | fzf \
      --multi \
      --bind ctrl-a:select-all \
      --preview-window=right:65% \
      --preview='stat {-1}; bat --color=always {-1}' \
      --prompt='list ProjectFiles>>'
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
  # autoload -U colors
  # colors
  # echo $bold_color$bg[red]bold red${reset_color} plain
  # echo $bold_color$fg[white]$bg[black]bold red${reset_color} plain
  # echo $bold_color$fg[black]$bg[green]bold red${reset_color} plain
  # echo $bold_color$fg[black]$bg[blue]bold red${reset_color} plain
  # echo $bold_color$fg[black]$bg[magenta]bold red${reset_color} plain
  # echo $bold_color$fg[black]$bg[cyan]bold red${reset_color} plain
  # echo $bold_color$fg[black]$bg[white]bold red${reset_color} plain

  local result=""
  echo 📌 $bold_color$fg[black]$bg[yellow] MyProjects ${reset_color} ${MyProjects}
  while IFS= read -r PROJ; do
    loc=$(find $HOME -not \( -path $HOME/.Trash -prune \) -maxdepth 2 -type d -name ${PROJ})
    result+="$bold_color$fg[green]${PROJ}${reset_color} ${loc}\n"
  done < $PM_DATA_FILE
  selection=$(echo -e ${result} |
    column -t -c Name,Path |
    fzf --header-lines=0 \
      --height=50% \
      --prompt='select Project >' \
      --preview 'tree -C -L 1 {-1} --sort=mtime -r')
  cd $(echo $selection | awk '{print $2}') && treeGraph
}

generateProjectAlias() {
  # Internal FIeld Seperator
  while IFS= read -r PROJ; do
    local loc=$(find ${HOME} -maxdepth 2 -type d -name ${PROJ} -print)
    local value="cd ${loc} && lf"
    alias $PROJ="${value}"
    # echo "alias $PROJ='$value'"
  done < $PM_DATA_FILE
}

# Add Project
project_add () {
  local project=$1
  echo ${project} >> ${PM_DATA_FILE} && echo $bold_color$bg[green]$fg[black] $project ${reset_color} Added to $PM_DATA_FILE
}
# check if already exists
pa() {
  local project=$(basename $PWD)
  grep -q ^${project} ${PM_DATA_FILE} && echo "$bold_color$bg[yellow]$fg[black] ${project} ${reset_color} Already exists in list 🏃" || project_add ${project}
  bat $PM_DATA_FILE
}

# regex match doesnt work on zsh
# [[ $line =~ ^- ]] && echo file
# [[ $line =~ ^d ]] && echo directory

# only for NPM projects
run() {
  clear
  DELIMITER='#' # want to retain colons in script names, its pretty standard
  if [ -f ./package.json ]; then
    echo 🏃 $bold_color$bg[green]$fg[black] NPM RUN ${reset_color} project scripts 🏃 
    npm run $(
    jq ".scripts" < ./package.json |
      sed -e "s/\": \"/$DELIMITER/g" |
      sed -e '1d;$d' -e 's/"//g' -e 's/,//g' |
        column --table -s "$DELIMITER" --table-right 1 |
        bat -l bash --style=plain |
        fzf --no-multi --cycle --height=50% --margin=15% --padding=1% --info=inline \
          --prompt='npm run ' --ansi
      # --preview='bat -l sh {}'
    )
  else
    echo $bold_color$bg[red]$fg[black] package.json ${reset_color} File not found in CWD
  fi

}

# END
