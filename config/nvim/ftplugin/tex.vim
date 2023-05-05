" this is mostly a matter of taste. But LaTeX looks good with just a bit
" of indentation.
set sw=0
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

fun! TexEnv(name)
        call append(line("."), "\\end{" . a:name . "}")
        call append(line(".")-1, "\\begin{" . a:name . "}")
endfun
command! -nargs=1 Texenv call TexEnv("<args>")

nnoremap <C-e> :call TexEnv(input("TeX environment name: "))<CR>

" nnoremap <M-CR>	 	:w <CR>:!./.compile.sh  <CR>
nnoremap \\s	 	:!./.compile.sh silent<CR>
nnoremap \\o	 	:!./.compile.sh open<CR>
nnoremap \b cw\begin{<C-R>"}<CR>\end{<C-R>"}

function! Synctex()
  execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
  redraw!
endfunction
map <C-enter> :call Synctex()<cr>

" nnoremap <C-s>      a<BG><Esc>:r!{tex_snipits \| sed 's/BG//g'}<CR>?BG<CR>dd/<CSR><CR>
" nmap <C-s>      :call Snipits("tex")<CR>
" vmap <C-s>      "rx:call Snipits("tex")<CR>"rP
" vmap <C-s>      :'<,'>!snipits -e tex<CR>?<CR>vf>x

let g:Tex_SmartKeyQuote=0

imap \[             \[  \]<++><Esc>6hi
imap \{             \{  \}<++><Esc>6hi
imap $$         $$<++><ESC>4hi
imap {}         {}<++><ESC>4hi
imap ()         ()<++><ESC>4hi
imap []         []<++><ESC>4hi
imap <>         <><++><ESC>4hi
imap ""         ""<++><ESC>4hi
imap ''         ''<++><ESC>4hi


" set numbers " (optional - will help to visually verify that it's working)
set textwidth=80
set wrapmargin=0
set formatoptions+=t
set linebreak " (optional - breaks by word rather than character)


set nofoldenable
