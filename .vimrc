" Ready: curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" declare vim mode explicitly (for git commit)
set nocompatible
filetype plugin indent on

call plug#begin('~/.vim/plugged')

" functions
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'will133/vim-dirdiff'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree'
Plug 'myusuf3/numbers.vim'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'janko-m/vim-test'

" filetypes
Plug 'mtscout6/vim-cjsx'
Plug 'kchmck/vim-coffee-script'
Plug 'mustache/vim-mustache-handlebars'
Plug 'elzr/vim-json'
Plug 'leafgarland/typescript-vim'
Plug 'keith/swift.vim'
Plug 'tfnico/vim-gradle'

" themes
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-vividchalk'
Plug 'wimstefan/Lightning'
Plug 'acarapetis/vim-colors-github'

call plug#end()

" use map instead of changing mapleader
map <space> <Leader>
map <space><space> <Leader><Leader>

" set theme
colorscheme vividchalk
set guifont=Sauce\ Code\ Powerline:h11

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

" change default filetype of *.md to markdown from modula 2
autocmd BufEnter *.md setlocal filetype=markdown

" indentation settings
autocmd FileType coffee,css,html,javascript,json,mustache,ruby,scss,xml,yaml,sh setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType java,jsp,markdown,vim,swift,objc,groovy setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" iskeyword
autocmd FileType css,html,scss,xml,yaml setlocal iskeyword+=-

" move between windows easily
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" folding
set foldlevel=8
autocmd FileType coffee,ruby,yaml setlocal foldmethod=indent
autocmd FileType css,java,javascript,json setlocal foldmethod=syntax
nmap <Leader>f0 :set foldlevel=0<CR>
nmap <Leader>f1 :set foldlevel=1<CR>
nmap <Leader>f2 :set foldlevel=2<CR>
nmap <Leader>f3 :set foldlevel=3<CR>
nmap <Leader>f4 :set foldlevel=4<CR>
nmap <Leader>f5 :set foldlevel=5<CR>
nmap <Leader>f6 :set foldlevel=6<CR>
nmap <Leader>f7 :set foldlevel=7<CR>
nmap <Leader>f8 :set foldlevel=8<CR>
nmap <Leader>f9 :set foldlevel=9<CR>

" switch buffers
nmap <Leader>n :bn<CR>
nmap <Leader>N :bp<CR>

" change the local current directory
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

" airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" ctrlp settings
let g:ctrlp_custom_ignore = {
            \ 'dir': 'node_modules$',
            \ 'file': '' }
let g:ctrlp_extensions = ['funky']
let g:ctrlp_by_filename = 1
nnoremap <Leader>fu :CtrlPFunky<CR>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<CR>

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

" nerdtree settings
map <C-e> :NERDTreeToggle<CR>

" syntastic settings
let g:syntastic_coffee_checkers = ['coffeelint']
