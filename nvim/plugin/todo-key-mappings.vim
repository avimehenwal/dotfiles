" with VIM you can practically program every key
"
"
" Leader key, like \, <space>, J
let g:mapleader="\<Space>"
" local to buffer <LocalLeader>
" let maplocalleader="\\"

nnoremap <Space> <Nop>
" save a LOT of keystrokes
" :help recursive-mapping
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Better indenting
vnoremap < <gv
vnoremap > >gv

if exists('g:vscode')
  " Simulate same TAB behavior in VSCode
  nmap <Tab> :Tabnext<CR>
  nmap <S-Tab> :Tabprev<CR>
else
  " Better nav for omnicomplete
  inoremap <expr> <c-j> ("\<C-n>")
  inoremap <expr> <c-k> ("\<C-p>")

  " I hate escape more than anything else
  " inoremap jk <Esc>
  " inoremap kj <Esc>
  inoremap jj <Esc>

  " Easy CAPS
  " inoremap <c-u> <ESC>viwUi
  " nnoremap <c-u> viwU<Esc>

  " TAB in general mode will move to text buffer
  nnoremap <silent> <TAB> :bnext<CR>
  " SHIFT-TAB will go back
  nnoremap <silent> <S-TAB> :bprevious<CR>

  " Alternate way to save
  nnoremap <silent> <C-s> :w<CR>
  " Alternate way to quit
  nnoremap <silent> <C-Q> :wq!<CR>
  " Use control-c instead of escape
  nnoremap <silent> <C-c> <Esc>
  " <TAB>: completion.
  inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

  " Frequently Used Applications
  nnoremap <C-\> :Vifm<CR>
endif

