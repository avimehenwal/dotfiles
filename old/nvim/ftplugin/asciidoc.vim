"                 _ _     _            _             
"   __ _ ___  ___(_|_) __| | ___   ___| |_ ___  _ __ 
"  / _` / __|/ __| | |/ _` |/ _ \ / __| __/ _ \| '__|
" | (_| \__ \ (__| | | (_| | (_) | (__| || (_) | |   
"  \__,_|___/\___|_|_|\__,_|\___/ \___|\__\___/|_|   
"                                                    
" asciidoc, adoc files
"
" Use <buffer> with abbr else, once loaded they will be added to all new
" buffers

set expandtab tabstop=2 shiftwidth=2 smarttab
setlocal textwidth=120

" remove the bold and italics markup in markdown files
" seems like doest work on asciidoc files
setlocal conceallevel=2

" Abbreviations
inoreabbrev <buffer> btw between

" External Tools
" setlocal equalprg=clang-format
