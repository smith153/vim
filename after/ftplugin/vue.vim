
if exists("b:loaded_vue_ftplugin")
    finish
endif

let b:loaded_vue_ftplugin=1

if !exists(':VuePrettier')
    command -range=% -nargs=* VuePrettier <line1>,<line2>!prettier --single-quote --print-width 120 --trailing-comma es5 --parser vue
endif

if !exists("*DoVuePrettier")
    fun DoVuePrettier()
        let current_cursor = getpos(".")
        :VuePrettier
        call setpos('.', current_cursor)
    endfun
endif

nnoremap <buffer> <F2> :<C-U>call DoVuePrettier()<CR>
xnoremap <buffer> <F2> :VuePrettier<CR>



