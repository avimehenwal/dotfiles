########## GIT UTILITY FUNCTIONS ####
function git.branch.name --description 'list all branch names in a selectable fashion'
    git branch --all -vv \
    | fzf --prompt='checkout to branch > ' \
    | awk '{print substr($0, 3, length($0))}' \
    | awk '{print $1}'
end

function git.stage.list --description 'list staged files for selection'
    git status --short \
    | fzf --multi --ansi --tac --cycle --preview 'git diff {+2}' \
    | awk '{if (NR==eof) printf "%s ", $2; else print $2}'
end

function git.search.repos --description 'List all git repo paths on machine then cd and run ls'
    # blinking text
    echo -e "\e[5mNOTE:: excluding path" (pwd)"/.*\e[0m"
    cd (find ~ ! -path './.*' -type d -name .git -print | fzf)
    cd ../
    ll
    git.trend 30
end

function git.alias.list --description 'list all aliases from .gitconfig file'
    # remove prepending 'alias.'
    # get all alases
    # pretty print output
    git config --get-regexp alias \
    | sed s/......// \
    | awk '{print"\t"$1"\t"$2$3$4$5$6$7}'
    # | cut --delimiter=' ' --fields=2-
end

function git.untracked -d 'list all untracked files'
    # --porcelain strip color codes like \033[0 added by git
    # USAGE: rm -v (git.untracked)
    git status --porcelain \
    | awk '/^\?\?/ { print $2; }' \
    | fzf --multi --preview 'stat {+1}; bat {+1}'
end

function git.spellcheck -d 'list content files for spell check'
    # echo (
    set --local selection (
        git status --short \
        | awk '{print $2}' \
        | grep -E '.md' \
        | fzf --multi --ansi --cycle --height 70% --preview 'cat {+1} | aspell list'
    )
    echo -e $selection
    if test -n "selection"
        for FILE in $selection
            echo -e "aspell check $FILE"
            aspell check $FILE
        end
    end
end

function git.branch.remove.merged -d 'remove local branches merged to master'
    git branch --merged master --no-color \
    | grep -v master \
    | xargs git branch --delete
end

function git.whathappened --argument NAME -d 'show all logs related to a file'
    echo -e 'git whathappened accepts a FILE-NAME to track changes on it'
    echo $NAME
    git whathapp $NAME \
    | fzf \
        --prompt='git show --stat --format=fuller --patch >' \
        --preview='git show --stat --format=fuller --patch {+1}'
end

function git.trackfile -d 'track logs for a file'
    set --local FILES ( \
        git ls \
        | fzf --multi --preview='bat {}'
    )
    echo $FILES
    for FILE in $FILES
        git.whathappened $FILE
    end
end

########## GIT ANALYTICS ####
function git.trend --argument NUM --description 'Human redable #Files changed with addition and deletions in past $NUM commits'
    set --query NUM[1]; or set --local NUM 10
    git log --date=local --pretty=%ad --stat -$NUM
end

function git.trend.filter --argument NUM --description 'filter trend data for graph plotting'
    set --query NUM[1]; or set --local NUM 10
    # echo "NUM=$NUM"
    # tr- translate or delete characters
    # sed replace multiple black space to nothing
    # remove first line from stdout
        # awk '{if(NR>1)print}'
        # sed -n '1!p'
        # tail -n +2
    git log --date=short --pretty=@%ad --shortstat -$NUM \
    | tr "filechangedinsertionsdeletions()+" " " \
    | sed -e 's/[ ]*//g' -e 's/-$//g'\
    | tr "\n" " "  \
    | tr "@" "\n" \
    | tail -n +2 \
    | awk 'BEGIN{RS="\n";FS=","; \
        print"@ Additions,Deletions"} { \
        if($2=="")print$1" 0,0,0"; \
        else if($3=="")print$0",0"; \
        else print$0}'
end

function git.trend.filter.graph --argument NUM --description 'stacked termgraph for +/-'
    set --query NUM[1]; or set --local NUM 3
    git.trend.filter $NUM \
    | termgraph --stacked --color {blue,red} --title "#Files changed::Additions/deletions  for last $NUM logs"
end

function git.trend.filter.calendar --description '#Files modified'
    git.length
    git.trend.filter $_GIT_LOG_LENGTH \
    | tail -n +2 \
    | cut --delimiter=',' -f1 \
    | termgraph --calendar --color {yellow} --title "Total number of Files modified for last $_GIT_LOG_LENGTH logs"
end

function git.commit --argument NUM --description '#commits as per date'
    # git log --date=local | grep Date | awk '{print " : "$4" "$3" "$6}' | uniq -c
    # git rev-list --count --since=yesterday --before=today HEAD
    # git rev-list --count --since=2018 --before=2020 HEAD
    set --query NUM[1]; or set --local NUM 50
    git log --date=short --pretty=format:%ad -$NUM \
    | sort --reverse \
    | uniq -c \
    | awk '{print$2" "$1}'
end

function git.commit.graph --argument NUM --description '#commits as per date'
    set --query NUM[1]; or set --local NUM 200
    git.commit $NUM \
    | termgraph --color {green} --title "#Commit history for last $NUM logs"
end

function git.commit.calendar --description '#commits as per date'
    git.length
    git.commit $_GIT_LOG_LENGTH \
    | termgraph --calendar --color {yellow} --title "#Commit Heatmap for last $_GIT_LOG_LENGTH logs"
end

# User define Functions
# https://misc.flogisoft.com/bash/tip_colors_and_formatting

function git.contributors -a NUM --description 'termgraph top 5 contributors'
    set --query NUM[1]; or set --local NUM 5
    git shortlog --summary --numbered | \
        head -$NUM | \
        awk '{print $2 $3 $4, $1}' | \
        termgraph --color {cyan} --title "Commit Leaderboard top $NUM"
end

function git.log.date --argument DATE --description 'log commits on a particular day'
    # 2019-06-11
    git log --after="$DATE 00:00" --before="$DATE 23:59"
end

function git.size --description 'git repository size'
    echo -e "\033[1;32mGit repository Size \e[0m"
    git count-objects --human-readable -v | column
end

function git.tracked.files --description 'Tracked files summary'
    git ls | wc --lines | awk '{print "Tracking: \033[5m\033[1;32m"$1" Files\033[0m in Repository"}'
end

function git.length --description 'Total number of commit logs in all branches'
    set --global _GIT_LOG_LENGTH (git rev-list --all --count)
    echo -e "\033[1;33mRepo log length on all branchs \e[5m: $_GIT_LOG_LENGTH \e[0m"
end

function author.addition.deletions --argument USER BRANCH --description 'Additions and deletions by a author'
    git log --author=$USER --shortstat $BRANCH | \
        awk '/^ [0-9]/ { f += $1; i += $4; d += $6 } \
        END { printf("%d files changed, %d insertions(+), %d deletions(-)", f, i, d) }'
end

function git.files --argument TOP --description 'Top 10 Most frequently modified files'
    set --query TOP; or set --local TOP 10
    git log --pretty=format: --name-only \
    | sort \
    | uniq -c \
    | sort -rg \
    | tail -n +2 \
    | head -$TOP
end

function git.files.graph --description 'Top 10 Most frequently modified files'
    git.files \
    | awk '{print$2", "$1}' \
    | termgraph --color {yellow} --title "Most frequently updated files"
end

function git.age --description 'determine how old is repo'
    set --local result (git log --reverse --pretty=format:%ad | head -1)
    echo -e "\n\033[1;35mFirst commit on repo was made \e[5m: $result\e[0m"
end

function git.branches --description 'Output the total number of remote branches in repo'
    set --local result (git branch --remotes --list \
    | grep --invert-match HEAD \
    | wc -l)
    echo -e "\n\033[1;31m\e[5m $result Remote branches \e[0mon repo"
end

function git.branches.commit -d 'commits made on each git branch'
    for item in (git branch --remote --list --no-color \
            | grep --invert-match HEAD \
            | sed -e 's/[ ]*//')
        # echo -e "git rev-list --count $item"
        set --local count (git rev-list --count $item)
        echo "$item, $count"
    end
end

function git.branches.graph -d 'graph for #commits on each branch'
    git.branches.commit | termgraph --color {magenta} --title 'Number of commits on each branch'
end

function git.checkout.master --description 'on master checkout print hall-of-fame '
    git checkout master
    git pull --all
    git.contributors
    git.tracked.files
    git.size
    git.trend.filter.graph 50
end

function git.analyze --descriptio 'Analyze a git repo'
    git-stats --authors
    git.contributors
    git.tracked.files
    git.files.graph
    git.size
    # git.length already called before drawing calendar graphs
    # git.length
    # git last
    git.trend.filter.graph 50
    git.trend.filter.calendar
    git.commit.graph 200
    git.age
    git.branches
    git.branches.graph
    git.commit.calendar
    # git.trends 4 weeks
end