" Load and install all 3rd party plugins
"
" List all plugins loaded by vim -> cheat nvim
" :scriptnames, :commands, :functions
"
" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')

if has('nvim')
  " Language Server Protocol LSP
  " --------------------------------------------------------------------------------------------------------------------
  " Issues getting nightly neovim, luagit and tree-sitter packages
  " Plug 'nvim-treesitter/nvim-treesitter'
  " https://github.com/nvim-treesitter/nvim-treesitter/issues/700#issuecomment-736804553
  Plug 'nvim-treesitter/nvim-treesitter', { 'commit': '3c07232'}
  Plug 'nvim-treesitter/playground'

  " Intellisense
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif


" Finders and Previewers
" -------------------------------------------------------------------------------------------------------------------
" https://github.com/junegunn/fzf.vim#commands
Plug 'junegunn/fzf.vim'                                                   "god of all vim plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                       "fzf cli tool
if has('nvim')
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
endif


" Developer Tools
" ---------------------------------------------------------------------------------------------------------------------
Plug 'tpope/vim-fugitive'                                                 "git from editor
Plug 'tpope/vim-rhubarb'                                                  "fugitive suppliment
" Plug 'metakirby5/codi.vim'                                                "Interactive REPL
Plug 'liuchengxu/vim-which-key'                                           "never forget keybindings, group and organize them
Plug 'vifm/vifm.vim', { 'on':  'Vifm' }                                   "file manager, +ranger killer
Plug 'bronson/vim-visual-star-search'                                     "search url like patterns
Plug 'markonm/traces.vim'                                                 "search and replace preview
Plug 'jremmen/vim-ripgrep', { 'on':  'Rg' }                               "use rip-grep from within vim quickfix list
Plug 'mhinz/vim-startify'                                                 "fancy start screen
Plug 'SirVer/ultisnips'                                                   "vscode like snippets manager
" Code Formatter - coc-prettier

" auto code format on save https://github.com/neoclide
Plug 'dbeniamine/cheat.sh-vim'                                            "https://github.com/dbeniamine/cheat.sh-vim
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'                                                "https://github.com/mhinz/vim-signify
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }                        "show git diff in gutters
endif

" vim Polyfills
if !has('nvim')
  Plug 'rhysd/vim-healthcheck'                                            ":Healthcheck from neovim
  Plug 'vim-airline/vim-airline'                                          "statusline
  Plug 'vim-airline/vim-airline-themes'                                   "vim-airline suppliment
endif


" Themes and Statusline
" ---------------------------------------------------------------------------------------------------------------------
Plug 'morhetz/gruvbox'                                                    "dark/light mode
Plug 'Iron-E/nvim-highlite'                                               "used by a galaxyline statusline file
if has('nvim')
  Plug 'glepnir/galaxyline.nvim'                                          "statusline plugin on steroids
  Plug 'norcalli/nvim-colorizer.lua'                                      "Fastest colorizer with no external dependency
  Plug 'kyazdani42/nvim-web-devicons'
endif


" Live Previews
" ---------------------------------------------------------------------------------------------------------------------
" https://github.com/iamcco/markdown-preview.nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }


" Experimental and Bleeding edge
" ---------------------------------------------------------------------------------------------------------------------
" Plug 'vim/killersheep'                                                    "vim popup()
" Plug 'AndrewRadev/quickpeek.vim'                                          "expand items in popup from quickfix window
" Plug 'ThePrimeagen/vim-be-good'
" One man should not have that much power
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }         "use neovim and autocompletion in browser
" Plug 'voldikss/vim-floaterm'                                            "Floating window terminal

call plug#end()

augroup install_missing_plugins_onStartup
  autocmd VimEnter *
        \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
        \|   PlugInstall --sync | q
        \| endif
augroup end
