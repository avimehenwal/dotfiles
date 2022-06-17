function tmux.dev -d 'tmux startup script'
  set --local SESSION_NAME Dashboard
  set --local WINDOW_NAME gitCockpit
  set --local GROUP_NAME group1
  set --local START_DIRECTORY /home/avi/Documents/PersonalProjects/avimehenwal.in
  set --local WATCH 'watch --color --differences --beep --interval 5'
  set --local DOTFILE 'git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
  set --local P_AVI '$HOME/Documents/PersonalProjects/avimehenwal.in'
  set --local HUGO_SERVER 'hugo server --buildDrafts --buildExpired --buildFuture'

  tmux \
    start-server \; \
    new-session -s $SESSION_NAME -n $WINDOW_NAME -c $START_DIRECTORY -d "$WATCH 'git s; git ds; git dc'" \; \
    select-window -t 0 \; \
    # first split has to be -h to make a 50-50 vertical split
    split-window -h \; \
    send-keys "$WATCH '$DOTFILE status'" C-m \; \
    split-window -v \; \
    send-keys $HUGO_SERVER C-m \; \
    select-pane -t 2 -T 'paneName' \; \
    # split-window -v \; \
    # send-keys -t3 'clear' Enter \; \
  attach
end

function tmux.ls -d 'list all tmux session-windows-panes'
  echo -e "TMUX SESSIONS"
  tmux list-sessions
  echo -e "TMUX WINDOWS"
  tmux list-windows
  echo -e "TMUX PANES"
  tmux list-panes
end

function tmux.test -d 'test tmux'
end

function startup_script -d 'startup script to launch terminal window and tmux session'
  echo -e "Running startup script"
  gnome-terminal --window -- $SHELL --command="startup_script"

  # terminal executes the command and exits, use read to wait and display result until user reads
  gnome-terminal -- /bin/bash -c 'ls; read'
  gnome-terminal -- $SHELL --command='pwd; read'

  # keep alive the new terminal session
  gnome-terminal -- /bin/bash -c 'ls;exec /bin/bash'
  gnome-terminal -- $SHELL --command="ls;exec $SHELL"
  gnome-terminal -- fish --command="ls; exec fish"
end