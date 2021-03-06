
if exists("b:loaded_perl_ftplugin")
    finish
endif

let b:loaded_perl_ftplugin=1

if !exists(':Tidy')
    command -range=% -nargs=* Tidy <line1>,<line2>!perltidy
endif

if !exists("*DoTidy")
    fun DoTidy()
        let current_cursor = getpos(".")
        :Tidy
        call setpos('.', current_cursor)
    endfun
endif

nnoremap <buffer> <F2> :<C-U>call DoTidy()<CR>
xnoremap <buffer> <F2> :Tidy<CR>


