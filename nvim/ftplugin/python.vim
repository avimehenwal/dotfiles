"              _   _                 
"  _ __  _   _| |_| |__   ___  _ __  
" | '_ \| | | | __| '_ \ / _ \| '_ \ 
" | |_) | |_| | |_| | | | (_) | | | |
" | .__/ \__, |\__|_| |_|\___/|_| |_|
" |_|    |___/                       
"
" https://vim.fandom.com/wiki/Keep_your_vimrc_file_clean

setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal smarttab
setlocal formatoptions=croql filetype=python

setlocal colorcolumn=80

" applies only to local buffer
setlocal path=.,**
setlocal wildignore=*.pyc,*/__pycache__/*

" include search
setlocal include=^\\s*import
setlocal define=^\\s*\\<\\(def\\\|class\\)\\>

" (1) convert import con.metric            => conv/metric.py
" (2) from con import conversion as conv   => conv/conversion.py conv.py
function! PyInclude(fname)
endfunction

