" Copy / Paste Behavious -------------------------------------{{{
"vim-default to use cut-buffer * instead of primary application clipboard *
set clipboard=unnamed            " don't have to prepend "+ before yank and paste
" Copy pasting to local
noremap <Leader>p "+p
noremap <Leader>P "+P
noremap <Leader>y "+y
noremap <Leader>Y "+Y
set pastetoggle=<F2>   " prevent cascading indents of paragraphs
"}}}
