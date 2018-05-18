
if exists("b:loaded_html_ftplugin")
    finish
endif

let b:loaded_html_ftplugin=1

if !exists(':JSPretty')
    command -range=% -nargs=* JSPretty <line1>,<line2>!js-beautify -s 2 --type html -m 1 -
endif

if !exists("*DoJSPretty")
    fun DoJSPretty()
        let current_cursor = getpos(".")
        :JSPretty
        call setpos('.', current_cursor)
    endfun
endif

nnoremap <buffer> <F2> :<C-U>call DoJSPretty()<CR>
xnoremap <buffer> <F2> :JSPretty<CR>

setlocal shiftwidth=2 tabstop=2 softtabstop=2
