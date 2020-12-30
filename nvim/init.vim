"  @avimehenwal | 2020
"                __     ___           
"  _ __   ___  __\ \   / (_)_ __ ___  
" | '_ \ / _ \/ _ \ \ / /| | '_ ` _ \ 
" | | | |  __/ (_) \ V / | | | | | | |
" |_| |_|\___|\___/ \_/  |_|_| |_| |_|
"                                     
" https://github.com/ChristianChiarulli/nvim

source $HOME/dotfiles/nvim/nvim-plugins.vim
source $HOME/dotfiles/nvim/settings.vim
source $HOME/dotfiles/nvim/key/mappings.vim
source $HOME/dotfiles/nvim/key/which-key.vim

" use neovim with vscode
if exists('g:vscode')
	source $HOME/.config/nvim/vscode/settings.vim
else
	" TUI based config
	if (has('termguicolors'))
		set termguicolors
	endif
	" execute lua file
	luafile $HOME/dotfiles/nvim/lua/nvcodeline.lua
	luafile /home/avi/dotfiles/nvim/lua/plug-colorizer.lua
	luafile /home/avi/dotfiles/nvim/lua/treesitter.lua


endif

" Add paths to node and python here
" if !empty(glob("~/.config/nvim/paths.vim"))
"   source $HOME/.config/nvim/paths.vim
" endif

" Use configs as .vimrc
" set runtimepath^=~/.vim runtimepath+=~/.vim/after

" path to look for plugins
" let &packpath = &runtimepath
" 
" source ~/.vim/vimrc
