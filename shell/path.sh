# set PATH environment variable

# Binaries
LBIN=$HOME/.local/bin

# Homebrew package manager
# BREW=/home/linuxbrew/.linuxbrew/bin

YARN=$HOME/.yarn/bin
CARGO=$HOME/.cargo/bin
RVM=$HOME/.rvm/bin
MY=$HOME/dotfiles/scripts/bin

# on macbook, add python3 packages
PYPACK=$HOME/Library/Python/3.9/bin

export PATH="$PATH:${LBIN}:${BREW}:${YARN}:${CARGO}:${RVM}:${MY}:${PYPACK}"
