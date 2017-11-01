"mkdir -p ~/.vim/bundle
"git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

if has('vim_starting')
   set nocompatible               " Be iMproved
   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'digitaltoad/vim-pug'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'https://github.com/gorodinskiy/vim-coloresque.git'
NeoBundle 'Yggdroot/indentLine' 
NeoBundle 'hanhan1978/playground-vim'
NeoBundle 'evidens/vim-twig'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'nicklasos/vim-jsx-riot'
NeoBundle 'stephpy/vim-yaml'
NeoBundle 'scrooloose/nerdtree'

call neobundle#end()



" Required:
filetype plugin indent on
NeoBundleCheck


" enable omni completion
set omnifunc=syntaxcomplete#Complete

" Quick vimrc edit 
nnoremap <space>. :<C-u>e $MYVIMRC<CR>
nnoremap <space>s. :<C-u>source $MYVIMRC<CR>

" Unite setting 
nmap <space> [unite]
nnoremap <silent> [unite]b  :<C-u>Unite bookmark -vertical -winwidth=45<CR>
nnoremap <silent> [unite]fs :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> [unite]ss :<C-u>UniteResume search-buffer<CR>
nnoremap <silent> [unite]fm :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]fr :<C-u>Unite register<CR>

nnoremap [unite]t :NERDTreeToggle<CR>
nnoremap [unite]q :q<CR>
nnoremap [unite]w :w<CR>

" Unite grep with ag 
if executable('ag')
   let g:unite_source_grep_command = 'ag'
   let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
   let g:unite_source_grep_recursive_opt = ''
endif

nmap <space>gs :Gstatus<CR>

" JSON quote show
set conceallevel=0
        
syntax on
set nohlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" set binary, before expandtab
set binary noeol

" tab setting
set expandtab "use consective space as tab"
set tabstop=4 "width of displayed tab
set shiftwidth=4
set autoindent
set softtabstop=0
set nf=""    "treat 0 padded number as decimal number

set number
set undofile
set undodir=$HOME/.vim/undo
set fileencodings=utf-8,cp932,iso-2022-jp

set ignorecase
set smartcase 
set viminfo+=n$HOME/.vim/viminfo
set list
set listchars=tab:»-
set t_Co=256
set viminfo='20,\"1000

set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

highlight DiffAdd    cterm=bold ctermfg=15 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=18
highlight DiffText   cterm=bold ctermfg=15 ctermbg=27

" indentLine
let g:indentLine_color_term = 236
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '¦'

" colorcolumn
let &colorcolumn=join(range(81,999),",")

" do not set eol lf when it's not set
"set nofixeol

au BufRead,BufNewFile,BufReadPre *.jade set filetype=pug 
au BufNewFile,BufRead *.tag setlocal ft=javascript

" netrtw setting
let g:netrw_liststyle=3
let g:netrw_altv = 1
let g:netrw_alto = 1