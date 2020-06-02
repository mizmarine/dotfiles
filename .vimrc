if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" filer
Plug 'scrooloose/nerdtree'

" statusline
Plug 'itchyny/lightline.vim'

" edit
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-scripts/vim-niji'

" syntax highlight
Plug 'plasticboy/vim-markdown'
Plug 'elzr/vim-json'
Plug 'uarun/vim-protobuf'

" color scheme
Plug 'tomasr/molokai'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

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
" filetype
"------------------------
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.twig set filetype=html
au BufNewFile,BufRead *.json.org set filetype=json
au BufNewFile,BufRead .eslintrc set filetype=javascript

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

" indent
nnoremap <S-Tab> <<
nnoremap <Tab> >>

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

"------------------------
" plugin
"------------------------

"********************
" NERDTREE
"********************
"autocmd Vimenter * NERDTree ./
nmap <silent> <C-x><C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-x><C-e> <ESC>:NERDTreeToggle<CR>
smap <silent> <C-x><C-e>      :NERDTreeToggle<CR>
imap <silent> <C-x><C-e> <ESC>:NERDTreeToggle<CR>
cmap <silent> <C-x><C-e> <C-u>:NERDTreeToggle<CR>

" ***********************
" vim-json
" ***********************
let g:vim_json_syntax_conceal = 0
" end of .vimrc
