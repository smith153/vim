
if exists("b:loaded_py_ftplugin")
    finish
endif

let b:loaded_py_ftplugin=1

if !exists(':Autopep8')
    command -range=% -nargs=* Autopep8 <line1>,<line2>!autopep8 --max-line-length 79 -a -a -a  -
endif

if !exists("*DoAutopep8")
    fun DoAutopep8()
        let current_cursor = getpos(".")
        :Autopep8
        call setpos('.', current_cursor)
    endfun
endif

nmap <buffer> <F2> :call DoAutopep8()<CR>
vmap <buffer> <F2> :Autopep8<CR>


