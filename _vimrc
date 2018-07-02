" Configuration file for vim set modelines=0
" CVE-2007-2438 " Normally we use vim-extensions. 
" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Dont write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1

"---------------------------------------------------------------
" vimの設定
"---------------------------------------------------------------
"行番号の表示
set number

"vi互換をオフ
set nocompatible

"新しい行のインデントを現在行と同じにする
set autoindent

"インクリメンタルサーチ設定
set incsearch

"タブ文字、行末など不可視文字を表示
"set list

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

"新しい行を作ったときに高度な自動インデントを行う
set smartindent

"シフト移動幅
"set shiftwidth=4

"行頭の余白内でTabを打ち込むと、'shiftwidth'の数だけインデントする
set smartindent

"タブ幅の設定
set tabstop=2

"インクリメンタルサーチ、１文字毎に検索を行う
set incsearch

"検索結果をハイライト
"set hlsearch

"カーソルラインをハイライト
set cursorline

"コマンドモードの補完、保存するコマンド数
set wildmenu
set history=1000

"検索を大文字小文字を区別しない
set ignorecase

" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch

" 検索時に最後まで行ったら最初に戻る
set wrapscan

" 検索語をハイライト表示
set hlsearch

" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"---------------------------------------------------------------
" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
"---------------------------------------------------------------
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk


"---------------------------------------------------------------
"マウスでカーソル移動などをできるように
"---------------------------------------------------------------
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

"----------------------------------------------------------
"挿入モードで'jj' → ESC
"----------------------------------------------------------
inoremap <silent> jj <ESC>

"---------------------------------------------------------------
"ペースト時にインデントをしないように
"---------------------------------------------------------------
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

"---------------------------------------------------------------
" 以下プラグインの管理
"---------------------------------------------------------------
set nocompatible
filetype off
" プラグイン管理(vundle)の場所を指定
set rtp+=~/vim_setting/vimfiles/vundle.git/    
call vundle#rc()

"---------------------------------------------------------------
"追加のプラグインを記述
"--------------------------------------------------------------
Bundle 'Shougo/neocomplcache'        
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'

" gitをvimで使えるように変更
Bundle 'tpope/vim-fugitive'
" ステータスラインの設定
Bundle 'itchyny/lightline.vim'
" インデントの可視化
Bundle 'Yggdroot/indentLine'
" ワークツリーの表示[
Bundle 'scrooloose/nerdtree'
" カラースキーマ
Bundle 'tomasr/molokai'
" シンタックスチェック
Bundle 'scrooloose/syntastic'
" gcでコメントアウト
Bundle 'tomtom/tcomment_vim'
" 独自のサブモジュールを作成可能にする
Bundle 'kana/vim-submode'
" 自動で閉じる
Bundle 'tpope/vim-endwise'
" メソッド定義元へのジャンプ
Bundle 'szw/vim-tags'
" コード補完
Bundle 'Shougo/neocomplete.vim'
Bundle 'marcus/rsense'
Bundle 'supermomonga/neocomplete-rsense.vim'


filetype plugin indent on     " required!"

"----------------------------------------------------------
" ステータスラインの設定 
"----------------------------------------------------------
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する

"----------------------------------------------------------
" ctrl + eでワークツリーを表示
"----------------------------------------------------------
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"----------------------------------------------------------
"カラースキーマの設定
"----------------------------------------------------------
let g:molokai_original = 1
let g:rehash256 = 1

"----------------------------------------------------------
"シンタックスチェック
"----------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"----------------------------------------------------------
"ウィンドウの移動のコマンドエイリアス
"----------------------------------------------------------
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

"----------------------------------------------------------
"タブ管理を楽にする
"----------------------------------------------------------
"" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ
colorscheme molokai


"----------------------------------------------------------
"カラースキーム
"----------------------------------------------------------

syntax on
let g:molokai_original = 1
let g:rehash256 = 1
set t_Co=256

" -------------------------------
" Rsense
" -------------------------------
let g:rsenseHome = '/usr/local/lib/rsense-0.3'
let g:rsenseUseOmniFunc = 1

" --------------------------------
" neocomplete.vim
" --------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

" --------------------------------
" rubocop
" --------------------------------
" syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
" active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']
