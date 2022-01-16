" filetype plugin indent off
" packloadall
filetype plugin indent on

" Use 256 colors
set t_Co=256
" Turn on line numbers
set number
" Make line numbers relative to the current line of the cursor so it's easier
" to perform block operations relative to the current line.
set relativenumber
" Turn on syntax highlighting
syntax on
" change the default window split order
set splitright splitbelow
" Enable spell check
set spell
" Where to place temporary swap files. Make sure that these directories exists
" and are only accessible by the current user.
set directory=~/.vim/swap,~/tmp
" all folds are open by default
set nofoldenable
" Number of commands to keep in the history table
set history=1000
" Automatically indent when in insert mode
set autoindent
set smartindent
" A set of patterns to ignore when expanding wildcards
set wildignore+=*.swp,*.bak,*.pyc,*.class,*.o,*.a
" By default use 4 character tabs on screen. But to not expand tabs to spaces.
" Tab expansion should be done per filetype instead.
set tabstop=4
set softtabstop=4
set shiftwidth=4
" Change <Leader> to , so it's more easily accessible
let mapleader=","



"""
""" configure vim-lsc plugin
"""
let g:lsc_server_commands = {'go': 'gopls'}
