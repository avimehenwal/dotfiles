" https://stackoverflow.com/questions/17365324/auto-save-in-vim-as-you-type
function! autosave#As() range abort
  augroup auto-save
    autocmd TextChanged,TextChangedI <buffer> write
  augroup end
endfunction
" call autosave#As
