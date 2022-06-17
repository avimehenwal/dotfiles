# ENVIRONMENT VARIABLES

set --universal --export FZF_DEFAULT_OPTS "--inline-info --cycle --ansi --exit-0"
set --global --export PAGER less
set --global --export LESS '--ignore-case --RAW-CONTROL-CHARS --quit-if-one-screen --no-init --jump-target=6 --chop-long-lines --LONG-PROMPT --squeeze-blank-lines --HILITE-UNREAD ~g --status-column --tabs=4 --window=-4'
set --global --export LESSOPEN '|lesspipe.sh %s'
set --global --export LC_ALL 'en_US'
set --global --export EDITOR nvim   # CLI tools use this var like git
set --global --export ALTERNATE_EDITOR code
set --global --export LESSCOLORIZER pygmentize


# ABBREVIATIONS - that expands

abbr d 'git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
abbr m 'man'
abbr r ranger
abbr v nvim # copy paste to system clipboard doesnt work on VIM due to -xterm_clipboard
abbr tee tee /dev/tty
abbr pwd 'pwd | tee /dev/tty | xclip -selection clip'
abbr gcl 'git clone'
abbr gcm git.checkout.master
abbr gcd git checkout develop
abbr gco 'git checkout (git.branch.name)'
abbr stage 'git add (git.stage.list)'
abbr ggpull 'git pull --all'
abbr ggpush 'git pull --all; and git push; and git push --tags'
abbr refresh 'source $HOME/.config/fish/config.fish'
abbr watch 'watch --color --differences --beep --interval 2'
abbr path readlink -f
abbr file file --mime
abbr psl process.list
abbr alert notify-send --urgency=normal 'DONE'
abbr logout gnome-session-quit
abbr anki ~/mySoftwares/anki-2.1.14-linux-amd64/bin/anki
abbr listhosts "sed -rn 's/^\s*Host\s+(.*)\s*/\1/ip' ~/.ssh/config"
abbr c 'xclip -selection clip'
abbr du 'du --human-readable --count-links'
abbr cat bat
abbr pls fuck
abbr dd dd status=progress conv=sparse count=1 bs=4096
abbr gst 'tig status'
abbr open 'xdg-open'
abbr release 'git push origin develop; git checkout master; git branch; git merge --strategy-option theirs develop; git pull --all; and git push --force; and git push --tags ; git checkout develop; git branch'
abbr rc 'source ~/.config/fish/config.fish'
abbr ping prettyping
abbr fishrc 'code /home/avi/.config/fish/config.fish'
abbr dotfile code '(cd ;git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME ls | fzf --multi)'
abbr note 'cd $HOME/REPO/avimehenwal2; git pull; code -n .'
abbr logbook 'cd $HOME/GIT/logbook; git pull; code -n .'
# colourize cat output
abbr ccat 'pygmentize -g'
abbr dmesg dmesg --human --color=always
# fuzzy finding with previews
# abbr fzf "fzf --preview 'bat --color "always" {}'"
abbr diff 'diff --unified=3 --color=always'
abbr ipinfo 'curl  -H "Accept: application/json" ipinfo.io/json'
abbr termgraph 'termgraph --custom-tick "▇"'
abbr rdepend 'apt-cache rdepends'
abbr depend 'apt-cache depends'
# https://unix.stackexchange.com/questions/230047/how-to-list-all-targets-in-make
#abbr targets "make -qp | awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ {split($1,A,/ /);for(i in A)print A[i]}' | sort -u"

# GIT FLOW
abbr gfi 'git flow init; and git push --set-upstream origin develop; and git push'
abbr gffs 'git flow feature start; git flow feature publish'
abbr gfrs 'git flow release start; git flow release publish'
abbr gffp 'git flow feature publish'
abbr gfrp 'git flow release publish'
abbr gfff 'git flow feature finish; git push --all'
abbr gfrf 'git flow release finish; git push --all'


# Quick Navigation
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .... 'cd ../../../'
abbr etc 'cd /etc'
abbr sbin 'cd /usr/sbin/'
abbr json 'python3 -m json.tool | pygmentize -l json'
abbr tar 'tar --verbose --gzip --extract --file'
abbr ip 'ip --color=always'
abbr ipa 'ip --color=always -brief addr show'
abbr ipls 'ip --color=always -details -stats -iec -human link show wlan0'
abbr ll ' ls --classify --color=always --group-directories-first --block-size=K -halt $argv | less'
abbr h 'bat --language yaml --theme "Sublime Snazzy"'

# Monitoring
abbr syslog 'sudo tail --lines 20 --follow /var/log/syslog | ccze'

# MIRROR DIMENSION
abbr sandbox docker run --interactive --tty --rm apline sh
abbr ubuntu docker run --interactive --tty ubuntu bash
abbr py3  docker run -it --rm frolvlad/alpine-python3 python3
abbr up 'lxc list; and lxc start ubuntu18; lxc exec ubuntu18 -- /usr/bin/fish'
abbr down 'lxc stop ubuntu18; and lxc list'
abbr test 'pwd; and ls'
abbr dm 'docker-machine'
abbr mon portainer_docker

# VAGRANT
abbr vgs 'vagrant global-status --prune'
abbr vs 'vagrant status'
abbr vu 'vagrant validate; and vagrant up --parallel; and vagrant ssh'
abbr vr 'vagrant reload'
abbr vh 'vagrant halt; and vagrant status'
abbr vr 'vagrant reload; and vagrant status; and vagrant ssh'

# Linux Commands
abbr pstree ps -ejH
abbr venv 'python3 -m venv venv; and source venv/bin/activate.fish'
abbr chmod chmod --verbose


# FUNCTIONS


function _ls_dir --description 'list directory when we change into it'
    set --local count (ls | wc -l)
    if [ $count -gt 30 ]
        echo '...too many files to list'
    else if [ $count -gt 10 ]
        ls
    else
        ls -lrt
    end
end

# Auto actions on directory change
function __auto_PWD --on-variable PWD --description 'automatically git pull when in git directory'
    _ls_dir
end


# FISH SHELL MODIFICATIONS


set -U fish_greeting (date)


# BOOTSTRAP - PACKAGE MANAGER

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

function reset_radio --description 'reset radio'
    nmcli radio wifi
    nmcli radio wifi off
    nmcli radio wifi
    nmcli radio wifi on
    nmcli radio wifi
end

function portainer_docker --description 'UI to manage docker container, images, services and stacks'
    docker volume create portainer_data
    docker run -d -p 8000:8000 -p 9010:9010 --name=portainer --restart=always \
        -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data \
        portainer/portainer
    xdg-open http://localhost:9010
end
# SOURCE FUNCTIONS


# Load fishmarks (http://github.com/techwizrd/fishmarks)
. $HOME/.fishmarks/marks.fish
. $HOME/.config/fish/functions/apt.fish
. $HOME/.config/fish/functions/cd.fish
. $HOME/.config/fish/functions/getent.fish
. $HOME/.config/fish/functions/git.fish
. $HOME/.config/fish/functions/l.fish
. $HOME/.config/fish/functions/tmux.fish

# Maps CAPS as ESCape
# setxkbmap -option caps:escape

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell"
    source "$BASE16_SHELL/profile_helper.fish"
end

set --global --export JAVA_HOME (update-alternatives --query javac | sed -n -e 's/Best: *\(.*\)\/bin\/javac/\1/p')
export ANDROID_HOME="/usr/local/android/sdk"
set --global --export PATH $HOME/.local/bin $HOME/.cargo/bin /snap/bin $HOME/.yarn/bin $PATH $ANDROID_HOME/tools/bin /home/linuxbrew/.linuxbrew/bin $HOME/.gem/bin


# Add poerline fonts to fish shell
# https://gist.github.com/TrentSPalmer/63a85b582d42ab4bff665fc2dbba42e2
# set fish_function_path $fish_function_path "/usr/share/powerline/bindings/fish"
# source /usr/share/powerline/bindings/fish/powerline-setup.fish
# powerline-setup

source ~/.bash_aliases

# How to add and use powerline-fonts with omf agnoster theme?
# https://powerline.readthedocs.io/en/latest/installation/linux.html#fonts-installation
source /home/avi/.local/lib/python3.8/site-packages/powerline/bindings/fish/powerline-setup.fish
# set-option -g default-terminal "screen-256color"
# sudo apt list --installed | grep powerline



# END
#sudo mount -t nfs nas.pb.avantys.de:/mnt/nas/data /nas/data/
