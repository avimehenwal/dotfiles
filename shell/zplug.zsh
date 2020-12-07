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
# zplug "~/.zsh", from:local

# THEME
# zplug 'dracula/zsh', as:theme
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

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
