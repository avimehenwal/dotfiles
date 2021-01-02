"                       _       _                     
"  _ __ ___   __ _ _ __| | ____| | _____      ___ __  
" | '_ ` _ \ / _` | '__| |/ / _` |/ _ \ \ /\ / / '_ \ 
" | | | | | | (_| | |  |   < (_| | (_) \ V  V /| | | |
" |_| |_| |_|\__,_|_|  |_|\_\__,_|\___/ \_/\_/ |_| |_|
"                                                     
" https://github.com/markdownlint/markdownlint

:compiler markdownlint

augroup run_static_analysis_onSave
  autocmd!
  autocmd BufEnter,BufWritePost * :make % | redraw!
augroup end
