nnoremap <C-j> 		:tabprevious<CR>
nnoremap <C-k> 		:tabnext<CR>

set tabstop=4
" set smartindent

call plug#begin()
Plug 'neoclide/coc.nvim'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'gruvbox-community/gruvbox'

call plug#end()

" use <tab> to trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

"set termguicolors
" colo gruvbox

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <c-b> <Esc>:NERDTreeToggle<cr>
nnoremap <c-b> <Esc>:NERDTreeToggle<cr>


