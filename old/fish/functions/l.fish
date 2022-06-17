function sys.users --description 'list all user on machine'
    cut -d: -f1 /etc/passwd
    cut -d: -f1 /etc/passwd | wc
end

function test.ansible --description 'Run sample commands to test ansible installation'
    ansible --version
    ansible localhost --module-name ping
    ansible localhost --args "/bin/echo Hello Avi!"
end

function process.list --description 'select process from list and then display it'
    ps -ely | fzf | awk '{print$3}' | xclip -sel clip
    ps (xclip -sel clip -o) | less
end

function sys.info -d 'get system information'
    echo "hwinfo --short"
    echo "lshw , lscpu , lsusb"
    echo "udevadm info --query=all /dev/ttyUSB0"
    echo "SMBIOS data from sysfs Desktop Management Interface"
    echo "sudo dmidecode --type 17"
end

function terminal.colors --description 'shell text colors test'
    echo -e "\t\033[0mNo color"
    echo -e "\t\033[1;37mWHITE\t\033[0;30mBLACK"
    echo -e "\t\033[0;34mBLUE\t\033[1;34mLIGHT_BLUE"
    echo -e "\t\033[0;32mGREEN\t\033[1;32mLIGHT_GREEN"
    echo -e "\t\033[0;36mCYAN\t\033[1;36mLIGHT_CYAN"
    echo -e "\t\033[0;31mRED\t\033[1;31mLIGHT_RED"
    echo -e "\t\033[0;35mPURPLE\t\033[1;35mLIGHT_PURPLE"
    echo -e "\t\033[0;33mYELLOW\t\033[1;33mLIGHT_YELLOW"
    echo -e "\t\033[1;30mGRAY\t\033[0;37mLIGHT_GRAY"
    echo -e "\t\e[5mBlinkBlinking text"
end

function install.tools --description 'install tools which were not installed by ansible provisioning'
    # *Use idempotent CI tool for this
    echo -e "INFO:: Installing bat\n"
    wget --continue https://github.com/sharkdp/bat/releases/download/v0.11.0/bat-musl_0.11.0_amd64.deb --directory-prefix=$HOME/mySoftwares
    sudo dpkg -i $HOME/mySoftwares/bat-musl_0.11.0_amd64.deb

    echo -e "INFO:: Installing oh-my-fish\n"
    curl -L https://get.oh-my.fish | fish

    echo -e "INFO:: Installing Fish-Marks\n"
    curl -L https://github.com/techwizrd/fishmarks/raw/master/install.fish | fish

    echo -e "INFO:: Installing base-16 colorschemes"
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

    echo -e "INFO:: Installing ack"
    sudo apt install -y ack-grep
    sudo pip3 install termgraphf

    sudo apt install -y fonts-powerline
    pip3 install git+git://github.com/powerline/powerline

    echo -e "INFO:: Install copyq clipboard manager"
    sudo apt install -y copyq copyq-doc copyq-plugins
    sudo wget --output-document=/home/avi/.local/bin/prettyping \
        https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping
    sudo chmod ugo+x /home/avi/.local/bin/prettyping
    # omf install bobthefish
end

function install.vagrant --description 'older versions have issues'
    cd $HOME/mySoftwares/
    wget --continue https://releases.hashicorp.com/vagrant/2.2.4/vagrant_2.2.4_x86_64.deb --directory-prefix=$HOME/mySoftwares
    sudo dpkg --install $HOME/mySoftwares/vagrant_2.2.4_x86_64.deb
    sudo apt install -y packer
    vagrant plugin install vagrant-fsnotify
    vagrant plugin install vagrant-vbguest
    vagrant plugin install vagrant-scp
    vagrant plugin install vagrant-hostsupdater
end

function pkg --argument name --description 'Search package name both on snap and apt package managers'
    # Todo:: pass the output through a pager
    echo -e "\033[1;34mSNAP find results\e[0m"
    snap find $name
    echo -e "\t\033[1;35mAPT search results\e[0m"
    apt search $name
end

function isLoginShell -d 'is shell the Login shell'
# echo $0
# When Bash is invoked as a Login shell;
# →Login process calls /etc/profile
# →/etc/profile calls the scripts in /etc/profile.d/
# →Login process calls ~/.bash_profile
# →~/.bash_profile calls ~/.bashrc
# →~/.bashrc calls /etc/bashrc

# When bash is invoked as a Non login shell;
# →Non-login process(shell) calls ~/.bashrc
# →~/.bashrc calls /etc/bashrc
# →/etc/bashrc calls the scripts in /etc/profile.d/

    if test -n "$0" # -n STRING returns true if the length of STRING is non-zero.
        echo -e "TRUE is a Login shell : $0"
    else
        echo -e "FALSE is NOT a Login Shell : $0"
    end

    if set -q 0
        echo -e "Maybe a login shell"
    else
        echo -e "Variable 0 is not set"
    end
end

function draw_uml --argument DNAME -d 'draws the UML diagrams'
    # sudo apt install -y graphviz
    # sudo apt install -y pylint
    # sudo apt install xdot
    # -o output format .dot .png
    # https://pythonhosted.org/theape/documentation/developer/explorations/explore_graphs/explore_pyreverse.html#file-formats-notes
    # http://www.webgraphviz.com/
    # pyreverse -ASmy -k -o png pyreverse/main.py -p Main
    # pyreverse -c PyreverseCommand -a1 -s1 -f ALL -o png  pyreverse/main.py
    echo "--project=$DNAME"
    pyreverse --project=$DNAME $DNAME
    xdot classes_$DNAME.dot &
    xdot packages_$DNAME.dot &
end

function resetwlan -d 'reset wlan interface'
    sudo ip --color link show wlan0
    sudo ip --color link set wlan0 down
    sleep 2
    sudo ip --color link show wlan0
    sudo ip --color link set wlan0 up
    sleep 5
    sudo ip --color link show wlan0
end

function jup -d 'run jupyter lab environment'
    # sudo apt update
    # sudo apt install nodejs
    # sudo apt install npm

    # pip install robotkernel
    # jupyter labextension install jupyterlab_robotmode
    # jupyter labextension install @jupyter-widgets/jupyterlab-manager
    jupyter lab

end

function dug -d 'Print graph with for du output'
    echo -e "du --max-depth=1 --bytes --all | awk '{print $2"\t"$1}' | termgraph"
    du --max-depth=1 --bytes --all \
        | awk '{print $2"\t"$1}' \
        | termgraph
end

function fisher_bootstrap -d 'fisher modules'
    # fisher add matchai/spacefish
    # fisher add fishpkg/fish-prompt-metro
    # fisher add fishpkg/fish-prompt-mono
end