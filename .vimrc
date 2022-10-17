" Initialization -------------------------------- {{{1
filetype plugin indent on
syntax on

call plug#begin('~/.vim/plugged')

" Plugins --------------------------------------- {{{1

" Colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'ujihisa/unite-colorscheme'

" The rest
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'lervag/vimtex'
Plug 'junegunn/goyo.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-scripts/Vimchant'
Plug 'vim-scripts/netrw.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'wavded/vim-stylus'
Plug 'adamclerk/vim-razor'

call plug#end()

" Colors & UI ----------------------------------- {{{1
set background=dark

" Local dirs
set backupdir=~/.vimtmp
set directory=~/.vimtmp
set undodir=~/.vimtmp

" Set some junk --------------------------------- {{{1
set path+=**
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set autoindent " Copy indent from last line when starting new line.
set backspace=indent,eol,start
set belloff=all " Disable error bells
set cursorline " Highlight current line
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set encoding=utf-8 nobomb " BOM often causes trouble
set foldmethod=marker
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set gdefault " By default add g flag to search/replace. Add g to toggle.
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set history=1000 " Increase history from 20 default to 1000
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches.
set incsearch " Highlight dynamically as pattern is typed.
set infercase " When doing keyword completion in insert mode, case is adjusted depending on the typed text
set laststatus=2 " Always show status line
set magic " Enable extended regexes.
set mouse=a " Enable mouse in all modes.
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command.
set nostartofline " Don't reset cursor to start of line when moving around.
set nowrap " Do not wrap lines.
set nu " Enable line numbers.
set ofu=syntaxcomplete#Complete " Set omni-completion method.
set report=0 " Show all changes.
set ruler " Show the cursor position
set scrolloff=3 " Start scrolling three lines before horizontal border of window.
set shortmess=atI " Don't show the intro message when starting vim.
set showmode " Show the current mode.
set showtabline=2 " Always show tab bar.
set sidescrolloff=3 " Start scrolling three columns before vertical border of window.
set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters.
set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set title " Show the filename in the window titlebar.
set ttyfast " Send more characters at a given time.
set ttymouse=xterm " Set mouse type to xterm.
set undofile " Persistent Undo.
set wildchar=<TAB> " Character for CLI expansion (TAB-completion).
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/smarty/*,*/vendor/*,*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*
set wildmenu " Hitting TAB in command mode will show possible completions above command line.
set wildmode=list:longest " Complete only until point of ambiguity.
set winminheight=0 "Allow splits to be reduced to a single line.
set wrapscan " Searches wrap around end of file

" Word wrap, don't wrap in the middle of a word
set wrap
set lbr

" Key bindings ---------------------------------- {{{1
" Change mapleader
let mapleader=","
let maplocalleader=","

" Map command mode colon to ö and ;
nnoremap ö :
nnoremap Ö :
nnoremap ; :
vnoremap ö :
vnoremap Ö :
vnoremap ; :

" Switch buffers with gb and gB
nnoremap gb :bnext<CR>
nnoremap gB :bprev<CR>

" Exit to normal mode with jj
imap jj <ESC>

" Speed up viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Code folding
nnoremap <Space><Space> za " Toggle folds with space

" Faster split resizing (+,-)
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Sudo write (,W)
noremap <leader>W :w !sudo tee %<CR>

" Better mark jumping (line + col)
nnoremap ' `

" Toggle show tabs and trailing spaces (,c)
set lcs=tab:›\ ,trail:·,eol:¬,nbsp:_
set fcs=fold:-
nnoremap <silent> <leader>c :set nolist!<CR>

" Clear last search (,qs)
map <silent> <leader>qs <Esc>:noh<CR>
" map <silent> <leader>qs <Esc>:let @/ = ""<CR>

" Remap keys for auto-completion, disable arrow keys
inoremap <expr>  <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr>  <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr>  <Down>     pumvisible() ? "\<C-n>" : "\<NOP>"
inoremap <expr>  <Up>       pumvisible() ? "\<C-p>" : "\<NOP>"
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" Paste toggle (,p)
set pastetoggle=<leader>P
map <leader>P :set invpaste paste?<CR>

" Buffer navigation (,,) (,]) (,[) (,ls)
map <Leader>, <C-^>
map <Leader>] :bnext<CR>
map <Leader>[ :bprev<CR>
map <Leader>ls :buffers<CR>

" Close Quickfix window (,qq)
map <leader>qq :cclose<CR>

" Yank from cursor to end of line
nnoremap Y y$

" Insert newline
map <leader><Enter> o<ESC>

" Search and replace word under cursor (,*)
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>

" Join lines and restore cursor location (J)
nnoremap J mjJ`j

" Fix page up and down
map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>

" Shift+Space to show omnicomplete list
inoremap <C-O> <C-X><C-O>


" Restore cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Set relative line numbers
set relativenumber " Use relative line numbers. Current line is still in status bar.
au BufReadPost,BufNewFile * set relativenumber

" File extensions ------------------------------- {{{1

" JSON
au BufRead,BufNewFile *.json set ft=json syntax=javascript

" Common Ruby files
au BufRead,BufNewFile Rakefile,Capfile,Gemfile,.autotest,.irbrc,*.treetop,*.tt set ft=ruby syntax=ruby

" Coffee Folding
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

" ZSH
au BufRead,BufNewFile .zsh_rc,.functions,.commonrc set ft=zsh

" Plugin configuration -------------------------- {{{1

" powerline
if system('command -v powerline-daemon') != ''
    let g:powerline_pycmd="python3"
    let g:powerline_pyeval="py3eval"
    let g:Powerline_symbols = 'fancy'
    python3 from powerline.vim import setup as powerline_setup
    python3 powerline_setup()
    python3 del powerline_setup
endif

" NERDTree-like netrw
let g:netrw_banner=0
let g:netrw_altfile=1 " C-^ (also bound to ,,) ignores netrw and returns to previous actual buffer
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw_browse_split=4 " 0: same window 1: split 2: vsplit 3: new tab 4: prev. window
map <Leader>n :Vexplore .<CR>

" vim-latex
let g:vimtex_latexmk_build_dir='build'
let g:vimtex_latexmk_options='-shell-escape -pdf'
let g:vimtex_view_method='general'

" Fugitive
map <Leader>gst :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gd :Gdiff<CR>

" Vimchant: Finnish spell checking
"let g:vimchant_spellcheck_lang = 'fi'
"set updatetime=1000 " time to write the swap file to disk, also vimchant update interval

" fzf.vim
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

nnoremap <Leader>f :GFiles<CR>
nnoremap <C-f> :GFiles<CR>
nnoremap <Leader>g :GGrep<CR>
nnoremap <C-g> :GGrep<CR>
