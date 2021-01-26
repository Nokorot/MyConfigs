nnoremap <M-PageUp> 	:tabprevious<CR>
nnoremap <M-h>      	:tabprevious<CR>
nnoremap <M-PageDown> 	:tabnext<CR>
nnoremap <M-l>      	:tabnext<CR>
nnoremap <M-t> 		    :tabnew 


set tabstop=4
set shiftwidth=4
set expandtab

set nofoldenable


""""""""""""""""""""""""
"" latex-suite """""""""
""""""""""""""""""""""""
filetype plugin on
filetype indent on
let g:tex_flavor='latex'

hi clear SpellBad
hi SpellBad cterm=underline ctermbg=red

autocmd FileType * exec("setlocal dictionary+=".$HOME."/.config/nvim/dictionaries/".expand('<amatch>'))
set completeopt=menuone,longest,preview
set complete+=k



map <C-k>	 	<ESC>?<+.*+><CR>vf>
map <C-j> 		<ESC>/<+.*+><CR>vf>
