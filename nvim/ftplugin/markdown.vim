"                       _       _                     
"  _ __ ___   __ _ _ __| | ____| | _____      ___ __  
" | '_ ` _ \ / _` | '__| |/ / _` |/ _ \ \ /\ / / '_ \ 
" | | | | | | (_| | |  |   < (_| | (_) \ V  V /| | | |
" |_| |_| |_|\__,_|_|  |_|\_\__,_|\___/ \_/\_/ |_| |_|
"                                                     
" https://github.com/markdownlint/markdownlint

" remove the bold and italics markup in markdown files
setlocal conceallevel=2

:compiler markdownlint

augroup run_static_analysis_onSave
  autocmd!
  autocmd BufEnter,BufWritePost *.md :make % | redraw!
augroup end

" TODO: deal with sublists
" For markdown files, convert unordered list to Ordered list
" can use cat -n, bat -n or nl linux tools
" :'<,'>call OrderedList()
function! OrderedList() range abort
  let l:number_line = '!nl
    \ --number-format=ln
    \ --number-separator=". "
    \ --number-width=1
    \ --body-numbering=t'
	execute a:firstline . ',' . a:lastline . 's/\(*\|-\) //'
  execute a:firstline . ',' . a:lastline . l:number_line
endfunction 
