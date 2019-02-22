" Bases off of https://github.com/tao12345666333/vim
" ============================================================================
" Vundle initialization
" Avoid modify this section, unless you are very sure of what you are doing

" no vi-compatible
set nocompatible

" highlight all pyton syntax
let python_highlight_all=1
" disable perl include directories
let perlpath=1

" Setting up Vundle - the best vim plugin manager
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" Plugins from github repos:

" Python and PHP Debugger
"Bundle 'fisadev/vim-debug.vim'
" Class/module browser
"Bundle 'majutsushi/tagbar'
" Airline
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
" Surround
"Bundle 'tpope/vim-surround'
" Autoclose parentheses
"Bundle 'Townk/vim-autoclose'
"Bundle 'Raimondi/delimitMate'
" Indent text object
"Bundle 'michaeljsmith/vim-indent-object'
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
"Bundle 'klen/python-mode'
" Better autocompletion
Bundle 'ervandew/supertab'
"Bundle 'Shougo/neocomplete.vim'
" awesome colorscheme
"Bundle 'tomasr/molokai'
" Automatically sort python imports
"Bundle 'fisadev/vim-isort'
" Window chooser
Bundle 't9md/vim-choosewin'
" Python and other languages code checker
Bundle 'scrooloose/syntastic'
" Paint css colors with the real color
Bundle 'lilydjwg/colorizer'
"Bundle autopep8
"Bundle 'tell-k/vim-autopep8'
"Bundle js-indent
"Bundle 'gavocanov/vim-js-indent'

" Plugins from vim-scripts repos:

" Search results counter
Bundle 'IndexedSearch'
" XML/HTML tags navigation
Bundle 'matchit.zip'
" Gvim colorscheme
"Bundle 'Wombat'
" Yank history navigation
"Bundle 'YankRing.vim'
" javascript complete after install the plugin, you must cd the install
" directory and run `npm install`, then add a .tern-project config file
" the doc at http://ternjs.net/doc/manual.html#vim
"Bundle 'marijnh/tern_for_vim'
" Golang Plugins
"Bundle 'fatih/vim-go'
" JSX syntax highlight.
Bundle 'mxw/vim-jsx'
" JS highlight
Bundle 'pangloss/vim-javascript'

" ============================================================================
" Install plugins the first time vim runs

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

" ============================================================================
" Vim settings and mappings
" You can edit them as you wish

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set modeline
set modelines=5
" hidden startup messages
"set shortmess=atI
" auto read and write
set autowrite
set autoread
" no backup files
set nobackup
set background=dark
set encoding=utf-8

"no warn on new buffer
set hidden


" always show status bar
set laststatus=2

" incremental search
set incsearch
" highlighted search results
set hlsearch

" syntax highlight on
syntax on

"set leader
let mapleader = ";"

" tab navigation mappings
map tm :tabm 
"map tt :tabnew 
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

"buffer nav
map tt :e
map <leader>j :bn<cr>
map <leader>h :bp<cr>
map <leader>d :bd<cr>
map <leader>b :buffers<cr>:b<space> 
map fr :bn<cr>
map fR :bp<cr>


" old autocomplete keyboard shortcut
imap <C-J> <C-X><C-O>


" use 256 colors when possible
if &term =~? 'mlterm\|xterm\|xterm-256\|screen-256\|screen-bce'
	let &t_Co = 256
    colorscheme molokai
else
    colorscheme delek
endif

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" autocompletion of files and commands behaves like zsh
" (autocomplete menu)
set wildmenu
set wildmode=full

" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

" Tagbar ----------------------------- 

" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" Vim-debug ------------------------------

" disable default mappings, have a lot of conflicts with other plugins
let g:vim_debug_disable_mappings = 1
" add some useful mappings
" map <F5> :Dbg over<CR>
" map <F6> :Dbg into<CR>
" map <F7> :Dbg out<CR>
" map <F8> :Dbg here<CR>
" map <F9> :Dbg break<CR>
" map <F10> :Dbg watch<CR>
" map <F11> :Dbg down<CR>
" map <F12> :Dbg up<CR>


" colorizer
let g:colorizer_maxlines = 1000
" paren match
"let g:loaded_matchparen = 1

" Syntastic ------------------------------

" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501'
" syntastic checker for javascript.
" eslint is the only tool support JSX.
" If you don't need write JSX, you can use jshint.
" And eslint is slow, but not a hindrance
" let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_enable_signs = 1
" custom icons (enable them if you use a patched font, and enable the previous 
" setting)
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'


" autopep8 ------------------------------
" disable diff
let g:autopep8_disable_show_diff=1
let g:autopep8_max_line_length=79
let g:autopep8_aggressive=1

" SuperTab ------------------------------
" Autocomplete to longest common match
let g:SuperTabLongestEnhanced = 1
" enter selects and cancels completion
let g:SuperTabCrMapping = 1
let g:SuperTabLongestHighlight = 1
" auto close window
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabDefaultCompletionType = "context"
" TabMan ------------------------------

" mappings to toggle display, and to focus on it
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'

" Window Chooser ------------------------------

" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

" Airline ------------------------------

" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on the README.rst)
let g:airline_theme = 'bubblegum'
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

" disable word count, save CPU
let g:airline#extensions#wordcount#enabled = 0

let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = ':'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.readonly = ''

" new file set title and turn to endline
autocmd BufNewFile *.sh,*.py,*.rb,*.pl exec ":call SetTitle()"
function SetTitle()
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")

    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
	    call append(line(".")+1, "")

    elseif &filetype == 'perl'
        call setline(1,"#!/usr/bin/env perl")
        call append(line("."),"use strict;")
        call append(line("."),"use warnings;")
	    call append(line(".")+2, "") 

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
	    call append(line(".")+1, "")
    endif
endfunction
autocmd BufNewFile * normal G

" Vim-jsx ------------------------------

" if you use JSX syntax in .js file, please enable it.
let g:jsx_ext_required = 1

" Vim-markdown ------------------------------

" Disabled automatically folding
let g:vim_markdown_folding_disabled=1
" LeTeX math
let g:vim_markdown_math=1
" Highlight YAML frontmatter
let g:vim_markdown_frontmatter=1

" Vim-instant-markdown -----------------

" If it takes your system too much, you can specify
" let g:instant_markdown_slow = 1
" if you don't want to manually control it
" you can open this setting
" and when you open this, you can manually trigger preview
" via the command :InstantMarkdownPreview
" let g:instant_markdown_autostart = 0
"
"
