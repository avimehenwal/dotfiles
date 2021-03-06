" vim inbuilt File Explorer
"
" Configure default netrw plugin like nerdtree
" https://shapeshed.com/vim-netrw/
"
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" make gx work and open links under cursor
let g:netrw_browsex_viewer = "gnome-open"

" augroup ProjectDrawer
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

