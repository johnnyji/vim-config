"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable Pathogen
execute pathogen#infect()
syntax on

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn of copy/paste from outside of VIM
set clipboard=unnamed

" Turn on the WiLd menu
set wildmenu

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Unsets the 'last search highlight' by hitting return
nnoremap <CR> :noh<CR><CR>

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" Enables HTML/CSS syntax highlighting in JS files
let javascript_enable_domhtmlcss=1

" Enables JSX Syntax highlighting and indentation
let g:jsx_ext_required = 0

" Uses the Hybrid Material Syntax for VIM
colorscheme hybrid_material
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Sets default font size to 16px
set guifont=Monaco:h16


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
" `expandtab` when using personal, `noexpandtab` when using Cumul8
set expandtab
" set noexpandtab

" Be smart when using tabs ;)
set smarttab

" `tabstop` controls how many columns each tab visually takes up
" `shiftwidth` controls how many columns content is indented per `Tab`

set shiftwidth=2
set tabstop=2

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set breakindent "Line wrap respects indentation


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NOTE: If <C-h> is broken in Neovim, see: https://github.com/neovim/neovim/wiki/FAQ#my-ctrl-h-mapping-doesnt-work
" Allows moving around windows to be like regular VIM nav with Ctrl pressed down 
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2

" Show line number
set number


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap VIM 0 to first non-blank character
map 0 ^


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Closes VIM if the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Auto enters NERDTree if VIM is launched with no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Maps the command :NT to :NERDTree
:command NT NERDTree


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim CSS3 Syntax  Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fixes properties that don't highlight properly
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let NERDTreeShowHidden = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
autocmd FileType javascript let b:syntastic_checkers = findfile('.eslintrc', '.;') != '' ? ['eslint'] : ['standard']


