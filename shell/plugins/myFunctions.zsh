#  @avimehenwal - dec 2020
#   __                  _   _
#  / _|_   _ _ __   ___| |_(_) ___  _ __  ___
# | |_| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
# |  _| |_| | | | | (__| |_| | (_) | | | \__ \
# |_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
#
# In bash, functions are preferred over aliases almost everywhere

# Compiler Wrapper Functions
node() {
  if [[ $@ == "--help" ]]; then
    command node --help | bat -l man
  else
    command node "$@"
  fi
}
# improve using switch case
# https://superuser.com/questions/105375/bash-spaces-in-alias-name
#

# print ls after each cd
# cd:1: maximum nested function level reached; increase FUNCNEST?
# function cd() {
#   command cd $1
#   command ls -l
# }

# Todo: display bat->file and tree->dir preview
function lavi() {
  local head="{1} User,Group,Others Permission \#hard-links={2}"
  local lsFZF="fzf \
--multi \
--header-lines=1 \
--bind ctrl-a:select-all \
--preview-window=right:50% \
--preview='echo ${head}; bat --color=always {-1}'\
"
  local lsCMD="ls -halt"
  # maybe because of eval newlines in echo are not reported
  eval ${lsCMD} | eval ${lsFZF}
}
# unfunction ll; unalias ll;source projectManagement.zsh; ll


function gcm () {
  git show-ref --verify --quiet refs/heads/master && git checkout master || git checkout main
}
