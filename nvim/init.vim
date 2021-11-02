"                __     ___
"  _ __   ___  __\ \   / (_)_ __ ___
" | '_ \ / _ \/ _ \ \ / /| | '_ ` _ \
" | | | |  __/ (_) \ V / | | | | | | |
" |_| |_|\___|\___/ \_/  |_|_| |_| |_|
"
" Try to keep initial vim bootup LANGUAGE AGNOSTIC
" All FileType specific configs go either into ftplugin dir or autocommands
"
" Don't seek mastery, seek proficiency
"
" start vim with zero configuration
" -N              									Not fully Vi compatible: 'nocompatible'
" -u <vimrc>      									Use <vimrc> instead of any .vimrc
" vi -Nu NORC <filepath>
" nvim -u NONE <filename>
"
" Order of rc-file detection
" 1. $VIMINIT												Environment Variable
" 2. $HOME/.vimrc
" 3. $HOME/.vim/vimrc
" 4. $EXINIT												Environment Variable
" 5. $HOME/.exrc
" 6. $VIMRUNTIME/defaults.vim
"
" DIRECTORY STRUCTURE and Organization
" cheat nvim
"
" linter Tools :retab
" BootConfig: runtimepath
set rtp+=$HOME/.fzf/bin/fzf

" https://superuser.com/questions/532593/how-do-i-get-vim-to-automatically-load-vimrc-config-from-the-current-directory
" Project specific .nvimrc files
set exrc
set secure

" EN-US Spell Checking
set spell spelllang=en_us
" browse and search mispelled words [s, ]s. zg to add correct word to spellfile.
" zG internal-wordlist
set spellfile=$HOME/dotfiles/nvim/spell/en.utf-8.add

" VSCODE
if exists('g:vscode')
  source $HOME/.config/nvim/vscode/settings.vim
else
  " TUI based config
  if (has('termguicolors'))
    set termguicolors
  endif

  if has('nvim')
    " Manually sourced vim files, sometimes order matters
    source $HOME/dotfiles/nvim/external-plugins.vim

    " execute lua file
    " luafile $HOME/dotfiles/nvim/lua/statusline-galaxyline.lua
    luafile $HOME/dotfiles/nvim/lua/galaxyline-spaceline.lua
    " luafile $HOME/dotfiles/nvim/lua/galaxyline-new-evilline.lua
    " luafile $HOME/dotfiles/nvim/lua/galaxyline-eviline.lua
    luafile $HOME/dotfiles/nvim/lua/plug-colorizer.lua
    " luafile $HOME/dotfiles/nvim/lua/treesitter.lua
  endif
endif

augroup source_MYVIMRC_onSave
  autocmd BufWritePost *.vim,*.lua source $MYVIMRC
augroup end

" useful when calling hunspell spellchecker
augroup terminal_enterInInsertMode_setStatusline
  autocmd TermOpen *
        \ setlocal statusline=%{b:term_title} |
        \ startinsert
augroup end

" can also use gg=G instead of == or ={motion}
" using gg=G formatprg leaves cursor at the top of the files. Would have to jump back using ``
augroup run_formatPrg_beforeWrite
  autocmd BufWritePre * normal ==
augroup end

" Cursorhold(I) events depend on updatetime setting 
" also write change to :help undofile
" augroup autosave_onTimeout
"   autocmd CursorHold,CursorHoldI * update
" augroup end

" COC Code Formatters
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Understanding vim directory structure
" ------------------------------------------------------------------------------------------
" Whatever goes into plugin is loaded whenever vim starts whereas what you put in ftplugin
" is only loaded for the specific filetype it corresponds to (so if you have a folder there
" called python all the files there will be loaded when you open a python file. In autoload
" you should have the functions corresponding to the the scripts defined in plugin.
" The functions here will only be loaded when called by the first time.
"
" In after you should put settings that you want to change from the normal plugin loading.
" As an example suppose you like the settings that some plugin for latex gives you,
" but it redefined a mapping that you had in your .vimrc.
" You can revert this with autocommands or by putting the correct definitions in after.
"
" https://stackoverflow.com/questions/14248335/please-explain-vims-configuration-directories-hierarchy
" https://learnvimscriptthehardway.stevelosh.com/chapters/42.html


" vim Session-management
"":mksession ~/mysession.vim
"":source ~/mysession.vim
""$ vim -S ~/mysession.vim

"           +--Disable hlsearch while loading viminfo
"           | +--Remember marks for last 500 files
"           | |    +--Remember up to 10000 lines in each register
"           | |    |      +--Remember up to 1MB in each register
"           | |    |      |     +--Remember last 1000 search patterns
"           | |    |      |     |     +---Remember last 1000 commands
"           | |    |      |     |     |
"           v v    v      v     v     v
""set viminfo=h,'500,<10000,s1000,/1000,:1000
""set viminfo='1000,f1,<500  "lines, marks
"
"	I   The environment variable VIMINIT (see also |compatible-default|) (*)
"	    The value of $VIMINIT is used as an Ex command line.
"	II  The user vimrc file(s):
"		    "$HOME/.vimrc"	   (for Unix) (*)
"		    "$HOME/.vim/vimrc"	   (for Unix) (*)
"		    "s:.vimrc"		   (for Amiga) (*)
"		    "home:.vimrc"	   (for Amiga) (*)
"		    "home:vimfiles:vimrc"  (for Amiga) (*)
"		    "$VIM/.vimrc"	   (for Amiga) (*)
"		    "$HOME/_vimrc"	   (for Win32) (*)
"		    "$HOME/vimfiles/vimrc" (for Win32) (*)
"		    "$VIM/_vimrc"	   (for Win32) (*)
"		    "$HOME/config/settings/vim/vimrc"	(for Haiku) (*)
"
" RESOURCES
" https://github.com/habamax/.vim


" Use configs as .vimrc
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" path to look for plugins
" let &packpath = &runtimepath
" source ~/.vim/vimrc


" auto install vim-plug plugin manager
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif



"Plug-ins
call plug#begin('~/.config/nvim/plugged')
" Tools
    Plug 'junegunn/goyo.vim'
    Plug 'vifm/vifm.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ctrlpvim/ctrlp.vim'
" Syntax
    Plug 'tpope/vim-markdown'
    Plug 'ap/vim-css-color' "Displays a preview of colors with CSS 
    Plug 'vim-scripts/fountain.vim'
" Color-schemes
    Plug 'morhetz/gruvbox' "My favorite theme
call plug#end() 
 
colorscheme gruvbox
set background=dark


"General Settings
set encoding=UTF-8
filetype plugin indent on  "Enabling Plugin & Indent
syntax on  "Turning Syntax on
set autoread wildmode=longest,list,full
set spell spelllang=en_us
set backspace=indent,eol,start confirm
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab  
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set hls is ic
set laststatus=2 cmdheight=1
au BufRead,BufNewFile *.fountain set filetype=fountain
set splitbelow splitright 
set nobackup nowritebackup 

"Status-line
set statusline=
set statusline+=%#IncSearch#
set statusline+=\ %y
set statusline+=\ %r
set statusline+=%#CursorLineNr#
set statusline+=\ %F
set statusline+=%= "Right side settings
set statusline+=%#Search#
set statusline+=\ %l/%L
set statusline+=\ [%c]

"Key-bindings
let mapleader=" "
nnoremap <leader>n :Explore<CR>
nnoremap <leader><Space> :CtrlP<CR>
nnoremap <leader><ENTER> :Goyo<CR>
nnoremap <leader>, :vsplit ~/.config/nvim/init.vim<CR>
nnoremap <leader>g :GitGutterDisable <BAR> :set laststatus=0 <CR>
nnoremap <C-g> :set spelllang=de_de<CR>
nnoremap <C-l> :set background=light<CR>
nnoremap <C-s> :source ~/.config/nvim/init.vim<CR>

nnoremap <Up> :resize +2<CR> 
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

nnoremap Q <nop>

nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l

"Color Settings
" colorscheme gruvbox
" set background=dark cursorline
" hi clear CursorLine
" set termguicolors

hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE 

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

"Goyo settings
function! s:goyo_enter()
    set noshowmode
    set noshowcmd
    set nocursorline
    CocDisable
    Limelight
endfunction

function! s:goyo_leave()
    set showmode
    set showcmd
    set cursorline
    CocEnable
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave() 
