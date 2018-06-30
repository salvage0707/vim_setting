" Configuration file for vim set modelines=0
" CVE-2007-2438 " Normally we use vim-extensions. 
" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
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
"set smartindent

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
