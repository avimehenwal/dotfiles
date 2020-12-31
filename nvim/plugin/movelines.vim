" vscode line code-block, code-line movement keybindings for all modes
"
" https://vim.fandom.com/wiki/Moving_lines_up_or_down
"
" Use ALT + movement keys
" :help move

" use meta key bindings
" https://stackoverflow.com/a/27206531/1915935

" vim ONLY: Using META KEY ^[ causes unexpected behaviour, delays and trigger move commands
" at undesirable occassions
"
" execute "set <M-j>=\ej"
" execute "set <M-k>=\ek"

nnoremap <M-j> :move .+1<CR>==
nnoremap <M-k> :move .-2<CR>==
vnoremap <M-j> :move '>+1<CR>gv=gv
vnoremap <M-k> :move '<-2<CR>gv=gv
inoremap <M-k> <Esc>:move .-2<CR>==gi
inoremap <M-j> <Esc>:move .+1<CR>==gi
