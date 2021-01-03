"        _                  __ _   
" __   _(_)_ __ ___        / _| |_ 
" \ \ / / | '_ ` _ \ _____| |_| __|
"  \ V /| | | | | | |_____|  _| |_ 
"   \_/ |_|_| |_| |_|     |_|  \__|
"                                  
" vim fileType
"

:compiler vint

augroup run_static_analysis_onSave
  autocmd BufWritePost <buffer> :make % | redraw!
augroup end

" abbreviations
inoreabbrev iab inoreabbrev
inoreabbrev cab cnoreabbrev

" key maps
inoreabbrev nmap nnoremap
inoreabbrev imap inoremap
inoreabbrev vmap vnoremap
inoreabbrev tmap tnoremap
