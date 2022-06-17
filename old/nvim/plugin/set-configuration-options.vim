"           _                      __ _       
"  ___  ___| |_    ___ ___  _ __  / _(_) __ _ 
" / __|/ _ \ __|  / __/ _ \| '_ \| |_| |/ _` |
" \__ \  __/ |_  | (_| (_) | | | |  _| | (_| |
" |___/\___|\__|  \___\___/|_| |_|_| |_|\__, |
"                                       |___/ 
"   ___  _ __ | |_(_) ___  _ __  ___ 
"  / _ \| '_ \| __| |/ _ \| '_ \/ __|
" | (_) | |_) | |_| | (_) | | | \__ \
"  \___/| .__/ \__|_|\___/|_| |_|___/
"       |_|                          
"
" vim global set configurations
" use setlocal and bufferlocal, windowlocal options to set locally

if has('autocmd')
  filetype plugin indent on 					"filetype detection:ON  plugin:ON  indent:ON
  set backspace=start,eol,indent			"make backspace work in Insert Mode
  set bs=2                            "makes backspace behave like normal again
  set hidden												  "hide a unsaved buffer instead of showing warning
  set noswapfile											"only useful in multi-user systems
  set updatetime=4000                 "ms automatically write swaps to disk
  set autowrite                       "Automatically save before commands like :next and :make

  " Unicode Encoding
  set encoding=utf-8                  " set encoding for editor itself
  set fileencoding=utf-8              " The encoding written to file buffer
  scriptencoding utf-8                " encoding used in vimscript, else vimlint will complain

  " https://vi.stackexchange.com/questions/74/is-it-possible-to-make-vim-auto-save-files
  set undofile                        "save local buffer undotree changes in file. Auto-save file alternative
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" do not make VIM compatible with VI. Might have undesired side-effects
" like- no undo file, no search highlights, no filetype and expandtab etc.
" set nocompatible           " -N switch

" Preferences
set history=5000
set showcmd
set nojoinspaces
set complete-=t
set foldmethod=manual

" set listchars=tab:▸\ ,eol:¬
set foldlevelstart=99
set number relativenumber             "relative numbering from cursor
set title                             "set title of vim window to filename

" Real programmers don't use TABs but spaces
set autoindent         "copy indent to next line when <CR>
set smartindent        "strict indent rules for C-like files
set smartcase          "used with search patterns from / ? n N :g :s only

" search and sort
" Grepping and searching. Use :vimgrep for quickfix
set path+=**                          "inbuild fuzzy search at path root
set incsearch					                "realtime incremental search as we type
set hlsearch 						              "highlight search
set ignorecase
set smartcase           						  "ignores ignorecase
" set cindent						                "indent C code
set tagstack                          "start storing tags on tagstack

" https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces#:~:text=Always%20keep%20'tabstop'%20at%208,4%20(or%203)%20characters.
set tabstop=2 shiftwidth=2 softtabstop=0 smarttab expandtab
setlocal textwidth=120

set wildmenu           " visual autocomplete for command menu
set lazyredraw         " redraw only when needed. Faster macros
""set showmatch          " highlight matching [{()}]
set mouse=a
set cursorline          "show cursor line in normal mode

set shortmess+=I       " disable intro splash
if !&scrolloff
  set scrolloff=1      " scrollon
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline  " :help 'display'
" displaying whitespaces and tabs at the end

" make mouse functions like split resize work with alakritty
" doesnt work with nvim
if has('mouse') && !has('nvim')
  set ttymouse=sgr
endif

" -------------------------------------------------------------------------------------------
" Build Tools and compilers for quickfix
" NOTE: setting it here overrides the makeprg in project specific .vimrc files
" set makeprg=make
" latex gcc npm \run \lint python haml
" could be updated by plugin for a specific project

" -------------------------------------------------------------------------------------------
" DO NOT UNCOMMENT THIS LINE-causes unpleasent highlights
set thesaurus+=~/Documents/thesaurus    "Add thesaurus file for ^X^T
set dictionary+=~/Documents/dictionary  "Add dictionary file for ^X^K


" ---------------------------------------------------------------------------------
set iskeyword+=-                      	" treat dash separated words as a word text object"
set formatoptions-=cro                  " Stop newline continution of comments

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set whichwrap+=<,>,[,],h,l
set pumheight=10                        " Makes popup menu smaller
set ruler              			            " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set laststatus=2                        " Always display the status line
set number                              " Line numbers
set relativenumber                      " Relative Numbering for quick jumping movements
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
set timeoutlen=100                      " By default timeoutlen is 1000 ms, used by which-key
set clipboard=unnamedplus               " Copy paste between vim and everything else
set incsearch
set guifont=JetBrainsMono\ Nerd\ Font

" New stuff
" set notimeout nottimeout
" set scrolloff=1
" set sidescroll=1
" set sidescrolloff=1
" set display+=lastline
" set backspace=eol,start,indent
" set nostartofline
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set mmp=1300
" set autochdir                           " Your working directory will always be the same as your working directory
" set foldcolumn=2                        " Folding abilities

" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" You can't stop me
cmap w!! w !sudo tee %

set shellcmdflag=-c                      " donot changes, messes up the icons in galaxyline
set autoread                             " automatically ready changes in files when changed outside of vim 


