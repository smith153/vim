
if exists("b:loaded_c_ftplugin")
    finish
endif

let b:loaded_c_ftplugin=1

if !exists(':Astyle')
    command -range=% -nargs=* Astyle <line1>,<line2>!astyle
endif

if !exists("*DoAstyle")
    fun DoAstyle()
        let current_cursor = getpos(".")
        :Astyle
        call setpos('.', current_cursor)
    endfun

endif

nmap <buffer> <F2> :call DoAstyle()<CR>
vmap <buffer> <F2> :Astyle<CR>


