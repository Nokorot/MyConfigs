
" func! gen_header_ifdef() {
" 
" }

" map <M-CR>	 	:w <CR>:!gcc -o a.out % && ./a.out <CR>
nmap <C-c>      I// <ESC>

map <C-j> 		/<+.*+><CR>vf>c

imap {}         {<CR><CR>}<++><ESC>k<TAB>
imap ()         ()<++><ESC>4hi
imap []         []<++><ESC>4hi
imap <>         <><++><ESC>4hi
imap ""         ""<++><ESC>4hi
imap ''         ''<++><ESC>4hi

