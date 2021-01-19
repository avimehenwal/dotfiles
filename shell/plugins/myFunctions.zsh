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
