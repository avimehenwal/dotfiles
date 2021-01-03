"        _ _                                   _ _   
"   __ _(_) |_    ___ ___  _ __ ___  _ __ ___ (_) |_ 
"  / _` | | __|  / __/ _ \| '_ ` _ \| '_ ` _ \| | __|
" | (_| | | |_  | (_| (_) | | | | | | | | | | | | |_ 
"  \__, |_|\__|  \___\___/|_| |_| |_|_| |_| |_|_|\__|
"  |___/                                             
" 
" turn off autoindent in git commit buffer

set noautoindent
set nosmartindent

augroup gitCommit_inHorizontal_window
  autocmd! * <buffer>
  autocmd BufWinEnter <buffer> wincmd K
augroup END
