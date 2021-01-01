" 
"        _       _   
" __   _(_)_ __ | |_ 
" \ \ / / | '_ \| __|
"  \ V /| | | | | |_ 
"   \_/ |_|_| |_|\__|
"                    
" https://github.com/Vimjas/vint

if exists('current_compiler')
  finish
endif

let current_compiler = 'vint'

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

" colors are not displayed in vim output
" --color
CompilerSet makeprg=vint\ --enable-neovim\ --stat
CompilerSet errorformat&		
