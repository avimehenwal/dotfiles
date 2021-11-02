#!/usr/bin/env zsh

# GIT Plugin
# Git CheckOut Remote
gcor () {
  echo "git checkout --track <remote/branch-name>"
  git checkout --track $(git branch --all | sed 's/remotes\///' |
    fzf --preview='git diff --stat --patch master...{-1}')
}
# Git CheckOut Local Branch
gcob() {
  echo "git checkout <local-branhc>"
  git checkout $(git branch |
    fzf --preview='git diff --stat --patch master...{-1}')
}

# /Users/avimehenwal/dotfiles/shell/plugins/gitFzf.zsh:18: defining function based on alias `gco'
# use fzf finder to checkout git branches
gco() {
  git checkout $(git branch |
    fzf \
      --cycle \
      --no-multi \
      --margin=1% \
      --padding=1% \
      --height=80% \
      --border=rounded \
      --prompt="git checkout " \
      --preview='git show-branch'
  )
}
