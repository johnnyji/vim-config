" Installs vim-plug if not already exists
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" " Enable Pathogen
" execute pathogen#infect()
" syntax on

" " Enable filetype plugins
" filetype plugin on
" filetype indent on

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Run :PlugInstall in VIM whenever a plug is added/removed
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'elixir-editors/vim-elixir'
Plug 'ervandew/supertab'
Plug 'gabrielelana/vim-markdown'
Plug 'garbas/vim-snipmate'
Plug 'hail2u/vim-css3-syntax'
Plug 'heavenshell/vim-jsdoc'
Plug 'honza/vim-snippets'
" Fuzzy find
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'mhinz/vim-mix-format'
Plug 'mileszs/ack.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" TS syntax
Plug 'leafgarland/typescript-vim'
" JavaScript support
Plug 'pangloss/vim-javascript'
" JS and JSX syntax
Plug 'maxmellon/vim-jsx-pretty'
" GQL syntax
Plug 'jparise/vim-graphql'
Plug 'prettier/vim-prettier'
Plug 'sbdchd/neoformat'
" File tree structure
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tlib_vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'

" Initialize plugin system
call plug#end()

" Set to auto read when a file is changed from the outside
set autoread


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface
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

" Increases the redraw time so syntax highlighting does not
" dissapear on larger files
set redrawtime=10000

" Enables HTML/CSS syntax highlighting in JS files
let javascript_enable_domhtmlcss=1

" Enables JSX Syntax highlighting and indentation
let g:jsx_ext_required = 0

" Enables TSX Syntax highlighting and indentation
autocmd BufNewFile,BufRead *.tsx set filetype=typescript

" Uses the Hybrid Material Syntax for VIM
colorscheme hybrid_material
set background=dark

" Enables 256 colors in VIM
set t_Co=256

" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions+=e
  set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Sets default font size to 20px
set guifont=Monaco:h20


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
set expandtab

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
" => Ack Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" If Ag is present, it will override Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Makes sure we don't automatically open the first result returned by Ack
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets up fzf.vim
" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

" Uses FF in the prompt to launch FZF
:command FF FZF

" Jumps to existing window if possible
let g:fzf_buffers_jump = 1

let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-i': 'split',
			\ 'ctrl-s': 'vsplit'
			\ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Closes VIM if the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NOTE: Disabled to prefer to launch FZF at launch instead
" " Auto enters NERDTree if VIM is launched with no file specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Maps the command :NT to :NERDTree
:command NT NERDTree

" Shows hidden files like .gitignore
let NERDTreeShowHidden = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CSS3 Syntax Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fixes properties that don't highlight properly
augroup VimCSS3Syntax
	autocmd!

	autocmd FileType css setlocal iskeyword+=-
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Allows ESLint to autogenerate error in VIM on save
let g:ale_fixers = {
 \ 'javascript': ['prettier', 'eslint'],
 \ 'typescript': ['prettier', 'eslint']
 \ }
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1
let g:ale_typescript_prettier_use_local_config = 1
let g:ale_linters_explicit = 1
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Prettier Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically runs prettier on save
autocmd BufWritePre *.js Prettier
autocmd BufWritePre *.jsx Prettier
autocmd BufWritePre *.ts Prettier
autocmd BufWritePre *.tsx Prettier

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show tabs at the top
let g:airline#extensions#tabline#enabled = 1
" Use hybrid theme
let g:airline_theme = "bubblegum"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-mix-format Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Auto formats `mix format` on save
let g:mix_format_on_save = 1
" Change error stack trace to single line on the VIM bar instead of a seperate window
let g:mix_format_silent_errors = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-javascript Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enables JSDocs highlighting
let g:javascript_plugin_jsdoc = 1
" Enables Flow highlighting
let g:javascript_plugin_flow = 1
" " Conceal characters
" set conceallevel=1
" let g:javascript_conceal_function = "ƒ"
" let g:javascript_conceal_arrow_function = "⇒"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CoC Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" https://pragmaticpineapple.com/ultimate-vim-typescript-setup/
" Run `:CocInstall coc-tsserver` to install TypeScript support for CoC
let g:coc_global_extensions = ['coc-tsserver']

" Allows tsserver to recognize TSX and JSX files properly in order to not
" falsely report TSX errors
"
" https://www.reddit.com/r/neovim/comments/it6xe5/coctsserver_reports_a_lot_of_errors_in_tsx_files/
augroup ReactFiletypes
  autocmd!
  autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact
  autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
augroup END
