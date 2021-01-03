"      _          _ _ 
"  ___| |__   ___| | |
" / __| '_ \ / _ \ | |
" \__ \ | | |  __/ | |
" |___/_| |_|\___|_|_|
"                     
" for shell and bash scripts
"
" https://jezenthomas.com/shell-script-static-analysis-in-vim/
"
"
" shellcheck compiler options are already added in compiler/shellcheck.vim plugin file
" set makeprg=shellcheck\ --format=gcc\ --check-sourced\ %
:compiler shellcheck

augroup run_makeprg_onWrite
  autocmd BufWritePost <buffer> :make % | redraw!
augroup end
