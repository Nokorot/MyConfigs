nnoremap <M-PageUp>     :tabprevious<CR>
nnoremap <M-h>          :tabprevious<CR>
nnoremap <M-PageDown>   :tabnext<CR>
nnoremap <M-l>          :tabnext<CR>
nnoremap <M-t>          :tabnew 

vmap <M-a> 		    :!align -clmn 4 ''<Left>

nmap <M-J>         :m +1<CR>
nmap <M-K>         :m -2<CR>

set spell spelllang=en_gb
setlocal spellfile+=oneoff.utf-8.add

set tabstop=2
set shiftwidth=4
set expandtab

set number

set nofoldenable

fun! CompileMod() 
    " let line = input("$ ", system(['compile', '-pl', expand('%')]))
    call system("compile -dm " . expand("%"))
    exec '!' . system("compile -p " . expand("%"))
    " norm! "<Esc>"
    " call Compile()
    " echo system("compile -p " . expand('%'))
    " call system("compile " . expand("%"), line)
endfun

fun! Compile() 
    " exec "!compile -ft " . &filetype . " " . expand('%')
    " norm! ":!" . system("compile -p -ft " . &filetype . " " . expand('%'))
    norm! ":!ls"
endfunc

" map <M-CR>	 	:w <CR>:!compile % <CR>
" map <M-CR>      :w<CR>:call Compile()<CR>
map <M-CR>    :w<CR>:call CompileMod()<CR>
map <M-C-CR>    :w<CR>:call CompileMod()<CR>


fun! Snipits(node) 
    " This function, is a wrapper for the external snipits script, which
    " using dmenu lets select a snipit from your collection corresponding to 
    " the current filetype (specified by the node argument).
    " The selected snipit is then pasted at the cursor position. 
    " The main job of this function is to insert the text, at the cursor position, without
    " adding newlines/spaces. 
    " Finally the function moves the cursor to the '<CSR>' marker in the
    " snipit text. And switches to insert mode (#TODO if wanted).

    " Get the initial cursor position and line length
    let crs = [line("."), col(".")]
    let llen = strwidth(getline('.'))

    " Temporarily remove the line after the cursor to the '"' register, 
    " unless the cursor is at the end.
    if crs[1] < llen
        normal ""d$
    endif

    " Execute the snipits script and insert the resulting text
    execute "r!snipits " . a:node . " -im " . ( col('.')-7 )

    " Paste back in the end of the line, if it was removed.
    if crs[1] < llen
        normal $""p
    endif

    " Get the line-number at the end of the inserted text, before moving the
    " cursor back to where it was initialy
    let nl = line(".")
    call cursor(crs)

    " Only do the following if text was inserted
    if nl > crs[0]
        " Remove the newline ahead of the inserted text. 'J' will insert a
        " space _unless_ it is at the begining of the line.
        normal J
        if col('.') > 1
            normal "_x
        endif

        " Search and replace <CSR>
        call search("<CSR>", 'c')
        normal vf>"_xh

        " The following part enables insert mode after inserting the text,
        " which might not be what you want.
        " if col('.') < strwidth(getline('.'))-1
        "     startinsert
        "     call cursor(line("."), col('.')+1)
        " else
        "     startinsert!
        " endif
    endif
endfunc


fun! Search() 
    let output = system('vim_search "' . v:servername . '"')
    if !empty(output)
        let lines = split(output, '\n')
        " Open file
        execute 'tabnew ' . lines[0]
        " Go to line
        execute lines[1]
        " Go to Column
        " execute 'normal ' . lines[2] . 'h'
    endif
    
    " execute 'tabnew ' . 
endfunc

nmap <C-t>      :call Search()<CR>


nmap <C-s>      :call Snipits("<C-r>=&filetype<CR>")<CR>
vmap <C-s>      "rx:call Snipits("<C-r>=&filetype<CR>")<CR>"rp

" map <C-k>	 	<ESC>?<+.*+><CR>vf>
" map <C-j> 		<ESC>:call search("<+.*+>", "c")<CR>vf>



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

" map Tw  dawwP
map tc  "xxdwp"xp

map tw  "xdiwdwep"xp
map Tw  "xdiwhxbP"xP

" map Te  dawwP

" nmap <C-s>      :r!snipits &filetype<CR>?<CSR><CR>vf>x
" vmap <C-s>      :'<,'>!snipits -e tex<CR>?<CSR><CR>vf>x


call plug#begin('~/.vim/plugged')
Plug 'mk12/vim-lean', { 'for': 'lean' }
call plug#end()

