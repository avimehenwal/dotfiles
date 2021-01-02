"  @avimehenwal | 2020
"                __     ___
"  _ __   ___  __\ \   / (_)_ __ ___
" | '_ \ / _ \/ _ \ \ / /| | '_ ` _ \
" | | | |  __/ (_) \ V / | | | | | | |
" |_| |_|\___|\___/ \_/  |_|_| |_| |_|
"
" Don't seek mastery, seek proficiency
"
" start vim with zero configuration
" -N              									Not fully Vi compatible: 'nocompatible'
" -u <vimrc>      									Use <vimrc> instead of any .vimrc
" vi -Nu NORC <filepath>
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
" Try to keep initial vim bootup Language agnostic
" All FileType specific configs go either into ftplugin dir or autocommands
"
" linter Tools :retab
" BootConfig: runtimepath
set rtp+=$HOME/.fzf/bin/fzf

" Project specific .vimrc files
" https://superuser.com/questions/532593/how-do-i-get-vim-to-automatically-load-vimrc-config-from-the-current-directory
set exrc
" set secure


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
    luafile $HOME/dotfiles/nvim/lua/treesitter.lua
  endif
endif

augroup source_MYVIMRC_onSave
  autocmd BufWritePost *.vim,*.lua source $MYVIMRC
augroup end

" COC Code Formatters
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile)

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
