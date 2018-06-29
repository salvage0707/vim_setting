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

" vimの設定
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

"
