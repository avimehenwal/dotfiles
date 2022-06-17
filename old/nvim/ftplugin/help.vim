" open Help files in vertical split
" ------------------------------------------------------------ 
" Use command-line abbreviations to expand help to vertical help
"
" Make buffer comfortable to read on 14inch laptop screen

augroup vertical_help
  " Remove all auto-commands
  autocmd! * <buffer>
  autocmd BufWinEnter <buffer> wincmd H | vertical resize 90
augroup END

" use MAN page like <SpaceBar> to navigate help.
nnoremap <Space> <C-f>
