#  @avimehenwal - updated 2020-Dec
#        _     _                    _       _   _
#   __ _| |__ | |__  _ __ _____   _(_) __ _| |_(_) ___  _ __  ___
#  / _` | '_ \| '_ \| '__/ _ \ \ / / |/ _` | __| |/ _ \| '_ \/ __|
# | (_| | |_) | |_) | | |  __/\ V /| | (_| | |_| | (_) | | | \__ \
#  \__,_|_.__/|_.__/|_|  \___| \_/ |_|\__,_|\__|_|\___/|_| |_|___/
#
# oh-my-zsh alias in $ZSH/lib/theme-and-appearance.zsh

abbr -="cd -"
abbr _="sudo !!"
abbr 1="cd -"
abbr 2="cd -2"
abbr 3="cd -3"
abbr 4="cd -4"
abbr 5="cd -5"
abbr 6="cd -6"
abbr 7="cd -7"
abbr 8="cd -8"
abbr 9="cd -9"
abbr etc="cd /etc"
abbr sbin="cd /usr/sbin/"

# Single Character - most often used
abbr m="man"
abbr r="ranger"
abbr v="vifm"
# abbr v="nvim"
# abbr nvim="$HOME/mySoftwares/nvim.appimage"

# PROJECTS Shortcuts
abbr note="cd $HOME/REPO/avimehenwal2; git pull; code -n ."
abbr logbook="cd $HOME/GIT/logbook; git pull; code -n ."

# Nemonics
abbr open="xdg-open"
abbr alert="notify-send --urgency=normal='DONE'"
abbr logout="gnome-session-quit"
abbr listhosts="sed -rn="s/^\s*Host\s+(.*)\s*/\1/ip" ~/.ssh/config"
abbr zshrc="$EDITOR $HOME/.zshrc"
abbr json="python3 -m json.tool | pygmentize -l json"
# System Monitoring
abbr syslog="sudo tail --lines 20 --follow /var/log/syslog | ccze"
abbr venv="python3 -m venv venv; and source venv/bin/activate.fish"
# abbr fzf "fzf --preview="bat --color "always" {}""
abbr ipinfo="curl  -H "Accept: application/json" ipinfo.io/json"


# GIT Abbreviations [-g] GLOBAL Scope, all terminals
abbr -g g="git"
abbr gblame="git blame --show-stats --progress"
abbr gc="git clone --verbose --progress"
abbr gclg="git config --list --global"
abbr gcll="git config --list --local"
abbr gcm="git checkout main"
abbr gcd="git checkout develop"
abbr gcnv="git commit --no-verify"
abbr gd="git difftool --dir-diff HEAD"
abbr gdc="git diff --cached"
abbr gdcs="git diff --compact-summary"
abbr gdiff="git diff --color=always"
abbr gds="git diff --stat"
abbr gdt="git difftool --tool=meld --dir-diff master..."
abbr gfirst="git log --reverse"
abbr glast="git log -1 HEAD --compact-summary"
abbr glo="git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit"
abbr glogd="git log --walk-reflogs"
abbr glos="git log --oneline --decorate --stat"
abbr gls="git ls-tree --full-tree --name-only -r HEAD"
abbr gplog="git log --graph --pretty=format:"%h -%d %s %n" --abbrev-commit --date=relative --branches"
abbr gr="git remote --verbose"
abbr grebase="git rebase -v -i"
abbr grm="git rm --dry-run --cached"
abbr gsl="git shortlog --summary --numbered"
abbr gst="git status --show-stash"
abbr gtag="git tag -n10 --list"
abbr gtags="git ls-remote --tags"
abbr gtop="git shortlog"
abbr gundo="git reset --soft"
abbr gundoo="git reset --hard"
abbr guntrack="git rm --cache"
abbr gw="git whatchanged"
abbr gwhatadded="git log --diff-filter=A --"
abbr lo="git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit"
abbr logd="git log --walk-reflogs"
abbr los="git log --oneline --decorate --stat"
abbr gcl="git clone"
abbr ggpull="git pull --all"
abbr ggpush="git pull --all; and git push; and git push --tags"
abbr release="git push origin develop; git checkout master; git branch; git merge --strategy-option theirs develop; git pull --all; git push --force; git push --tags ; git checkout develop; git branch"
# abbr d="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
abbr gst="tig status"

# GIT FLOW
abbr gfi="git flow init && git push --set-upstream origin develop && git push"
abbr gffs="git flow feature start; git flow feature publish"
abbr gfrs="git flow release start; git flow release publish"
abbr gffp="git flow feature publish"
abbr gfrp="git flow release publish"
abbr gfff="git flow feature finish; git push --all"
abbr gfrf="git flow release finish; git push --all"


# Linux/Unix Commands with sensible switches
abbr md="mkdir --parents"
abbr rd="rmdir --verbose"
abbr rm="rm --verbose"
abbr mv="mv --verbose"
# abbr which-command="whence"
abbr tee="tee /dev/tty"
abbr pwd="pwd | tee /dev/tty | xclip -selection clip"
abbr watch="watch --color --differences --beep --interval 2"
abbr readlink="readlink --canonicalize"
abbr file="file --mime"
abbr du="du --human-readable --count-links"
abbr dd="dd status=progress conv=sparse count=1 bs=4096"
# abbr ping="prettyping"
abbr ccat="pygmentize -g"
abbr dmesg="dmesg --human --color=always"
abbr tar="tar --verbose --gzip --extract --file"
abbr ip="ip --color=always"
abbr ipa="ip --color=always -brief addr show"
abbr ipls="ip --color=always -details -stats -iec -human link show wlan0"
abbr pstree="ps -ejH"
abbr chmod="chmod --verbose"
abbr diff="diff --unified=3 --color=always"


# APT Package Manager
abbr rdepend="apt-cache rdepends"
abbr depend="apt-cache depends"
# https://unix.stackexchange.com/questions/230047/how-to-list-all-targets-in-make
#abbr targets "make -qp | awk -F":"="/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ {split($1,A,/ /);for(i in A)print A[i]}" | sort -u"


# MIRROR DIMENSION
abbr sandbox="docker run --interactive --tty --rm apline sh"
abbr ubuntu="docker run --interactive --tty ubuntu bash"
abbr py3 ="docker run -it --rm frolvlad/alpine-python3 python3"
abbr up="lxc list; and lxc start ubuntu18; lxc exec ubuntu18 -- /usr/bin/fish"
abbr down="lxc stop ubuntu18; and lxc list"
abbr test="pwd; and ls"
abbr dm="docker-machine"
# abbr mon portainer_docker

# VAGRANT
abbr vgs="vagrant global-status --prune"
abbr vs="vagrant status"
abbr vu="vagrant validate; and vagrant up --parallel; and vagrant ssh"
abbr vr="vagrant reload"
abbr vh="vagrant halt; and vagrant status"
abbr vr="vagrant reload; and vagrant status; and vagrant ssh"
