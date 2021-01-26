
map <M-CR>	 	:w <CR>:!gcc -o a.out % && ./a.out <CR>
nmap <C-c>      I// <ESC>

nmap c-         f.vc-><ESC>

map <C-j> 		/<++><CR>vf>c

imap ERR        fprintf(stderr, "%s\n", )<++><ESC>5hi
imap prt        printf("%s\n", )<++><ESC>5hi

imap MAIN       int main(int args, char **argv){<Return><Return>}<ESC>kI<TAB>


imap {}         {<CR><CR>}<++><ESC>k<TAB>
imap ()         ()<++><ESC>4hi
imap []         []<++><ESC>4hi
imap <>         <><++><ESC>4hi
imap ""         ""<++><ESC>4hi
imap ''         ''<++><ESC>4hi

