" General
set number      	      " Show line numbers
set showmatch   	      " Highlight matching brace
set autoindent  	      " Auto-indent new lines
set expandtab   	      " Use spaces instead of tabs
set shiftwidth=4	      " Number of auto-indent spaces
set softtabstop=4	      " Number of spaces per Tab
set smartindent               " apparently mostly does the right thing
set undolevels=10	      " Number of undo levels
set incsearch                 " start searching while typing
set hlsearch                  " highlight search results
syntax on
set ignorecase


" powerline config
" set rtp+=/usr/share/powerline/bindings/vim
" set encoding=utf-8
" set t_Co=256
" set laststatus=2
" set noshowmode


" key mappings
let mapleader = ","
map <leader>s :split <CR>
noremap <leader>w :w <CR>
noremap <leader><Esc> :let @/ = "" <CR>


" plugins
call plug#begin()
Plug 'wincent/command-t'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'chriskempson/base16-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


" folding:
" folding level 0: zM
" substract level: zm
" folding level max: zR
" add level: zr
" open fold: zo
" close fold zc


" copy & pase from to system clipboard
" the system clipboard register is "+
" using "+y while having text selected in visual mode puts the text into the clipboard
" using "+p pastes the clipboard into vim


" coc.vim confie
source ~/.vimrc_coc


" set base16 theme
if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif


" change Visual mode highlighting behaviour to make it actually visible
:highlight Visual cterm=reverse ctermbg=NONE
