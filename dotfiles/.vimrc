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
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'wakatime/vim-wakatime'

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
nnoremap <silent> <space>fm :<C-u>Unite file_mru<CR>
nnoremap <silent> <space>fr :<C-u>Unite register<CR>
nnoremap <silent> <space>fs :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> <space>ss :<C-u>UniteResume search-buffer<CR>
" Use vimfiler instead of default filer.
let g:vimfiler_as_default_explorer = 1
" Open filer
noremap <silent> :tree :VimFiler -split -simple -winwidth=45 -no-quit
noremap <space>e :VimFiler -split -simple -winwidth=45 -no-quit<ENTER>
" Don't let <CR> enter the directory but let it open the directory
autocmd FileType vimfiler nmap <buffer> <CR> <Plug>(vimfiler_expand_or_edit)


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

set viminfo='20,\"1000


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

set background=dark
let g:solarized_termtrans = 1
colorscheme solarized
