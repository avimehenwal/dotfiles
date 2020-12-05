# set PATH environment variable

# Homebrew package manager
BREW=/home/linuxbrew/.linuxbrew/bin

YARN=$HOME/.yarn/bin
CARGO=$HOME/.cargo/bin
RVM=$HOME/.rvm/bin
MY=$HOME/dotfiles/scripts/bin

export PATH="$PATH:${BREW}:${YARN}:${CARGO}:${RVM}:${MY}"
