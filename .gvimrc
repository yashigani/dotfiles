colorscheme jellybeans

if has('gui_macvim')
    set transparency=10
    set antialias
    set guioptions-=t
    set guioptions-=T
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L

    set antialias
    set imdisable " IME 無効化
endif

"augroup transparency
"  autocmd!
"  if has('mac')
"    autocmd FocusGained * set transparency=10
"    autocmd FocusLost * set transparency=50
"  endif
"augroup END

set columns=160
set lines=100
