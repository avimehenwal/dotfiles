" 
"                     _       _     
"  ___  ___ _ __ __ _| |_ ___| |__  
" / __|/ __| '__/ _` | __/ __| '_ \ 
" \__ \ (__| | | (_| | || (__| | | |
" |___/\___|_|  \__,_|\__\___|_| |_|
"                                   
" https://vi.stackexchange.com/a/21390/17317
"

function! Scratch()
    vnew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    "" :vnew | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
    return "Scratch Pad loaded!"
endfunction

