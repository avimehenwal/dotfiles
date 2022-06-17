" use python xdot program to view dot files
" -------------------------------------------------- 
" :make % is synchronous and it blocks editing until preview window is open

" live preview Hotkey
nnoremap <leader>lp :!xdot % &<CR>
!xdot % &
:call autosave#As()


" Asynchronous job
" FIXME: a new terminal window buffer is created each time
" Desired is to use only 1 named terminal
" :help term_start())
function! s:xdot_live_preview(dot_file)
  " let l:cmd = "terminal ++close ++hidden xdot " . a:dot_file
  " :execute l:cmd
  let l:cmd = 'xdot ' . a:dot_file
  let l:opts = {'term_name': 'Xdot Graphviz Preview', 'hidden': 1 }
  if exists('g:xdotId')
    let l:status = term_getstatus(g:xdotId)    " running
    echom 'window exists with ID ' . g:xdotId . ' Use R to refresh'
  else
    echo 'Need to start from scratch'
    let g:xdotId = term_start(l:cmd, l:opts)
  endif
  let l:job = term_list()
  echom l:job
endfunction


