set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "comments"

" First set Normal to regular white on black text colors:
"hi Normal ctermfg=Yellow
hi Normal ctermfg=Yellow ctermbg=Black
"hi Normal ctermfg=Yellow ctermbg=Black guifg=#dddddd guibg=Black

" Syntax highlighting (other color-groups using default, see :help group-name):
hi Comment    cterm=NONE ctermfg=Brown
hi Constant   cterm=NONE ctermfg=Yellow
hi Identifier cterm=NONE ctermfg=Yellow
hi Function   cterm=NONE ctermfg=Yellow
hi Statement  cterm=NONE ctermfg=Yellow
hi PreProc    cterm=NONE ctermfg=Yellow
hi Type	      cterm=NONE ctermfg=Yellow
hi Special    cterm=NONE ctermfg=Yellow
hi Delimiter  cterm=NONE ctermfg=Yellow
