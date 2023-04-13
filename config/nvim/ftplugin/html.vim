
" fun! TexEnv(name)
"         call append(line("."), "</" . a:name . ">")
"         call append(line(".")-1, "<" . a:name . ">")
" endfun
" command! -nargs=1 Texenv call TexEnv("<args>")
" 
" nnoremap <C-e> :call TexEnv(input("TeX environment name: "))<CR>


imap {{             {{  }}<Esc>2hi
imap {%             {%  %}<Esc>2hi
