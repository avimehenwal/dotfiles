"            _                        _ 
"   _____  _| |_ ___ _ __ _ __   __ _| |
"  / _ \ \/ / __/ _ \ '__| '_ \ / _` | |
" |  __/>  <| ||  __/ |  | | | | (_| | |
"  \___/_/\_\\__\___|_|  |_| |_|\__,_|_|
"  _ __  _ __ ___   __ _ _ __ __ _ _ __ ___  ___ 
" | '_ \| '__/ _ \ / _` | '__/ _` | '_ ` _ \/ __|
" | |_) | | | (_) | (_| | | | (_| | | | | | \__ \
" | .__/|_|  \___/ \__, |_|  \__,_|_| |_| |_|___/
" |_|              |___/                         
"
" open external programs with vim is as easy like Breathing

" open current files in browser
nnoremap ob :!$BROWSER %<CR>

" vscode like Task Management with vim?
" Makefile for each project to do various taska and then local keybindings with
" project specific .vimrc
" https://github.com/skywind3000/asynctasks.vim

" tidy up HTML with external program
" bat $HOME/EXP/neovim/runtime/compiler/tidy.vim
cnoreabbrev tidy tidy --show-body-only yes --quiet true --show-warnings false

" create project specific .nvimrc file and open in buffer to edit
nnoremap <M-1> :edit .nvimrc<CR>
" Run spell-checker program in interactive mode
" Google Drive and MS-Word uses Alt-F7
nnoremap <M-7> :terminal hunspell %<CR>
" run clocl to #lines of code
nnoremap <M-8> :terminal cloc --git .<CR>
