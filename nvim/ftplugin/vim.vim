"        _                  __ _   
" __   _(_)_ __ ___        / _| |_ 
" \ \ / / | '_ ` _ \ _____| |_| __|
"  \ V /| | | | | | |_____|  _| |_ 
"   \_/ |_|_| |_| |_|     |_|  \__|
"                                  
" vim fileType
"

inoreabbrev iab inoreabbrev

:compiler vint
au BufWritePost * :make % | redraw!
