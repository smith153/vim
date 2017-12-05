
if exists("b:loaded_js_ftplugin")
    finish
endif

let b:loaded_js_ftplugin=1

if !exists(':Prettier')
    command -range=% -nargs=* Prettier <line1>,<line2>!prettier --tab-width 4 --single-quote --print-width 110 --trailing-comma es5 --stdin
endif

if !exists("*DoPrettier")
    fun DoPrettier()
        let current_cursor = getpos(".")
        :Prettier
        call setpos('.', current_cursor)
    endfun
endif

nnoremap <buffer> <F2> :<C-U>call DoPrettier()<CR>
xnoremap <buffer> <F2> :Prettier<CR>



