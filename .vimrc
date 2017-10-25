set tabstop=3
"sett_Co=256 "ターミナル256対応
set shiftwidth=3
"set expandtab
set tabpagemax=99
set autoindent
set nocompatible
"  set ttymouse=xterm2
"  set mouse=a
set number
set wildmenu
set wildchar=<TAB>
set nohidden
"  set hid

" when syntax could be enable, do it
if &t_Co > 1
	syntax enable
endif


syntax on
colorscheme molokai 
"文字コード
set termencoding=utf-8
"set encoding=japan
set fileencodings=utf-8,iso-2022-jp,utf-8,cp932,euc-jp
"日本語の行の連結時には空白を入力しない。
set formatoptions+=mM
set ambiwidth=double
set display+=lastline
set iskeyword-=_ 
"ステータスライン
set showtabline=2 "always
set laststatus=2

"bundle
set runtimepath+=$HOME/.vim/vimproc/autoload/,$HOME/.vim/vimproc/plugin/

if has('vim_starting')
	  set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif

  call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" NeoBundleFetch 'Shougo/neobundle.vim'
"
" " add plugins
"
filetype plugin on
"
NeoBundleCheck
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'nvie/vim-flake8' 
NeoBundle 'thinca/vim-quickrun'
"pythontool
"
"jedi-vim 用
let g:jedi#auto_initialization = 1
let g:jedi#rename_command = "<leader>R"
let g:jedi#popup_on_dot = 1
autocmd FileType python let b:did_ftplugin = 1
"about python indent 
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
 
"
"set statsline=\(\'\･\ω\･\`\)\つ\"%<%f\"\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L
""set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.'][git:'.GitBranch().']'}%=%4v\ %l/%L
"  autocmd BufNewFile *.{c,cpp,h,hpp,py,php,txt,css,htm*}{,.in} set fileencoding=utf-8
"表示どおりに移動
nmapclear
nnoremap E <esc>:Ref alc  
nnoremap j gj
nnoremap k gk
nnoremap <Space>l $
nnoremap <Space>h 0
nnoremap e <esc>:tabnew 
nnoremap o o <esc>hli
nnoremap I :call Flake8() 
"nnoremap <silent> <C-S-h> :tabp <CR>
"nnoremap <silent> <C-S-l> :tabn <CR> 
nnoremap <C-T> :!sh vim.sh <CR><CR>
 
"nnoremap <UP>    zR
"noremap <LEFT>  zMzx
"inoremap <RIGHT> <NOP>
"noremap <DOWN>  zM
"inoremap <S-SPACE> <C-f> 
imapclear 
inoremap <C-k> <UP>
inoremap <C-h> <LEFT>
inoremap <C-j> <DOWN>
inoremap <C-e> <END>
inoremap <C-a> <HOME>
inoremap <C-@> <C-[>
inoremap <C-l> <Right>
inoremap <C-d> <Delete> 
"inoremap <UP>    <NOP>
"inoremap <LEFT>  <NOP>
"inoremap <RIGHT> <NOP>
 
"inoremap <DOWN>  <NOP>
""nnoremap <C-M> :tabedit<CR>:make<CR>
"nmap t <NOP>
"nmap tt :TabMake<CR>
"nmap tn :cn<CR>
"nmap tp :cp<CR>

set whichwrap=b,s,<,>,[,]

