" easy unimpaired movement
" https://github.com/tpope/vim-unimpaired/blob/master/plugin/unimpaired.vim
"
" Anchor Keys    Description
"   q              Quickfix
"   c              Location List
"   b              Buffers
"   t              Tabs
"   h              Help grep in location/quickfix window
"   a              Argument List
"
" MOVEMENT KEYS
"   []     previous, next
"   p,\    first, last       ToDo: Maybe use CAPS varients for first and last
"   -=     open, close
"
" used by :makeprg, :helpgrep, :vimgrep
" The ! prevent using user mapping


" QUICKFIX List, 1 for entire session
" q -> Recording into registers
" use [] prior to q else it interferes with recording option
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
nnoremap =q :copen<CR>
nnoremap -q :cclose<CR>
" cfile -> read errors from a file

" Location List, individual to each buffer
nnoremap [c :lprevious<CR>
nnoremap ]c :lnext<CR>
nnoremap pc :lfirst<CR>
nnoremap \c :llast<CR>
nnoremap =c :lopen<CR>
nnoremap -c :lclose<CR>
" lfile -> read errors from a file

" Buffer List :ls
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap pb :bfirst<CR>
nnoremap \b :blast<CR>
nnoremap =b :Buffers<CR>
nnoremap -b :bdelete<CR>

" Tab List :tabs
" t -> t-th occourence of character
nnoremap [t :tabprevious<CR>
nnoremap ]t :tabnext<CR>
nnoremap pt :tabfirst<CR>
nnoremap \t :tablast<CR>
nnoremap =t :tabedit<CR>
nnoremap -t :tabclose<CR>

" Argument List :args, low priority
" still to uncover quality use-case
" a -> Append text after, normal->insert mode
nnoremap [a :prev<CR>
nnoremap ]a :next<CR>
nnoremap pa :first<CR>
nnoremap \a :last<CR>
nnoremap =a :args<CR>

" HelpGrep :lhelpgrep, use global quickfix window
cnoreabbrev h helpgrep
" https://vi.stackexchange.com/questions/28603/how-to-navigate-vim-buffers-using-quickfix-list
cnoreabbrev ls lexpr map(getbufinfo({'buflisted': 1}), {_, v -> v.name})<CR>

" Automatically open QuickFix window when there are errors from compilers
augroup onError_open_quickfix
  au QuickFixCmdPost [^l]* nested cwindow
  au QuickFixCmdPost    l* nested lwindow
augroup end
