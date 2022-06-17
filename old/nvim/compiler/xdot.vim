"          _       _   
" __  ____| | ___ | |_ 
" \ \/ / _` |/ _ \| __|
"  >  < (_| | (_) | |_ 
" /_/\_\__,_|\___/ \__|
"                      
"

if exists('current_compiler')
  finish
endif

let current_compiler = 'xdot'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=xdot
CompilerSet errorformat&		
