#!/bin/env zsh

# control directories to be searched with rg
# search only the source
# RULE1: do not search inside docs when in dotfiles,

function directory_based_alias_rules () {
  echo "inside chpwd"

  if [[ $(basename $PWD) == "dotfiles" ]]; then
    alias rg='rg -g "!docs" --pretty'

  # elif [ "" = clean ]; then
  #   echo "some condition"

  else
    # unalias rg
    alias rg='rg --pretty'
  fi
}

function list-dir-on-cd () {
  ls -a;
}

chpwd_functions+=(directory_based_alias_rules list-dir-on-cd)
echo "ZSH-PLUGIN:: Direcrory specific alias"