" General

set showmatch       " show matching parenthesis
set showmode                    " Show current mode down the bottom
set autoread                    " Reload files changed outside vim
set number
set background=dark
set backspace=2
set clipboard=unnamed " copy paste with the system clipboard
set noswapfile " ...no swap files
set hidden " can have unwritten changes to a file and open a new file using :e, without being forced to write or undo your changes first

syntax on " syntax highlighting

" INDENTATION

set autoindent
set cindent   " This turns on C style indentation. Each new line will be automatically indented the correct amount according to the C indentation standard.
set smartindent " automatically inserts one extra level of indentation in some cases
set smarttab " affects how <TAB> key presses are interpreted depending on where the cursor is
set shiftwidth=4 "affects what happens when you press >>, << or ==
set softtabstop=4 " affects what happens when you press the <TAB> or <BS> keys
set tabstop=4 " changes the width of the TAB character

set nowrap " Don't wrap lines
set linebreak " Wrap lines at convenient points

" SCROLLING

set scrolloff=8 " Start scrolling at 10 lines away from margins
set sidescrolloff=10 " Same thing horizontally
set sidescroll=1

" SEARCH

set incsearch " Find the next match as we type the search
set hlsearch " Highlight searches by default
set ignorecase " Ignore case when searching...
set smartcase " ...unless we type a capitial
set paste " makes pasting cleaner --correct indentation

set nocompatible
filetype on

" General settings
set title
set wildmenu
set tw=100
set formatoptions+=t
set so=7
set wildignore=*.o,*~,*.pyc
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set lazyredraw
set magic
set noerrorbells
set novisualbell
set background=dark
set relativenumber
set ai
set si
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set viminfo^=%

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Git
Plugin 'tpope/vim-fugitive'

" Completion
Plugin 'benekastah/neomake'
Plugin 'scrooloose/syntastic', {'for': ['ocaml', 'clojure', 'lua']}

" Plugin 'SirVer/ultisnips'
Plugin 'airblade/vim-rooter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'easymotion/vim-easymotion'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'whatyouhide/vim-gotham'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'yggdroot/indentLine'
Plugin 'Shougo/unite.vim'

" Coffeescript
Plugin 'kchmck/vim-coffee-script', {'for': 'coffeescript'}

" LaTeX
Plugin 'lervag/vimtex', {'for': 'tex'}

" colorschemes
Plugin 'flazz/vim-colorschemes'

if v:version > 704
    Plugin 'sirver/UltiSnips'
    Plugin 'Valloric/YouCompleteMe'
	Plugin 'rdnetto/YCM-Generator', {'branch': 'stable'}
	" Pandoc/Markdown
	Plugin 'vim-pandoc/vim-pandoc', {'for': 'markdown'}
	Plugin 'vim-pandoc/vim-pandoc-syntax', {'for': 'markdown'}
	Plugin 'vim-pandoc/vim-pandoc-after', {'for': 'markdown'}
 endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Custom sequence bindings
let mapleader = "\<space>"
nnoremap <Leader>hh :nohl<CR>
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>g :bn<CR>
nnoremap <Leader>t :bp<CR>
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>m :Neomake!<CR>
nnoremap <Leader>e :enew<CR>:CtrlP<CR>
nnoremap <leader>f 1z=
nnoremap <leader>s :set spell!

" Move selected block up/down in Visual block mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Rainbow parens settings
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" Airline settings
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" Ignore unneccesary warning in vimtex
let g:vimtex_echo_ignore_wait = 1

" IndentLine settings
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

" Autosave to disk
let g:auto_save = 1

colorscheme badwolf
highlight LineNr ctermfg=green
highlight LineNr ctermbg=blue

" gets rid of trailing whitespace
:command Trsp :%s/\s\+$//

set bg=light
