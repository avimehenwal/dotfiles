function getent.passwd -d 'colored outptut'
    set --local cmd "getent passwd | sed 's/:/,/g' | bat --language csv"
    echo -s (set_color --bold yellow) "COMMAND -> " $cmd (set_color reset)
    eval $cmd
end

function list_members_group -a group -d 'List all Members of a group'
    getent group $group
    # add your user to tty group for serial consol access
    # sudo usermod --append --groups tty (whoami)
    # getent group tty
    # tty:x:5:avi
    # groups (whoami)
    # avi : avi adm tty dialout cdrom sudo dip plugdev lpadmin sambashare lxd docker

end