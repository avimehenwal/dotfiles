"      _       _                    _ _       _            
"   __| | ___ | |_ ___ _ ____   __ | (_)_ __ | |_ ___ _ __ 
"  / _` |/ _ \| __/ _ \ '_ \ \ / / | | | '_ \| __/ _ \ '__|
" | (_| | (_) | ||  __/ | | \ V /  | | | | | | ||  __/ |   
"  \__,_|\___/ \__\___|_| |_|\_/   |_|_|_| |_|\__\___|_|   
"                                                          
" https://github.com/dotenv-linter/dotenv-linter
" Lightning-fast linter for .env files

if exists('current_compiler')
  finish
endif

let current_compiler = 'dotenv-linter'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=dotenv-linter\ --show-checks
CompilerSet errorformat&		
