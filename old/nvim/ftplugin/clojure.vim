let b:repl = 'lein repl'
" automatically open repl
syntax on
nnoremap \\ yy<C-w>wpi<CR><C-\><C-n><C-w>w

" call termopen('lein repl', {'width': 10, 'height': 10})
execute 'vnew term://' . b:repl
