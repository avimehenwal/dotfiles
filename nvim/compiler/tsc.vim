"  _            
" | |_ ___  ___ 
" | __/ __|/ __|
" | |_\__ \ (__ 
"  \__|___/\___|
"               
" typescript compiler
" https://www.typescriptlang.org/docs/handbook/compiler-options.html

if exists('current_compiler')
  finish
endif

let current_compiler = 'tsc'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=tsc
CompilerSet errorformat=%+A\ %#%f\ %#(%l\\\,%c):\ %m,%C%m
