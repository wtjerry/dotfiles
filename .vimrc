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
set rtp+=/usr/share/powerline/bindings/vim
set encoding=utf-8
set t_Co=256
set laststatus=2
set noshowmode


" key mappings
let mapleader = ","
map <leader>s :split <CR>
noremap <leader>w <C-W>


" plugins
call plug#begin()
Plug 'wincent/command-t'
Plug 'Valloric/YouCompleteMe'
call plug#end()


" youCompleteMe config
let g:ycm_python_binary_path = '/usr/bin/python3'
