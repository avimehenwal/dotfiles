"                _                  __            _             
"   ___ ___   __| | ___   _ __ ___ / _| __ _  ___| |_ ___  _ __ 
"  / __/ _ \ / _` |/ _ \ | '__/ _ \ |_ / _` |/ __| __/ _ \| '__|
" | (_| (_) | (_| |  __/ | | |  __/  _| (_| | (__| || (_) | |   
"  \___\___/ \__,_|\___| |_|  \___|_|  \__,_|\___|\__\___/|_|   
"                                                               
"
" VIMSCRIPT
" -------------------------------------------------- 
" replace double quotes with single quotes. " -> '
nnoremap <Leader>' :s/"/'/g<CR>


" code refactor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <Leader>gd <Plug>(coc-definition)
nnoremap <Leader>gr <Plug>(coc-references)
