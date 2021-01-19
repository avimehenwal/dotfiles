"                       _       _                     
"  _ __ ___   __ _ _ __| | ____| | _____      ___ __  
" | '_ ` _ \ / _` | '__| |/ / _` |/ _ \ \ /\ / / '_ \ 
" | | | | | | (_| | |  |   < (_| | (_) \ V  V /| | | |
" |_| |_| |_|\__,_|_|  |_|\_\__,_|\___/ \_/\_/ |_| |_|
"                                                     
" https://github.com/markdownlint/markdownlint

" INDENTATION CONTROLS
" already mapped to COC, so override
" i  <Tab>       * <C-R>=UltiSnips#ExpandSnippetOrJump()<CR>                                                                                           
iunmap <Tab>
inoremap <Tab> <Esc>>>A
inoremap <S-Tab> <Esc><<A

" generic spell checking from main init.vim config

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
setlocal comments+=b:>      
setlocal commentstring=<!--%s-->

" setlocal formatoptions-=t  " auto-wrap text
" setlocal formatoptions-=c  " auto-wrap comments
" setlocal formatoptions-=w  " do not use trailing whitespace as paragraph marker
" setlocal formatoptions-=a  " no automatic formating
setlocal formatoptions=q   " do not allow comment formatting with "gq"
setlocal formatoptions+=r  " print on Enter
setlocal formatoptions+=o  " print comment leader on o or O
setlocal formatoptions+=n  " numbered list

" setlocal formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\s*[-*+]\\s\\+\\\|^\\[^\\ze[^\\]]\\+\\]:
setlocal formatlistpat=^\\s*                     " Optional leading whitespace
setlocal formatlistpat+=[                        " Start character class
setlocal formatlistpat+=\\[({]\\?                "   Optionally match opening punctuation
setlocal formatlistpat+=\\(                      "   Start group
setlocal formatlistpat+=[0-9]\\+                 "     Numbers
setlocal formatlistpat+=\\\|                     "     or
setlocal formatlistpat+=[a-zA-Z]\\+              "     Letters
setlocal formatlistpat+=\\)                      "   End group
setlocal formatlistpat+=[\\]:.)}                 "   Closing punctuation
setlocal formatlistpat+=]                        " End character class
setlocal formatlistpat+=\\s\\+                   " One or more spaces
setlocal formatlistpat+=\\\|                     " or
setlocal formatlistpat+=^\\s*[-–+o*•]\\s\\+      " Bullet points


:compiler markdownlint

augroup run_static_analysis_onSave
  " remove all other auto commands from current buffer only
  " autocmd! * <buffer>
  autocmd BufEnter,BufWritePost <buffer> :make % | redraw!
augroup end

" augroup run_spellCheck_onBufferClose
"   autocmd BufLeave <buffer> :terminal hunspell %<CR>
" augroup end

