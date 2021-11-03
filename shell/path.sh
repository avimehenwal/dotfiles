# set PATH environment variable

# Binaries
LBIN=$HOME/.local/bin

# Homebrew package manager
BREW=/home/linuxbrew/.linuxbrew/bin

YARN=$HOME/.yarn/bin
CARGO=$HOME/.cargo/bin
RVM=$HOME/.rvm/bin
MY=$HOME/dotfiles/scripts/bin
FLUTTER=$HOME/mySoftwares/flutter/bin
ANDROID=/home/avi/Android/Sdk/tools/bin
DART_PUB=$HOME/.pub-cache/bin

export PATH="$PATH:${LBIN}:${BREW}:${YARN}:${CARGO}:${RVM}:${MY}:${FLUTTER}:${ANDROID}:${DART_PUB}"
