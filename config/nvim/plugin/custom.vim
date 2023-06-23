
fun! CompileMod() 
    " let line = input("$ ", system(['compile', '-pl', expand('%')]))
    " call system("compile -dm " . expand("%"))
    " call system("compile -dm " . v:servername)
    let output = system("compile -dm " . $PWD)
    " exec '!' . system("compile -p " . expand("%"))
    " exec '!' . system("compile -p " . v:servername)
    
    if !empty(output)
        execute '!' . output
        " execute '!' . system("compile -p " . $PWD)
    endif
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


fun! _Insert(dataf) 
    " Get the initial cursor position and line length
    let crs = [line("."), col(".")]
    let llen = strwidth(getline('.'))

    " Temporarily remove the line after the cursor to the '"' register, 
    " unless the cursor is at the end.
    if crs[1] < llen
        normal l""d$
    endif

    " Insert placeholder char '_'
    normal a_

    " Execute the snipits script and insert the resulting text
    execute "r!cat " . a:dataf

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
        " space if the last character at the end is not a white space.
        " By adding the placeholder char '_' above, we ensure that this is the
        " case
        normal J
        normal h"_2x
        " if col('.') > 1
        "     normal h"_x
        " endif

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
    else 
        " remove the placeholder char '_' and reset cursor
        normal u
        call cursor(crs)
    endif
endfun

fun! SnipitsNew() 
    " let output = system("FT=" . &filetype . " _dml_composer -i --browse-prg $DMENU $TEMPLATES/snipits/_snipits.dml") 
    " let values = split(output, ',')
    " let file = (file[0])

    
    let output = system("FT=" . &filetype . " $TEMPLATES/snipits/_dml_pregen.sh generate")
    if !empty(output)
      call _Insert(output)
      " execute "r!cat " . output
      let _ = system('/bin/rm "' . output . '"')
    endif
    
    return

    " Temporarily remove the line after the cursor to the '"' register, 
    " unless the cursor is at the end.
    if crs[1] < llen
        normal l""d$
    endif

    " Insert placeholder char '_'
    normal a_

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
        " space if the last character at the end is not a white space.
        " By adding the placeholder char '_' above, we ensure that this is the
        " case
        normal J
        normal h"_2x
        " if col('.') > 1
        "     normal h"_x
        " endif

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
    else 
        " remove the placeholder char '_' and reset cursor
        normal u
        call cursor(crs)
    endif
endfun

fun! Snipits(node) 
    " This function, is a wrapper for the external snipits script, which
    " using dmenu lets select a snipit from your collection corresponding to 
    " the current filetype (specified by the node argument).
    " The selected snipit is then pasted at the cursor position. 
    " The main job of this function is to insert the text, at the cursor position, without
   " adding newlines/spaces. 
    " Finally the function moves the cursor to the '<CSR>' marker in the
    " snipit text. And switches to insert mode (#TODO if wanted).

    " NOTE: By rewriting snipits to use dml, we could easialy do the demnu
    " search before doing anything else

    " Get the initial cursor position and line length
    let crs = [line("."), col(".")]
    let llen = strwidth(getline('.'))

    " Temporarily remove the line after the cursor to the '"' register, 
    " unless the cursor is at the end.
    if crs[1] < llen
        normal l""d$
    endif

    " Insert placeholder char '_'
    normal a_

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
        " space if the last character at the end is not a white space.
        " By adding the placeholder char '_' above, we ensure that this is the
        " case
        normal J
        normal h"_2x
        " if col('.') > 1
        "     normal h"_x
        " endif

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
    else 
        " remove the placeholder char '_' and reset cursor
        normal u
        call cursor(crs)
    endif
endfunc

fun! SnipitsOpen(node)  
    " NEW

    let output = system('snipits -fn ' . a:node)
    if !empty(output)
        execute 'tabnew ' . output
    endif
endfun

fun! VimDML(choise)
    let file = '$HOME/.config/nvim/vim.dml'

    
    let output = system('FT="' . &filetype . '" _dml_composer --browse-prg "_dmenu" -i "' . file . '" ' . a:choise)

    if !empty(output)
        let $FT=&filetype
        execute output
    endif
endfun

fun! BrowseOpen()
    " History
    " node dependent
    let file = '$HOME/.config/nvim/openlist.lst'

    let output = system('_dml_cmp "' . file . '" | dmenu')
    if !empty(output)
        execute 'tabnew ' . output
    endif
endfun

fun! Search() 
    let key = input("grep/")
    if empty(key)
        return
    endif
    " execute 'tabnew ' . key

    " let out = system('vim_search "' . key . '"')
    " exec 'term tmenu ~/vim_search.json ~/vim_search.out'

    " <(grep -r "' . key . '")'
    " norm A

    " let output = system('grep -r "' . a:key . '"')
    let output = system('vim_search "' . key . '"')
    
    " let output = system("cat ~/vim_search.out")
    
    " let output = system('vim_search "' . v:servername . '"')
    " exec 'ter vim_search ' . v:servername . ''

    " execute 'tabnew ' . '~/vim_search.out'
    if !empty(output)
        let lines = split(output, ':')
        " Open file
        execute 'tabnew ' . lines[0]
        " Go to line
        execute lines[1]
        " Go to Column
        " execute 'normal ' . lines[2] . 'h'
    endif
    
    " execute 'tabnew ' . 
endfunc
