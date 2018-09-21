"" VUNDLE
""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'

Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
call vundle#end()
filetype plugin indent on

"" GENERAL
""""""""""

" Use the Solarized Dark theme
syntax enable
set background=dark
colorscheme solarized

set nocp " Make Vim more useful
set digraph " Enables input of special characters by a combination of two characters
set clipboard=unnamed " Use the OS clipboard by default (on versions compiled with `+clipboard`)
set wildmenu " Enhance command-line completion
set ek " Allow cursor keys in insert mode
set hid " Allows hiding buffers
set backspace=indent,eol,start " Allow backspace in insert mode
set ttyfast " Optimize for fast terminal connections
set gdefault " Add the g flag to search/replace by default
set encoding=utf-8 nobomb " Use UTF-8 without BOM
let mapleader="," " Change mapleader
set binary " Don’t add empty newlines at the end of files
set noeol " Don’t add empty newlines at the end of files
set cursorline " Highlight current line
set tabstop=2 " Make tabs as wide as two spaces
set shiftwidth=2 " Make tabs as wide as two spaces
set expandtab " Tabs as spaces
set lcs=tab:▸\ ,trail:· " Show “invisible” characters
set list " Show “invisible” characters
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches
set incsearch " Highlight dynamically as pattern is typed
set laststatus=2 " Always show status line
set statusline+=%F " Add full file path to your existing statusline
set mouse=a " Enable mouse in all modes
set noerrorbells " Disable error bells
set nostartofline " Don’t reset cursor to start of line when moving around.
set ruler " Show the cursor position
set showmode " Show the current mode
set title " Show the filename in the window titlebar
set showcmd " Show the (partial) command as it’s being typed
set scrolloff=3 " Start scrolling three lines before the horizontal window border
set ai " Automatic indentation
set shm=at " This shortens about every message to a minimum
set nowrap " Don't wrap lines
au BufReadPost *.hbs set syntax=html

set nobackup       "no backup files
set noswapfile     "no swap files

" Use relative line numbers
set number " Enable line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif

let g:ctrlp_working_path_mode = 'ra'
"Exclude files and directories using Vim's wildignore and CtrlP's own g:ctrlp_custom_ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|bower_components|dist)|(\.(swp|ico|git|svn))$'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" => Map
"""""""""""
" Change the default mapping and the default command to invoke CtrlP
let g:ctrlp_map = '<c-b>'
let g:ctrlp_cmd = 'CtrlP'

" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

"clear the search buffer with ,/
nmap <silent> ,/ :nohlsearch<CR>

:map <F3> <C-W><C-W>
iab tsup this._super(...arguments);
iab tmod this.get('model')
iab tset this.set('');<ESC>hhi
iab tget this.get('');<ESC>hhi
iab deb debugger
iab clog console.log(this, '');<ESC>hhi
