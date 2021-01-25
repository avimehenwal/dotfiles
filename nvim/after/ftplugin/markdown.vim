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
:call on_Enter#ListCharacter()

" COMPILER PROGRAM
:compiler markdownlint

augroup run_static_analysis_onSave
  " remove all other auto commands from current buffer only
  " autocmd! * <buffer>
  autocmd BufEnter,BufWritePost <buffer> :make % | redraw!
augroup end

" augroup run_spellCheck_onBufferClose
"   autocmd BufLeave <buffer> :terminal hunspell %<CR>
" augroup end

