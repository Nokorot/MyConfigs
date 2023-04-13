
" fun! TexEnv(name)
"         call append(line("."), "\\end{" . a:name . "}")
"         call append(line(".")-1, "\\begin{" . a:name . "}")
" endfun
" command! -nargs=1 Texenv call TexEnv("<args>")
" 
" nnoremap <C-e> :call TexEnv(input("TeX environment name: "))<CR>
" 
" nnoremap <M-CR>	 	:w <CR>:!./.compile.sh  <CR>
" nnoremap \\s	 	:!./.compile.sh silent<CR>
" " nnoremap \\o	 	:!zathura-tabbed main.pdf<CR>
" nnoremap \\o	 	:!./.compile.sh open<CR>
" nnoremap \b cw\begin{<C-R>"}<CR>\end{<C-R>"}


nmap ,t :<C-\>e'execute '.string(getcmdline()).'."!perltidy " . b:perltidy_options'<CR><CR>


" nnoremap <C-s>      a<BG><Esc>:r!{tex_snipits \| sed 's/BG//g'}<CR>?BG<CR>dd/<CSR><CR>
" nmap <C-s>      :r!snipits tex<CR>?<CSR><CR>vf>x
nmap <C-s>      :call Snipits("go")<CR>

" Note: this removes all leading witespaces on the first line
" nmap <C-s>  a<BEGIN> <Esc>"od$:r!snipits go -im <C-r>=virtcol('.')-7<CR><CR>$"op?<BEGIN><CR>vf>xJ/CSR><CR>hxvf>x
" nmap <C-s>      :r!printf '=%.0s' {1..<C-r>=col('.')<CR>}

" vmap <C-s>      :'<,'>!snipits -e go<CR>?<CR>vf>x

map <M-CR>	 	:w <CR>:!go run % <CR>

map <C-k> 		?<+.*+><CR>vf>c
map <C-j> 		/<+.*+><CR>vf>c

nmap <C-c>      I// 
imap prt        fmt.Println()
imap {}         {}<++><ESC>4hi
imap ()         ()<++><ESC>4hi
imap []         []<++><ESC>4hi
imap <>         <><++><ESC>4hi
imap ""         ""<++><ESC>4hi
imap ''         ''<++><ESC>4hi

