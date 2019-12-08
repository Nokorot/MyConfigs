" nnoremap <C-j> 		:tabprevious<CR>
" nnoremap <C-k> 		:tabnext<CR>

nnoremap <C-M>	 	:!./.compile.sh <CR>
nnoremap \\s	 	:!./.compile.sh silent<CR>
nnoremap \\o	 	:!zathura-tabbed main.pdf<CR>

nnoremap <C-N>	 	?<<.*>><CR>
nnoremap <M-n> 		/<<.*>><CR>

inoremap jj <ESC>

set tabstop=4



""""""""""""""""""""""""
"" latex-suite """""""""
""""""""""""""""""""""""
filetype plugin on
filetype indent on
let g:tex_flavor='latex'

autocmd FileType * exec("setlocal dictionary+=".$HOME."/.config/nvim/dictionaries/".expand('<amatch>'))
set completeopt=menuone,longest,preview
set complete+=k
