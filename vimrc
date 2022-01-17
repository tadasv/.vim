" set nocompatible
" filetype plugin indent off
"
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
""" configure vim-lsp plugin
"""
if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go'],
        \ })
    autocmd BufWritePre *.go LspDocumentFormatSync
endif

if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript', 'typescript.tsx', 'typescriptreact'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
