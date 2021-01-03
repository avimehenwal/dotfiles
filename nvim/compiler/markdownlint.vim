"                       _       _                     _ _       _   
"  _ __ ___   __ _ _ __| | ____| | _____      ___ __ | (_)_ __ | |_ 
" | '_ ` _ \ / _` | '__| |/ / _` |/ _ \ \ /\ / / '_ \| | | '_ \| __|
" | | | | | | (_| | |  |   < (_| | (_) \ V  V /| | | | | | | | | |_ 
" |_| |_| |_|\__,_|_|  |_|\_\__,_|\___/ \_/\_/ |_| |_|_|_|_| |_|\__|
"                                                                   
" https://github.com/markdownlint/markdownlint
"
" 37 Rules   -> mdl --list-rules | wc
" Style File -> Select which style mdl uses.
" A 'style' is a .rb file containing a list of enabled/disable rules,
" as well as options for some rules that take them.

if exists('current_compiler')
  finish
endif

let current_compiler = 'mdl'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=mdl\ --ignore-front-matter\ --style\ $HOME/dotfiles/standalone-configs/markdownlint-style.rb
CompilerSet errorformat&		
