"https://github.com/darold/pgFormatter
if exists("b:loaded_sql_ftplugin")
    finish
endif

let b:loaded_sql_ftplugin=1

if !exists(':SqlPrettier')
    command -range=% -nargs=* SqlPrettier <line1>,<line2>!pg_format --spaces 2 --function-case 2
endif

if !exists("*DoSqlPrettier")
    fun DoSqlPrettier()
        let current_cursor = getpos(".")
        :SqlPrettier
        call setpos('.', current_cursor)
    endfun
endif

nnoremap <buffer> <F2> :<C-U>call DoSqlPrettier()<CR>
xnoremap <buffer> <F2> :SqlPrettier<CR>



