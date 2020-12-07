#!/bin/zsh

listCompletions() {
  for command completion in ${(kv)_comps:#-*(-|-,*)}
  do
    printf "%-32s %s\n" $command $completion
  done | sort
}

completionDump() {
  bat ~/.zcompdump | wc
}
