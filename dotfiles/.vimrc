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
NeoBundle 'scrooloose/nerdtree' 
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'TwitVim' 
NeoBundle "vim-scripts/VimRepress"
NeoBundle 'taglist.vim'
NeoBundle 'szw/vim-tags'
NeoBundle 'kchmck/vim-coffee-script'

call neobundle#end()


" Required:
filetype plugin indent on
NeoBundleCheck


"filetype plugin on
" omni completion
set omnifunc=syntaxcomplete#Complete
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif

" Quick vimrc edit 
nnoremap <space>. :<C-u>e $MYVIMRC<CR>
nnoremap <space>s. :<C-u>source $MYVIMRC<CR>

" Quick NERDTree call
nnoremap <space>e :NERDTreeToggle<CR>

" Tlist setting
set tags=.git/tags
"let Tlist_Ctags_Cmd = '/bin/ctags'
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_WinWidth = 40
nnoremap <space>f :TlistToggle<CR>

" Quick Unite call 
nnoremap <silent> <space>fm :<C-u>Unite file_mru<CR>
nnoremap <silent> <space>fr :<C-u>Unite register<CR>
nnoremap <silent> <space>fs :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> <space>ss :<C-u>UniteResume search-buffer<CR>

" Unite grep with ag 
if executable('ag')
   let g:unite_source_grep_command = 'ag'
   let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
   let g:unite_source_grep_recursive_opt = ''
endif
        
syntax on
set nohlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" set binary, before expandtab
set binary noeol

" tab setting
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set softtabstop=0


set number
set fileencodings=utf-8,cp932,iso-2022-jp
set smartcase 
set viminfo+=n$HOME/.vim/viminfo
set list
set listchars=tab:»-
set t_Co=256

"set foldmethod=syntax
"set foldlevel=1
"set foldnestmax=2
"let php_folding=1

set viminfo='100,<250,s10,h,n$HOME/.vim/viminfo


" indentline color setting
let g:indentLine_color_term=238 

" quickrun
augroup QuickRunPHPUnit
    autocmd!
    autocmd BufWinEnter,BufNewFile *Test.php set filetype=phpunit
augroup END

augroup QuickRunRSpec
    autocmd!
    autocmd BufWinEnter,BufNewFile *spec.rb set filetype=rspec
augroup END


let g:quickrun_config = {}
let g:quickrun_config['_'] = {}
let g:quickrun_config['_']['runner'] = 'vimproc'
let g:quickrun_config['_']['runner/vimproc/updatetime'] = 100
let g:quickrun_config['_']['outputter/buffer/split'] = 'vertical 80'
"let g:quickrun_config["_"]["outputter/buffer/into"] = 1

let g:quickrun_config['phpunit'] = {}
let g:quickrun_config['phpunit']['command'] = 'vendor/bin/phpunit'
let g:quickrun_config['phpunit']['cmdopt'] = ''
let g:quickrun_config['phpunit']['exec'] = '%c %o %s'


let g:quickrun_config['rspec'] = {}
let g:quickrun_config['rspec']['command'] = 'rspec' 
let g:quickrun_config['rspec']['cmdopt'] = 'bundle exec' 
let g:quickrun_config['rspec']['exec'] = '%o %c %s'

let g:quickrun_config['make'] = {}
let g:quickrun_config['make']['command'] = '/usr/bin/make'
let g:quickrun_config['make']['exec'] = "%c %o"
let g:quickrun_config['make']['outputter'] = "error:buffer:quickfix" 

nmap <space>r <Plug>(quickrun)
nnoremap <silent> <space>m :<C-u>QuickRun make<CR>

colorscheme jellybeans