#!/usr/bin/fish

set PRE PRE-COMMIT-HOOK
set STAGED_FILES
set CONTENT_FILES
set REPLY
set FZF_CMD fzf --multi --ansi --cycle --height 80%
set BEFORE (git status --short)
set PROGRESS 0
set STAGES UNTRACKED UNSTAGED REVIEW_STAGED SPELL_CHECK

function log -a MSG COLOR -d 'log normal message'
	set -q COLOR[1]
		or set COLOR cyan
	set_color -o $COLOR
	echo -e "[$PRE] $MSG"
	set_color normal
end

function REVIEW_STAGED -d 'stage unstaged files'
	git status
# set --local STAGED_FILES (git diff --name-only --cached)
# 	set --local COUNT (count $STAGED_FILES)
# 	log "[$COUNT] Review staged files" 'yellow'
	# if test $COUNT -gt 0
	# 	set --local SELECTION ( \
	# git diff --name-only --cached \
	# | eval "$FZF_CMD --preview 'git diff --cached {}'"
		# )
		# echo "Files selected $SELECTION"
		# if test (count $SELECTION) -gt 0
		# 	git reset HEAD $SELECTION
		# 	log "files unstaged" 'green'
		# else
		# 	log 'nothing selected - moving ahead'
		# end
	# else
	# 	log 'No file staged yet' 'green'
	# end
end

function UNSTAGED -d 'unstage previously staged files'
	set --local UNSTAGED_FILES (git diff --name-only)
	set --local COUNT (count $UNSTAGED_FILES)
	log "[$COUNT] UNSTAGED FILES, use (SHIFT+TAB) to stage changes" 'yellow'
	if test $COUNT -gt 0
		git add --verbose ( \
			git diff --name-only \
			| eval "$FZF_CMD --preview 'git diff {}'" \
		)
		log "files staged" 'green'
	else
		log 'Empty unstaged files' 'green'
	end
end

function UNTRACKED -d 'add untracked files for tracking'
	set --local UNTRACKED_FILES (git status --porcelain | grep -i '^?')
	set --local COUNT (count $UNTRACKED_FILES)
	log "[$COUNT] UNTRACKED FILES, select to add them for tracking" 'yellow'
	if test $COUNT -gt 0
		git add --verbose ( \
			git status --porcelain \
			| grep -i '^?' \
			| awk '{print $2}' \
			| eval "$FZF_CMD --preview 'bat {}'" \
		)
		# log "files added for tracking" 'green'
	else
		log 'No untracked files' 'green'
	end
end

function SPELL_CHECK -d 'run aspell on content files'
	log "[SPELL CHECK] for content files md, adoc, txt, rst"
	# https://github.com/IonicaBizau/node-cli-pie
	# for counts use | wc --line
	set --local CFS ( \
		git status --porcelain \
		| awk '{print $2}' \
		| grep -i 'md$\|adoc$\|txt$\|rst$' \
	)
	# REPORT
	log 'git.spellcheck : interactive spell checker'
	for CF in $CFS
		set --local SC_COUNT (cat $CF | aspell list | wc --line)
		log "$SC_COUNT\t$CF" 'yellow'
	end
	# todo- intteractive spell check doesnt work
	# aspell check README.md
	# git status --porcelain \
	# | eval "$FZF_CMD --query 'md | adoc | txt' --preview 'bat {+2}'"
end

# breakpoint
# MAIN
for STAGE in $STAGES
	# clear
	set PROGRESS (math $PROGRESS + 10)
	echo -n "$STAGE $PROGRESS" \
	| termgraph --title "COMMIT-WORKFLOW: $STAGES" --color {yellow}
	# echo -e $BEFORE
	eval $STAGE
end

# TEST
# for i in (seq 0 10 50)
#     # echo $i | dialog --guage "Working..." 10 35
#     clear
#     echo -n "STAGE $i" | termgraph --title "Workflow Stage"
#     sleep 0.5s
# end