setlocal commentstring=--\ %s

command! LeanReplace call lean#replace()
command! LeanCheck call lean#check()

let g:lean_auto_replace = 0

if get(g:, 'lean_auto_replace', 0) == 1
	autocmd BufWritePre * :call lean#replace()
endif
