#!/bin/bash
#
# AUTHOR      : avimehenwal
# DATE        : 05-Dec-2020
# PURPOSE     : Shared
# FILENAME    : shared.sh
#
# Shared Sources, plugins, keybindings, env, paths
# for zsh and bash.
# fish is not POSIX compliant

# FZF keybindings for zsh, bash
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion


# END
