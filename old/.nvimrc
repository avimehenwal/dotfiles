" project specific file for nvim
" Dotfiles
" Avi Mehenwal 


" respects .gitignore and automatically skip hidden files/directories and binary files.
" use --glob=! to exclude directories
set grepprg=rg\ --smart-case\ --vimgrep\ --glob='!docs/*'\ --glob='!*.lock'

set makeprg=make

" exclude path
" set path-=node_modules
" set path-=zsh/plugins
set path-=yarn.lock

"   set wildignore+=*/node_modules/*
"   set wildignore+=*/zsh/plugins/*
"   set wildignore+=*/docs/*
"   set wildignore+=*.lock
set wildignore=*/docs/*,*.lock,*/node_modules/*

let g:AVI='Avi Mehenwal'
" unlet g:AVI

" send make website command to tmux panel
" :!tmux send-keys -t 1 'make' Enter
cnoreabbrev build tmux send-keys -t 1 'make' Enter
cnoreabbrev web tmux send-keys -t 1 'make web' Enter
