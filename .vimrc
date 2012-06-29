" for Vundle
filetype off
set rtp+=~/.vim/vundle.git
call vundle#rc()

Bundle 'https://github.com/Shougo/unite.vim'
Bundle 'https://github.com/Shougo/vimfiler.git'
Bundle 'https://github.com/Shougo/neocomplcache'
Bundle 'https://github.com/Shougo/neocomplcache-snippets-complete'
Bundle 'http://github.com/Shougo/vimproc'
Bundle 'https://github.com/tacroe/unite-mark.git'
Bundle 'surround.vim'
Bundle 'cocoa.vim'
"Bundle 'minibufexpl.vim'
Bundle 'Align'
Bundle 'quickrun'
Bundle 'ref.vim'
Bundle 'JSON.vim'
Bundle 'IndentAnything'
Bundle 'Javascript-Indentation'
Bundle 'smartchr'
"Bundle 'https://github.com/tyru/eskk.vim.git'
"Bundle 'https://github.com/mattn/hahhah-vim.git'
Bundle 'https://github.com/koron/u-nya-vim.git'
Bundle 'https://github.com/thinca/vim-qfreplace.git'
Bundle 'https://github.com/nanotech/jellybeans.vim'

filetype plugin indent on

set number
set smartindent
set visualbell
syntax enable
filetype plugin indent on

" タブの左側にカーソル表示
"set listchars=tab:\ \
set list
set listchars=tab:>-,eol:$

set textwidth=0                 " 一行に長い文章を書いていても自動折り返しをしない
set nobackup                    " バックアップを取らない
set autoread                    " 他で更新されたら自動で読み直す
set noswapfile                  " swap を作らない
set formatoptions=lmoq          " テキスト整形オプション，マルチバイト系を追加
set showmode                    " 現在のモードを表示する
set scrolloff=3                 " スクロール時の余白確保

set clipboard+=unnamed          " os のクリップボードを使用できるようにする

" Ev / Rv で .vimrc の編集と source
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC

" 保存時に行末の空白を除去する
"autocmd bufwritepre * :%s/\s\+$//ge
"" 保存時にtabをスペースに変換する
"autocmd bufwritepre * :%s/\t/  /ge

" 検索系
set ignorecase
set smartcase
set wrapscan
set hlsearch
" 検索結果をハイライト表示にする
set hlsearch

" タブの代わりに空白文字を挿入
set expandtab
" 自動インデントの空白を 4 に
set tabstop=4
set shiftwidth=4

" indent, 改行, 元からある文字列をバックスペース
set backspace=eol,indent,start

" カーソルの位置を表示
set ruler
" カーソル行を強調
set cursorline

augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup end

:hi clear cursorline
:hi cursorline gui=underline
" 強調はアンダーラインを消してハイライトに
highlight cursorline cterm=none ctermbg=lightblue

" カラースキーマの設定
:colorscheme jellybeans

" コマンド実行中は再描画しない
set lazyredraw
" エンコーディング設定
set enc=utf-8
set fenc=utf-8
set fencs=iso-2022-jp,enc-jp,cp932
set ffs=unix,dos,mac

" .json のファイルは json に filetype を設定
au! BufRead,BufNewFile *.json set filetype=json

" <C-e> で :e ++enc=utf-8
nnoremap <C-e> :<C-u>e ++enc=utf-8<CR>

" 矩形選択で行末にテキストがない場合でも選択可能にする
set virtualedit+=block

" バッファ関連
"" セーブせずにバッファを切り替えられるようにする
set hid
"" <C-p>, <C-n> でバッファ移動
" nmap <C-p> :bp<CR>
" nmap <C-n> :bn<CR>

"" バッファ切替
"nmap wk <C-w>k
"nmap wl <C-w>l
"nmap wj <C-w>j
"nmap wh <C-w>h

" キーマッピング
"" j,kを物理的移動に
nnoremap j gj
nnoremap k gk
"" 0, $を物理的に
nnoremap 0 g0
nnoremap g0 0
nnoremap $ g$
nnoremap g$ $

"" ; と : を入れ替え
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

"" for tab
"nnoremap to :<C-u>tabnew<CR>
"nnoremap tn :<C-u>tabNext<CR>
"nnoremap tc :<C-u>tabclose<CR>

"" <C-h> で help をひく
nnoremap <C-h> :<C-u>help<space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Enter>

"" Yでカーソルから行末までヤンク
nnoremap Y y$

"" ノーマルモード時enterで改行
noremap <CR> a<CR><Esc>
"" ノーマルモード時spaceでスペースをいっこ入れる
noremap <Space> i<Space><Esc>

"" escの2回押しでハイライト消去
noremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

noremap <C-c> :<C-u>checktime<CR>

"" 最後に変更されたテキストを選択
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<enter>
onoremap gc ;<C-u>normal gc<enter>

"" 検索語を真ん中に
nmap n nzz
nmap n nzz
nmap # #zz
nmap * *zz

"" insertモード時のマッピング
inoremap <C-b> <left>
inoremap <C-f> <right>
" inoremap <c-n> <down>
" inoremap <c-p> <up>
inoremap <C-h> <bs>
inoremap <C-d> <del>
inoremap <C-a> <home>
inoremap <C-e> <end>

""" カッコを便利に
"inoremap {} {}<left>
"inoremap [] []<left>
"inoremap () ()<left>
"inoremap "" ""<left>
"inoremap '' ''<left>
"inoremap <> <><left>

" jis キーボード環境でインサートモード時の誤爆を防ぐ
inoremap <C-@> <C-[>
"inoremap <C-]> <C-[>

" ステータスラインを常に表示する
set laststatus=2
" ステータスラインに文字コードと改行文字を表示する
" set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%=%l,%c%V%8P
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%=%l,%c%V%8P%30{g:U_nya_()}

" template
augroup templates
    autocmd!
    autocmd BufNewFile *.xml 0r $HOME/dotfiles/.vim/template/template.xml
    autocmd BufNewFile *.py 0r $HOME/dotfiles/.vim/template/template.py
augroup END

" plugins
""" eskk.vim
"if has('vim_starting')
"    let g:eskk_dictionary = '~/.skk-jisyo'
"
"    if has('mac')
"        let g:eskk_large_dictionary = "~/Library/Application\ Support/AquaSKK/SKK-JISYO.L"
"    elseif has('win32') || has('win64')
"        let g:eskk_large_dictionary = "~/SKK_JISYO.L"
"    else
"    endif
"endif
"
"let g:eskk_debug = 0
"let g:eskk_egg_like_newline = 1
"let g:eskk_revert_henkan_style = "okuri"
"let g:eskk_enable_completion = 0

"" surround
nmap s <Plug>Ysurround
nmap ss <Plug>Yssurround

"" quickrun
let g:quickrun_config = {}
let g:quickrun_config['*']  =  {'split': 'rightbelow'}

""" grepbuffer
"command! -nargs=1 Gb :GrepBuffer <args>
"nnoremap <C-g><C-b> :<c-u>GrepBuffer<Space><C-r><C-w><Enter>


"" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_auto_completion_start_length = 3
let g:neocomplcache_enable_ignore_case = 0
let g:neocomplcache_enable_auto_select = 0
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ }

let g:NeoComplCache_PluginCompletionLength = {
  \ 'snipMate_complete' : 1,
  \ 'buffer_complete' : 1,
  \ 'include_complete' : 2,
  \ 'syntax_complete' : 2,
  \ 'filename_complete' : 2,
  \ 'keyword_complete' : 2,
  \ 'omni_complete' : 1
  \ }

""" neocomplecache のトグル
noremap ,tn :<C-u>NeoComplCacheToggle<CR>
""" 前回行われた補完をキャンセル
inoremap <expr><C-g> neocomplcache#undo_completion()
""" 共通部分のみ補完
inoremap <expr><C-l> neocomplcache#complete_common_string()
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
"inoremap <expr><C-e> neocomplcache#cancel_popup()

""" snippet list
noremap es :<C-u>NeoComplCacheEditSnippets<CR>
""" snippets expand key
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
""" snippets dir
let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'

""" miniBufExpl
"let g:miniBufExplMapWindowNavVim = 0
"let g:miniBufExplSplitBelow = 0
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplSplitToEdge = 1
"let g:miniBufExplMaxSize = 10
"
"""" :Tmでminibufexplorerの表示トグル
"command! Tm :TMiniBufExplorer


"" Unite
nnoremap ,u :<C-u>Unite<Space>
nnoremap ,ud :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ss :<C-u>Unite -buffer-name=files file_rec:. file file_mru<CR>
nnoremap <silent> sg :<C-u>Unite grep -no-quite<CR>
nnoremap <C-n> :<C-u>Unite buffer<CR>
nnoremap <silent> sm :<C-u>Unite mark<CR>

""" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('vsplit')

""" file_rec の ignore ファイル
let g:unite_source_file_rec_ignore_pattern = '\%(^\|/\)\.$\|\~$\|\.\%(DS_Store\|o\|exe\|dll\|bak\|sw[po]\|class\|png\|jpg\|xib\)$\|\%(^\|/\)\.\%(hg\|git\|bzr\|svn\)\%($\|/\)\|\%(^\|/\)\%(BuildArchive\|Build\|gen\|bin\|proguard\)\%($\|/\)\|\%(^\|/\).\+\.\%(xcodeproj\)\%($\|/\)'

""" ESCキーを2回押すと終了する
"au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
"au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

"" VimFiler
let g:vimfiler_as_default_explorer = 1

"" smartchr
inoremap <expr> = smartchr#loop(' = ', ' == ', '=')
inoremap <expr> , smartchr#loop(', ', ',')

" 文字コードの自動認識 from ずんwiki
" http://www.kawaz.jp/pukiwiki/?vim#b5ffaff5
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucjp-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがjisx0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
  if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
    set fileencodings+=cp932
    set fileencodings-=euc-jp
    set fileencodings-=euc-jisx0213
    set fileencodings-=eucjp-ms
    let &encoding = s:enc_euc
    let &fileencoding = s:enc_euc
  else
    let &fileencodings = &fileencodings .','. s:enc_euc
  endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd bufreadpost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif
