" Configurations based on Wil Thomason's init.vim 'https://github.com/wbthomason/.dotfiles/blob/linux/init.vim'

" GENERAL

set showmatch										" show matching parenthesis
set showmode                    " Show current mode down the bottom
set autoread                    " Reload files changed outside vim
set number
set background=dark
set backspace=2
set clipboard=unnamed						" copy paste with the system clipboard
set noswapfile									" ...no swap files
set hidden											" can have unwritten changes to a file and open a new file using :e, without being forced to write or undo your changes first

syntax on												" syntax highlighting

" INDENTATION

set autoindent
set smartindent									" automatically inserts one extra level of indentation in some cases
set smarttab										" affects how <TAB> key presses are interpreted depending on where the cursor is
set shiftwidth=2								" affects what happens when you press >>, << or ==
set softtabstop=2								" affects what happens when you press the <TAB> or <BS> keys
set tabstop=2										" changes the width of the TAB character

set nowrap											" Don't wrap lines
set linebreak										" Wrap lines at convenient points

" SCROLLING

set scrolloff=8									" Start scrolling at 10 lines away from margins
set sidescrolloff=15						" Same thing horizontally
set sidescroll=1

" SEARCH

set incsearch										" Find the next match as we type the search
set hlsearch										" Highlight searches by default
set ignorecase									" Ignore case when searching...
set smartcase										" ...unless we type a capitial
set paste												" makes pasting cleaner --correct indentation

set nocompatible
filetype off

" General settings
set title
set wildmenu
set tw=80
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
set expandtab
set relativenumber
set ai
set si
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set viminfo^=%

" Plugins
call plug#begin()

" Git
Plug 'tpope/vim-fugitive'

" Completion
Plug 'benekastah/neomake'
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plug 'valloric/YouCompleteMe'
Plug 'scrooloose/syntastic', {'for': ['ocaml', 'clojure', 'lua']}

" Pandoc/Markdown
Plug 'vim-pandoc/vim-pandoc', {'for': 'markdown'}
Plug 'vim-pandoc/vim-pandoc-syntax', {'for': 'markdown'}
Plug 'vim-pandoc/vim-pandoc-after', {'for': 'markdown'}

" Utilities
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-rooter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'whatyouhide/vim-gotham'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'yggdroot/indentLine'
Plug 'Shougo/unite.vim'

" Coffeescript
Plug 'kchmck/vim-coffee-script', {'for': 'coffeescript'}

" LaTeX
Plug 'lervag/vimtex', {'for': 'tex'}

Plug 'flazz/vim-colorschemes'

call plug#end()

filetype plugin indent on

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

let maplocalleader = "\<cr>"

" Eclim settings
let g:EclimCompletionMethod = 'omnifunc'

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

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" Airline settings
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" CtrlP settings
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Autocommands
au BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\ exe "normal! g`\"" |
	\ endif
au BufWinEnter * checktime
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au BufWritePost * Neomake
au BufRead * Neomake
au CompleteDone * pclose
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
au BufNewFile,BufFilePre,BufRead *.md set makeprg=make\ %:t:r
au BufNewFile,BufFilePre,BufRead *.tex set makeprg=make
au BufWritePost *.md Neomake!
au BufNewFile,BufFilePre,BufRead *.rs,Cargo.toml set makeprg=cargo\ build

" YCM Settings
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = ['re!\\[A-Za-z]*(ref|cite)[A-Za-z]*([^]]*])?{([^}]*, ?)*']
let g:ycm_semantic_triggers.markdown = ['@']

" Neomake settings
let g:neomake_cpp_clang_args = ['-std=c++14']

" IndentLine settings
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

" Pandoc settings
let g:pandoc#syntax#conceal#use = 1
let g:pandoc#after#modules#enabled = ['ultisnips']
let g:pandoc#formatting#mode = 'haA'
let g:pandoc#formatting#textwidth = 80
let g:pandoc#biblio#use_bibtool = 1
let g:pandoc#completion#bib#use_preview = 1
let g:pandoc#command#autoexec_on_writes = 0
let g:pandoc#command#autoexec_command = 'make'

" Vimtex settings
let g:tex_conceal = ""

" Ultisnips settings
let g:UltiSnipsExpandTrigger = '<c-s>'
let g:UltiSnipsJumpForwardTrigger = '<c-d>'
let g:UltiSnipsJumpBackwardTrigger = '<c-a>'

" Syntastic settings
let g:syntastic_ocaml_checkers=['merlin','caml4po']

colorscheme badwolf
