"                       _       _                     _ _       _   
"  _ __ ___   __ _ _ __| | ____| | _____      ___ __ | (_)_ __ | |_ 
" | '_ ` _ \ / _` | '__| |/ / _` |/ _ \ \ /\ / / '_ \| | | '_ \| __|
" | | | | | | (_| | |  |   < (_| | (_) \ V  V /| | | | | | | | | |_ 
" |_| |_| |_|\__,_|_|  |_|\_\__,_|\___/ \_/\_/ |_| |_|_|_|_| |_|\__|
"                                                                   
" https://github.com/markdownlint/markdownlint

if exists('current_compiler')
  finish
endif

let current_compiler = 'mdl'

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

" skip rule MD033 - Inline HTML
CompilerSet makeprg=mdl\ --ignore-front-matter\ --rules\ MD001,MD002,MD003,MD004,MD005,MD006,MD007,MD009,MD010,MD011,MD012,MD013,MD014,MD018,MD019,MD020,MD021,MD022,MD023,MD024,MD025,MD026,MD027,MD028,MD029,MD030,MD031,MD032,MD034,MD035,MD036,MD037,MD038,MD039,MD046
CompilerSet errorformat&		
