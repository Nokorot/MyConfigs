nnoremap <M-PageUp> 	:tabprevious<CR>
nnoremap <M-h>      	:tabprevious<CR>
nnoremap <M-PageDown> 	:tabnext<CR>
nnoremap <M-l>      	:tabnext<CR>
nnoremap <M-t> 		    :tabnew 

nnoremap <C-N>	 	?<++><CR>vf>
nnoremap <M-n> 		/<++><CR>vf>

set tabstop=4
set shiftwidth=4
set expandtab

set nofoldenable


""""""""""""""""""""""""
"" latex-suite """""""""
""""""""""""""""""""""""
" filetype plugin on
filetype indent on
let g:tex_flavor='latex'

autocmd FileType * exec("setlocal dictionary+=".$HOME."/.config/nvim/dictionaries/".expand('<amatch>'))
set completeopt=menuone,longest,preview
set complete+=k
