set nocompatible
filetype plugin indent on

" Use 256 colors
set t_Co=256
" Turn on line numbers
set number
" Make line numbers relative to the current line of the cursor so it's easier
" to perform block operations relative to the current line.
set relativenumber
" Syntax highlighting. No colors per Rob Pike
syntax off
" change the default window split order
set splitright splitbelow
" Spell check
set nospell
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
" Auto write files when changing when multiple files open
set autowrite
" A set of patterns to ignore when expanding wildcards
set wildignore+=*.swp,*.bak,*.pyc,*.class,*.o,*.a
" By default use 4 character tabs on screen. But to not expand tabs to spaces.
" Tab expansion should be done per filetype instead.
set tabstop=4
set softtabstop=4
set shiftwidth=4
" Change <Leader> to , so it's more easily accessible
let mapleader=","
if has('macunix')
	" ensure  that backspace works for eol and when vim adds auto identation.
	" this is broken in macs
	set backspace=indent,eol,start
endif

" make sure ruler is on and show something useful.
set ruler
set ruf=%30(%=%#LineNr#%.50F\ [%{strlen(&ft)?&ft:'none'}]\ %l:%c\ %p%%%)

"""
""" Keyboard mappings
"""
" toggle spell check with F12
map <F12> :set spell!<CR>


" read personal/private vim configuration (keep last to override)
set rtp^=~/.vimpersonal
set rtp^=~/.vimprivate
set rtp^=~/.vimwork
