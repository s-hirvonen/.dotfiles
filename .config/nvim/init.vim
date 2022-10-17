call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'gruvbox-community/gruvbox'
Plug 'folke/tokyonight.nvim'

call plug#end()

colorscheme tokyonight

set exrc
set guicursor=
set relativenumber
set number
set nohlsearch
set hidden
set noerrorbells
set expandtab
set tabstop=4 
set softtabstop=4
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undo
set undofile
set incsearch
set termguicolors
set scrolloff=8
set signcolumn=yes
set colorcolumn=120
set completeopt=menuone,noinsert,noselect
set updatetime=50
set cursorline

nnoremap <Space> <Nop>
let mapleader=" "

inoremap jj <ESC>
nnoremap <leader>w :w<Enter>

