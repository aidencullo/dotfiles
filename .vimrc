" GENERAL

set showmatch										"show matching parenthesis
set showmode                    "Show current mode down the bottom
set autoread                    "Reload files changed outside vim
set number
set background=dark
set backspace=2
set clipboard=unnamed						"copy paste with the system clipboard
set noswapfile									"...no swap files
set hidden											"can have unwritten changes to a file and open a new file using :e, without being forced to write or undo your changes first

syntax on												"syntax highlighting


" INDENTATION

set autoindent
set smartindent									"automatically inserts one extra level of indentation in some cases
set smarttab										"affects how <TAB> key presses are interpreted depending on where the cursor is
set shiftwidth=2								"affects what happens when you press >>, << or ==
set softtabstop=2								"affects what happens when you press the <TAB> or <BS> keys
set tabstop=2										"changes the width of the TAB character

set nowrap											"Don't wrap lines
set linebreak										"Wrap lines at convenient points

" SCROLLING

set scrolloff=8									"Start scrolling at 10 lines away from margins
set sidescrolloff=15						"Same thing horizontally
set sidescroll=1

" SEARCH

set incsearch										" Find the next match as we type the search
set hlsearch										" Highlight searches by default
set ignorecase									" Ignore case when searching...
set smartcase										" ...unless we type a capitial
