set nocompatible
filetype off  
set rtp+=~/.vim/vundle/
call vundle#rc() 

"Vundle  
Bundle 'taskpaper.vim'
Bundle 'neocomplcache'
Bundle 'Shougo/vimfiler'
Bundle 'Shougo/unite.vim'
Bundle 'quickrun.vim'
Bundle 'TwitVim'

syntax on
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
set tabstop=4
set number
set autoindent
set fileencoding=utf-8
set fileencodings=iso-2022-jp,utf-8,cp932
set helpheight=40
set smartcase 
set viminfo+=n$HOME/.vim/viminfo
set foldmethod=syntax

let mapleader = "\\"
" setting for neocomplecache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 10
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : '',
  \ 'scala' : $HOME . '/.vim/dict/scala.dict',
  \ }

vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

highlight PmenuSel ctermbg=1

" Quik vimrc edit 
nnoremap <space>. :<C-u>tabnew $MYVIMRC<CR>
nnoremap <space>s. :<C-u>source $MYVIMRC<CR>
nnoremap <C-n> gt
nnoremap <C-p> gT

" vimfiler
map <F2> <ESC>:VimFiler<RETURN>

" unite
let g:unite_enable_start_insert=1
nnoremap <silent> <space>fb :<C-u>Unite buffer<CR>
nnoremap <silent> <space>ff :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <space>fr :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <space>fm :<C-u>Unite file_mru<CR>
nnoremap <silent> <space>fu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> <space>fa :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>


" quickrun
let g:quickrun_config = {}
let g:quickrun_config['*'] = {'outputter/buffer/split': ':150vs'}
nmap <space>r <Plug>(quickrun)

""" twitvim
let twitvim_count = 100
nnoremap ,tp :<C-u>PosttoTwitter<CR>
nnoremap ,tf :<C-u>FriendsTwitter<CR><C-w>j
nnoremap ,tu :<C-u>UserTwitter<CR><C-w>j
nnoremap ,tr :<C-u>RepliesTwitter<CR><C-w>j
nnoremap ,tn :<C-u>NextTwitter<CR>
nnoremap ,rf :<C-u>RefreshTwitter<CR>


autocmd filetype twitvim call s:twitvim_my_settings()
function! s:twitvim_my_settings()
  set nowrap
endfunction

"grep
set grepprg=phpgrep
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep if len(getqflist()) != 0 | copen | endif

filetype plugin on
au BufRead,BufNewFile *.taskpaper   set filetype=taskpaper
