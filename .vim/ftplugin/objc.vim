set expandtab
set tabstop=4
set shiftwidth=4

" yashigani keymappings
noremap <C-l> <C-u>:ListMethods<CR>

" desable default snippet
let g:neocomplcache_snippets_disable_runtime_snippets = 1

"" ( で今いるブロックを確認
"" http://subtech.g.hatena.ne.jp/motemen/20110817/1313577108
"nnoremap <buffer> <silent> ( :<C-U>call PreviewOpenBrace()<CR>
"
"if !exists('*PreviewOpenBrace')
"    function PreviewOpenBrace()
"        let l:pos = getpos('.')
"        if l:pos == get(s:, 'last_pos', [])
"            let l:count = s:last_count + 1
"        else
"            let l:count = v:count1
"        endif
"        pclose
"        pedit
"        wincmd p
"        execute 'normal!' l:count . '[{'
"        setlocal cursorline
"        wincmd p
"        let s:last_count = l:count
"        let s:last_pos   = l:pos
"    endfunction
"endif

