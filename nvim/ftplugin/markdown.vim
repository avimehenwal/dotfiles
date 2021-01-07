"                       _       _                     
"  _ __ ___   __ _ _ __| | ____| | _____      ___ __  
" | '_ ` _ \ / _` | '__| |/ / _` |/ _ \ \ /\ / / '_ \ 
" | | | | | | (_| | |  |   < (_| | (_) \ V  V /| | | |
" |_| |_| |_|\__,_|_|  |_|\_\__,_|\___/ \_/\_/ |_| |_|
"                                                     
" https://github.com/markdownlint/markdownlint
" under after/ftplugin to override default markdown configs

" remove the bold and italics markup in markdown files
setlocal conceallevel=2

" MARKDOWN FORMATTING
" Use comments and formation options with lists
" fb:-"	Format a list that starts with "- ".
" https://github.com/tpope/vim-markdown/blob/master/ftplugin/markdown.vim

" comments, from a vim
setlocal autoindent
setlocal nosmartindent
setlocal nocindent

" Print *,-,> for unordered list on Enter
setlocal comments=b:-      " auto wrap
setlocal comments+=mb:*    " also break asian chars above 255
setlocal comments+=b:>     " Markdown blockquotes 
setlocal commentstring=<!--%s-->

" setlocal formatoptions-=t  " auto-wrap text
" setlocal formatoptions-=c  " auto-wrap comments
" setlocal formatoptions-=w  " do not use trailing whitespace as paragraph marker
" setlocal formatoptions-=a  " no automatic formating
setlocal formatoptions=q   " do not allow comment formatting with "gq"
setlocal formatoptions+=r  " print on Enter
setlocal formatoptions+=o  " print comment leader on o or O
setlocal formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\s*[-*+]\\s\\+\\\|^\\[^\\ze[^\\]]\\+\\]:

" LINTER Program
:compiler markdownlint

augroup run_static_analysis_onSave
  " remove all other auto commands from current buffer only
  " autocmd! * <buffer>
  autocmd BufEnter,BufWritePost <buffer> :make % | redraw!
augroup end

augroup run_spellCheck_onBufferClose
zsh:1: command not found: jg
augroup end

" TODO: deal with sublists
" For markdown files, convert unordered list to Ordered list
" can use cat -n, bat -n or nl linux tools
" :'<,'>call OrderedList()
"
" Using GLOBAL COMMAND
" :let c=0 | g/^* /let c+=1 | s//\=c.'. '
function! OrderedList() range abort
  let l:number_line = '!nl
    \ --number-format=ln
    \ --number-separator=". "
    \ --number-width=1
    \ --body-numbering=t'
	execute a:firstline . ',' . a:lastline . 's/\(*\|-\) //'
  execute a:firstline . ',' . a:lastline . l:number_line
endfunction 
