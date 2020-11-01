function cdr -d 'cd to root of git repo'
    echo -e 'Navigating until git root'
    while test ! -d ./.git
        cd ..
        echo (pwd)
    end
end

function fish_chpwd --on-event chpwd
    echo
    echo -s (set_color brgreen) "-> " (set_color reset) (pwd)
end

function fuck
    eval sudo $history[1]
end

function cd --description 'Change directory'
    set -l MAX_DIR_HIST 25

    if test (count $argv) -gt 1
        printf "%s\n" (_ "Too many args for cd command")
        return 1
    end

    # Skip history in subshells.
    if status --is-command-substitution
        builtin cd $argv
        return $status
    end

    # Avoid set completions.
    set -l previous $PWD

    if test "$argv" = "-"
        if test "$__fish_cd_direction" = "next"
            nextd
        else
            prevd
        end
        return $status
    end

    builtin cd $argv
    set -l cd_status $status

    if test $cd_status -eq 0 -a "$PWD" != "$previous"
        set -q dirprev[$MAX_DIR_HIST]
        and set -e dirprev[1]
        set -g dirprev $dirprev $previous
        set -e dirnext
        set -g __fish_cd_direction prev
    end

    emit chpwd
    return $cd_status
end