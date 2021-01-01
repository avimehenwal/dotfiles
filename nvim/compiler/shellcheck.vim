" 
"  ____  _          _ _  ____ _               _    
" / ___|| |__   ___| | |/ ___| |__   ___  ___| | __
" \___ \| '_ \ / _ \ | | |   | '_ \ / _ \/ __| |/ /
"  ___) | | | |  __/ | | |___| | | |  __/ (__|   < 
" |____/|_| |_|\___|_|_|\____|_| |_|\___|\___|_|\_\
"                                                  
" https://www.shellcheck.net/
"
" https://vi.stackexchange.com/a/27693/17317
" USAGE -> :compiler shellcheck
"
if exists('current_compiler')
  finish
endif

let current_compiler = 'shellcheck'

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=shellcheck\ --format=gcc\ --check-sourced

" CompilerSet errorformat='%f:%l:%c: %trror: %m,' .
"     \ '%f:%l:%c: %tarning: %m,' .
"     \ '%f:%l:%c: %tote: %m'

" use the default 'errorformat'
CompilerSet errorformat&		
