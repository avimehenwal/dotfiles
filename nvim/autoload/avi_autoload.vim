" TODO: deal with sublists
" For markdown files, convert unordered list to Ordered list
" can use cat -n, bat -n or nl linux tools
" :'<,'>call OrderedList()
"
" Using GLOBAL COMMAND
" :let c=0 | g/^* /let c+=1 | s//\=c.'. '
function! avi_autoload#OrderedList() range abort
  let l:number_line = '!nl
    \ --number-format=ln
    \ --number-separator=". "
    \ --number-width=1
    \ --body-numbering=t'
	execute a:firstline . ',' . a:lastline . 's/\(*\|-\) //'
  execute a:firstline . ',' . a:lastline . l:number_line
endfunction 

" execute and copy output to system clipboard
function! avi_autoload#RunLineUnderCursor() abort
  " better output buffer window
  " execute '!clear && ' . getline('.')
  execute 'term ' . getline('.') . ' | tee >(wl-copy)'
endfunction

" remove empty lines, empty lines with only whitespace chars
function! avi_autoload#RemoveEmptyLines() abort
  :g/^\s*$/d
endfunction
