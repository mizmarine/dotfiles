" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" system
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'thinca/vim-quickrun'

" git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'

" filer
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle "scrooloose/nerdtree"
NeoBundle 'tsukkee/unite-tag'

" statusline
NeoBundle "itchyny/lightline.vim"

" edit
NeoBundle "tpope/vim-surround"
NeoBundle "mattn/emmet-vim" "Zen-coding
NeoBundle "scrooloose/nerdcommenter"
NeoBundle "autodate.vim"
NeoBundle "vim-scripts/PDV--phpDocumentor-for-Vim"
NeoBundle "h1mesuke/vim-alignta"
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'vim-scripts/vim-niji'

" indent
NeoBundle "jiangmiao/simple-javascript-indenter"

" completion
NeoBundle "myhere/vim-nodejs-complete" "node補完
NeoBundle "eagletmt/neco-ghc" "haskell補完

" syntax highlight
NeoBundle "plasticboy/vim-markdown" "markdown
NeoBundle 'jelera/vim-javascript-syntax' "javascript
"NeoBundle "pangloss/vim-javascript"
"NeoBundle "mxw/vim-jsx"
NeoBundle 'elzr/vim-json' "json
NeoBundle "kchmck/vim-coffee-script" "coffee scropt
NeoBundle "digitaltoad/vim-jade" "jade
NeoBundle "groenewege/vim-less" "less
NeoBundle "tikhomirov/vim-glsl" "GLSL
NeoBundle "sophacles/vim-processing" "processing(.pde)
NeoBundle "sudar/vim-arduino-syntax" "arduino(.ino)
NeoBundle "jcf/vim-latex" "tex
NeoBundle "rodjek/vim-puppet" " puppet
NeoBundle "leafgarland/typescript-vim" " typescript
NeoBundle "Glench/Vim-Jinja2-Syntax" "jinja2
NeoBundle "nathanaelkane/vim-indent-guides" "indent level
NeoBundle "dag/vim2hs" "haskell

" syntax checker
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tell-k/vim-autopep8'

" color scheme
NeoBundle "altercation/vim-colors-solarized"

" utility
NeoBundle "szw/vim-tags"
NeoBundle "rizzatti/dash.vim"

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck



" ここにインストールしたいプラグインのリストを書く

"------------------------
" システム設定
"------------------------

noremap  
noremap!  
noremap <BS> 
noremap! <BS> 

" mswin.vimを読み込む
" source $VIMRUNTIME/mswin.vim
" behave mswin

" ファイルの上書きの前にバックアップを作る/作らない
" B
" set writebackupを指定してもオプション 'backup' がオンでない限り、
" バックアップは上書きに成功した後に削除される。
set nowritebackup

" バックアップ設定
set nobackup
if version >= 703
  " 再読込、vim終了後も継続するアンドゥ(7.3)
  " set undofile
  " アンドゥの保存場所(7.3)
  " set undodir=.
endif

" スワップファイル設定
set swapfile
set directory=~/.vim/swp

" viminfoを作成しない
" set viminfo=

" クリップボードを共有
set clipboard=unnamed,autoselect

" 8進数を無効にする。<C-a>,<C-x>に影響する
set nrformats-=octal

" キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)
set timeout timeoutlen=3000 ttimeoutlen=100

" 編集結果非保存のバッファから、新しいバッファを開くときに警告を出さない
set hidden

" ヒストリの保存数
set history=50

" 日本語の行の連結時には空白を入力しない
set formatoptions+=mM

" Visual blockモードでフリーカーソルを有効にする
set virtualedit=block

" カーソルキーで行末／行頭の移動可能に設定
set whichwrap=b,s,h,l,[,],<,>

" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start

" □や○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double

" コマンドライン補完するときに強化されたものを使う
set wildmenu

" マウスを有効にする
if has('mouse')
  set mouse=a
endif

" pluginを使用可能にする
filetype plugin indent on

"------------------------
" search
"------------------------

" 検索の時に大文字小文字を区別しない
" ただし大文字小文字の両方が含まれている場合は大文字小文字を区別する
set ignorecase
set smartcase

" 検索時にファイルの最後まで行ったら最初に戻る
set wrapscan

" インクリメンタルサーチ
set incsearch

" 検索文字の強調表示
set hlsearch
" w,bの移動で認識する文字
" set iskeyword=a-z,A-Z,48-57,_,.,-,>
" vimgrep をデフォルトのgrepとする場合internal
" set grepprg=internal


"------------------------
" display
"------------------------

" スプラッシュ(起動時のメッセージ)を表示しない
" set shortmess+=I
" エラー時の音とビジュアルベルの抑制(gvimは.gvimrcで設定)
set noerrorbells
set novisualbell
set visualbell t_vb=
" マクロ実行中などの画面再描画を行わない
" WindowsXpまたはWindowテーマが「Windowsクラシック」で
" Google日本語入力を使用するとIビームカーソルが残る場合にも有効
" set lazyredraw
" Windowsでディレクトリパスの区切り文字表示に / を使えるようにする
set shellslash
" 行番号表示
set number
if version >= 703
  " 相対行番号表示(7.3)
  " set relativenumber
endif

" 括弧の対応表示時間
set showmatch matchtime=1

" カーソル行ハイライト
set cursorline

" タブを設定
" set ts=4 sw=4 sts=4

" tabをspaceに変換
set expandtab

" tabスペース数
set tabstop=4
set softtabstop=0

" 自動的にインデントする
set autoindent

" オートインデント数
set shiftwidth=4

"autocmd! FileType javascript setlocal sw=4 ts=4 sts=0
autocmd! FileType html setlocal sw=2 ts=2 sts=0


" Cインデントの設定
set cinoptions+=:0

" タイトルを表示
set title

" コマンドラインの高さ (gvimはgvimrcで指定)
" set cmdheight=2
set laststatus=2

" コマンドをステータス行に表示
set showcmd

" 画面最後の行をできる限り表示する
set display=lastline

" Tab、行末の半角スペースを明示的に表示する
set list
set listchars=tab:^\ ,trail:~

" ハイライトを有効にする
if &t_Co > 2 || has('gui_running')
  syntax on
endif

syntax enable
colorscheme molokai

""""""""""""""""""""""""""""""
" ステータスラインに文字コード等表示
" iconvが使用可能の場合、カーソル上の文字コードをエンコードに応じた表示にするFencB()を使用
""""""""""""""""""""""""""""""
if has('iconv')
  set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=[0x%{FencB()}]\ (%v,%l)/%L%8P\
else
  set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\
endif


" FencB() : カーソル上の文字コードをエンコードに応じた表示にする
function! FencB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return s:Byte2hex(s:Str2byte(c))
endfunction

function! s:Str2byte(str)
  return map(range(len(a:str)), 'char2nr(a:str[v:val])')
endfunction

function! s:Byte2hex(bytes)
  return join(map(copy(a:bytes), 'printf("%02X", v:val)'), '')
endfunction

"------------------------
" diff
"------------------------

"------------------------
" filetype
"------------------------
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.twig set filetype=html
au BufNewFile,BufRead *.json.org set filetype=json
au BufNewFile,BufRead *.coffee set filetype=coffee
au BufNewFile,BufRead .eslintrc set filetype=javascript
au BufNewFile,BufRead *.tt set filetype=treetop


"------------------------
" folding
"------------------------
" folding基本設定
set foldenable
"set foldmethod=syntax
set foldmethod=indent
"set foldopen=all  " fold内に移動すれば自動で開く
"set foldclose=all  " fold外に移動しfoldlevelより深ければ閉じる
set foldlevel=10   " 折りたたみの具合
set foldnestmax=10  " 最大折りたたみ深度$
set foldcolumn=2 " 左側に折りたたみガイド表示$

"------------------------
" normal
"------------------------

" ; to :
nnoremap ; :

" ヘルプ検索
nnoremap <F1> K

" 現在開いているvimスクリプトファイルを実行
nnoremap <F8> :source %<CR>

" 強制全保存終了を無効化
nnoremap ZZ <Nop>

" カーソルをj k では表示行で移動する。物理行移動は<C-n>,<C-p>
" キーボードマクロには物理行移動を推奨
" h l は行末、行頭を超えることが可能に設定(whichwrap)
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap h <Left>zv
nnoremap j gj
nnoremap k gk
nnoremap l <Right>zv

" , i s / vimshell起動
noremap <silent> ,is :VimShell<CR>

" ウィンドウ移動簡単に
nnoremap <C-J> <C-W>j
nnoremap <C-H> <C-W>h
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" バッファ関連
noremap <C-N> :bnext<CR>
noremap <C-P> :bprevious<CR>

" タブ移動
nnoremap <S-Tab> gT
nnoremap <Tab><Tab> gt
for i in range(1, 9)
    execute 'nnoremap <Tab>' . i . ' ' . i . 'gt'
endfor

" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" ノーマルモードでも改行可能
nnoremap <CR> i<CR><ESC>

" foldingオペレーション
noremap [space] <Nop>
nmap <Space> [space]

" 別レベルへの遷移
noremap [space]j zj
noremap [space]k zk
" 同一レベルでの上下遷移
noremap [space]h ]z
noremap [space]l [z
" folding:close
noremap [space]c zc
" folding:toggle
noremap [space]a za
" folding:all close
noremap [space]m zM
" folding:all open
noremap [space]o zO
noremap [space]i zMzv
noremap [space]r zR
noremap [space]f zf

" re-do
nnoremap r :redo<CR>

" タグ検索
nnoremap <C-]> g<C-]>

"------------------------
" insert
"------------------------
"かっこ入力時，中に戻る
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap () ()<Left>
inoremap “” “”<Left>
inoremap ” ”<Left>
inoremap <> <><Left>
inoremap “ “<Left>
inoremap '' ''<Left>
inoremap "" ""<Left>
inoremap `` ``<Left>

"insertmodeでのdel,bs
inoremap <C-D> <Del>
inoremap <C-G> <BS>

" insertmode抜ける
inoremap <silent> jj <ESC>
inoremap <silent> <C-c> <ESC>

" insertmodeでも簡単な移動ができるようにする
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" emacsライクな行頭，行末移動
inoremap <C-e> <ESC><END>i
inoremap <C-a> <ESC><HOME>i
"nnoremap <C-e> <END>
"nnoremap <C-a> <HOME>
vnoremap <C-e> <END>
vnoremap <C-a> <HOME>

"------------------------
" shortcut
"------------------------
" SPC+. / .vimrcを開く
nnoremap <Space>.v :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>.g :<C-u>edit $MYGVIMRC<CR>

" SPC + , / source ~/.vimrc を実行する。
nnoremap <Space>,v  :<C-u>source $MYVIMRC<CR>
nnoremap <Space>,g  :<C-u>source $MYGVIMRC<CR>


"----------------------------------------
" Vimスクリプト
"----------------------------------------
""""""""""""""""""""""""""""""
" ファイルを開いたら前回のカーソル位置へ移動
" $VIMRUNTIME/vimrc_example.vim
""""""""""""""""""""""""""""""
augroup vimrcEx
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line('$') | exe "normal! g`\"" | endif
augroup END

""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインのカラー変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif
" if has('unix') && !has('gui_running')
"   " ESCですぐに反映されない対策
"   inoremap <silent> <ESC> <ESC>
" endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
    redraw
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

" fileをchromeでひらく
command! MkdChrome call MkdChrome()
function! MkdChrome()
    call system('google-chrome-stable'.expand('%'))
endfunction

""""""""""""""""""""""""""""""
" 全角スペースを表示
""""""""""""""""""""""""""""""
" コメント以外で全角スペースを指定しているので、scriptencodingと、
" このファイルのエンコードが一致するよう注意！
" 強調表示されない場合、ここでscriptencodingを指定するとうまくいく事があります。
" scriptencoding cp932
function! ZenkakuSpace()
  silent! let hi = s:GetHighlight('ZenkakuSpace')
  if hi =~ 'E411' || hi =~ 'cleared$'
    highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
  endif
endfunction
if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif


""""""""""""""""""""""""""""""
" grep結果のQuickfixのウィンドウから enterで対象行に飛べるようにする
""""""""""""""""""""""""""""""
function! OpenModifiableQF()
        cw
        set modifiable
        set nowrap
endfunction

autocmd QuickfixCmdPost vimgrep call OpenModifiableQF()

"-------------------------
" todo List
"-------------------------
abbreviate ti - []

nnoremap <buffer> <Leader><Leader> :call ToggleCheckbox()<CR>

function! ToggleCheckbox()
  let l:line = getline('.')
  if l:line =~ '\-\s\[\s\]'
    let l:result = substitute(l:line, '-\s\[\s\]', '- [x]', '')
    call setline('.', l:result)
  elseif l:line =~ '\-\s\[x\]'
    let l:result = substitute(l:line, '-\s\[x\]', '- [ ]', '')
    call setline('.', l:result)
  end
endfunction

"------------------------
" plugin
"------------------------

"********************
" unite.vim
"********************
let g:unite_source_menu_menus = {
\   "shortcut" : {
\       "description" : "sample unite-menu",
\       "command_candidates" : [
\           ["edit vimrc", "edit $MYVIMRC"],
\           ["edit gvimrc", "edit $MYGVIMRC"],
\           ["unite-file_mru", "Unite file_mru"],
\           ["Unite Beautiful Attack", "Unite -auto-preview colorscheme"],
\           ["unite-output:message", "Unite output:message"],
\       ],
\   },
\}
"let g:unite_enable_start_insert=1
nnoremap <silent> <SPACE>uf :<C-u>Unite file -start-insert<CR>
nnoremap <silent> <SPACE>ul :<C-u>Unite line -start-insert<CR>
nnoremap <silent> <SPACE>uo :<C-u>Unite outline -start-insert<CR>
nnoremap <silent> <SPACE>ut :<C-u>Unite tag -start-insert<CR>
nnoremap <silent> <SPACE>ur :<C-u>Unite file_rec -start-insert<CR>
nnoremap <silent> <SPACE>um :<C-u>Unite file_mru -start-insert<CR>
nnoremap <silent> <SPACE>ub :<C-u>Unite buffer -start-insert<CR>
nnoremap <silent> <SPACE>uu :<C-u>Unite file buffer file_mru -start-insert<CR>
nnoremap <silent> <SPACE>ug :<C-u>Unite grep -start-insert<CR>

au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')

"********************
" NERDTREE
"********************
"autocmd Vimenter * NERDTree ./
nmap <silent> <C-x><C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-x><C-e> <ESC>:NERDTreeToggle<CR>
smap <silent> <C-x><C-e>      :NERDTreeToggle<CR>
imap <silent> <C-x><C-e> <ESC>:NERDTreeToggle<CR>
cmap <silent> <C-x><C-e> <C-u>:NERDTreeToggle<CR>

" *******************
" neoComplcache
" *******************

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 0
let g:neocomplcache_enable_underbar_completion = 1

let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return neocomplcache#smart_close_popup() . "\<CR>"
  return neocomplcache#smart_close_popup()
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()


" add jsx completion
" jsx.vim の jsx#complete が自動で呼び出されます
if !exists("g:neocomplcache_force_omni_patterns")
    let g:neocomplcache_force_omni_patterns = {}
endif

" . を打った時にオムニ補完が呼び出されるようにする
let g:neocomplcache_force_omni_patterns.jsx = '\.'

" add nodejs completion
autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif

 let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'
 let g:node_usejscomplete = 1
" automatically open and close the popup menu / preview window
 au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif



" ***********************
" neosnippet
" ***********************


" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" ***********************
" vim-coffee-script
" ***********************
"autocmd BufWritePost *.coffee silent make!
autocmd BufWritePost *.coffee silent make! --bare


" ***********************
" vim-quickrun
" ***********************
set splitright
nmap <C-r> :QuickRun<CR>

let g:quickrun_config = {}
let g:quickrun_config.processing = {
        \     'command':'processing-java',
        \     'exec':'%c --sketch=$PWD/ --output=/Library/Processing --run --force',
        \   }

" ***********************
" nerdcommenter
" ***********************
nmap <Leader>/ <Plug>NERDCommenterToggle

" ***********************
" autodate.vim
" ***********************
let autodate_format="%Y_%m_%d_%T"

" ***********************
" vim-latex.vim
" ***********************
let tex_flavor = 'latex'
set grepprg=grep\ -nH\ $*
set shellslash
let g:Tex_DefaultTargetFormat = 'pdf' "Macの人はデフォルトでpdfなので必要ない その他のOSの人はデフォルトがdviなので必要
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_MultipleCompileFormats = 'pdf'

" ***********************
" PDV--phpDocumentor-for-Vim
" ***********************
nnoremap <C-D> :call PhpDocSingle()<CR>
vnoremap <C-D> :call PhpDocRange()<CR>


" ***********************
" vim-indent-guides
" ***********************
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
autocmd VimEnter,ColorScheme * :hi IndentGuidesOdd   ctermbg=234
autocmd VimEnter,ColorScheme * :hi IndentGuidesEven  ctermbg=234
let g:indent_guides_enable_on_vim_startup = 1

" ***********************
" syntastic
" ***********************
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_haskell_checkers = ['hlint']

" ***********************
" vim-autopep8
" ***********************
let g:autopep8_disable_show_diff=1

" ***********************
" vim-jsx
" ***********************
let g:jsx_ext_required = 0

" ***********************
" vim-json
" ***********************
let g:vim_json_syntax_conceal = 0

" ***********************
" vim2hs
" ***********************
let g:haskell_conceal = 0

" ***********************
" dash.vim
" ***********************
nmap <silent> <leader>d <Plug>DashSearch


" end of .vimrc
