#  @avimehenwal - updated 2020-Dec
#
#_____ __ | |_   _  __ _
# |_  / '_ \| | | | |/ _` |
#  / /| |_) | | |_| | (_| |
# /___| .__/|_|\__,_|\__, |
#     |_|            |___/
#
# concurrent execution
# self update and manage

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# FISH like auto-expanding abbreviations, suggestions
zplug "olets/zsh-abbr", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
# zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zdharma/fast-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "stedolan/jq", from:gh-r, as:command
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:"fzf", frozen:1
zplug "junegunn/fzf", as:command, hook-build:"./install --bin", use:"bin/{fzf-tmux,fzf}"
# zplug "b4b4r07/enhancd", use:init.sh
# zplug "sharkdp/bat", as:command, defer:2
# zplug "BurntSushi/ripgrep", as:command, defer:2


# Completions
zplug "cheat/cheat", use:"scripts/cheat.zsh"

# git + fzf = magic
zplug "wfxr/forgit"
zplug "wfxr/emoji-cli"

# Group dependencies
# Load "emoji-cli" if "jq" is installed in this example
zplug "stedolan/jq", \
  from:gh-r, \
  as:command, \
  rename-to:jq \
  use:"*linux64"
# zplug "b4b4r07/emoji-cli", \
#   on:"stedolan/jq"

zplug "jhawthorn/fzy", \
  as:command, \
  rename-to:fzy, \
  hook-build:"make && sudo make install"

# Set the priority when loading
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# LOCAL PLUGINS
# zplug "avimehenwal/zsh-bookmarks"
zplug "~/GITHUB/zsh-bookmarks", from:local, as:plugin
# zplug "~/GITHUB/zsh-bookmarks", from:local, as:plugin, lazy:true
zplug "~/dotfiles/shell/plugins/directory-specific-alias", from:local, as:plugin


# THEME
# zplug 'dracula/zsh', as:theme
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
# zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme
# zplug "themes/agnoster", from:oh-my-zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo
    zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# FZF CTRL-R and CTRL-T keybindings
source $ZPLUG_REPOS/junegunn/fzf/shell/key-bindings.zsh
source $ZPLUG_REPOS/junegunn/fzf/shell/completion.zsh
