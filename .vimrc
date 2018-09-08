" Ready: curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" declare vim mode explicitly (for git commit)
set nocompatible
filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'will133/vim-dirdiff'
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'

call plug#end()

" use map instead of changing mapleader
map <space> <Leader>
map <space><space> <Leader><Leader>

" disable undo after reload
set undoreload=0
" remove current directory for swap files
set directory-=.
" treat all numbers as decimal
set nrformats=
" complete till longest common string and start wildmenu
set wildmenu wildmode=full
" show status line always
set laststatus=2
" allow buffer switching without saving
set hidden

" indentation settings
autocmd FileType coffee,css,html,javascript,json,mustache,ruby,scss,xml,yaml,sh,thrift setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType java,jsp,markdown,vim,swift,objc,groovy setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" iskeyword
autocmd FileType css,html,scss,xml,yaml setlocal iskeyword+=-

" folding
set foldlevel=8
autocmd FileType coffee,ruby,yaml setlocal foldmethod=indent
autocmd FileType css,java,javascript,json setlocal foldmethod=syntax

" switch buffers
nmap <Leader>n :bn<CR>
nmap <Leader>N :bp<CR>

" change the local current directory
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

" dirdiff settings
let g:DirDiffExcludes = "node_modules,.git"

" fugitive settings
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gd :Gdiff<CR>
nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap <silent> <Leader>gb :Gblame<CR>
nnoremap <silent> <Leader>gl :Glog<CR>
nnoremap <silent> <Leader>gp :Git push<CR>
nnoremap <silent> <Leader>gr :Gread<CR>
nnoremap <silent> <Leader>gw :Gwrite<CR>
nnoremap <silent> <Leader>ge :Gedit<CR>
nnoremap <silent> <Leader>gi :Git add -p %<CR>
nnoremap <silent> <Leader>gg :SignifyToggle<CR>
