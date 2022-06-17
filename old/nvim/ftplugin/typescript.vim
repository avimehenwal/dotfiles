"  _                                   _       _   
" | |_ _   _ _ __   ___  ___  ___ _ __(_)_ __ | |_ 
" | __| | | | '_ \ / _ \/ __|/ __| '__| | '_ \| __|
" | |_| |_| | |_) |  __/\__ \ (__| |  | | |_) | |_ 
"  \__|\__, | .__/ \___||___/\___|_|  |_| .__/ \__|
"      |___/|_|                         |_|        
"
" for typescript filetypes

:compiler tsc

augroup run_makeprg_onWrite
  autocmd BufWritePost <buffer> :make
augroup end

