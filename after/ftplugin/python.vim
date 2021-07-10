
if exists("b:loaded_py_ftplugin")
    finish
endif

let b:loaded_py_ftplugin=1

if !exists(':Autopep8')
    command -range=% -nargs=* Autopep8 <line1>,<line2>!autopep8 -
endif

if !exists("*DoAutopep8")
    fun DoAutopep8()
        let current_cursor = getpos(".")
        :Autopep8
        call setpos('.', current_cursor)
    endfun
endif

nnoremap <buffer> <F2> :<C-U>call DoAutopep8()<CR>
xnoremap <buffer> <F2> :Autopep8<CR>


