" indent
set tabstop=4
set shiftwidth=4
set autoindent

" enable using backspace to delete any words(2)
set backspace=2

" set line number
set nu

" match (){}[]
set showmatch

" paste
:set pastetoggle=<F5>
"when in paste mode(F5), the format of the paste will not be changed unexpectedly!"

" show tabs and spaces
set listchars=tab:>-,trail:-

" enable immediately
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" enable cursor point to the next of the last char.
" working for arrow keys but not for 9($)
set virtualedit=block,onemore

"no bell ring
set visualbell

" map keys
map 9 $


" mouse support {not working for remote ssh, got to leave it alone}
" link: https://vi.stackexchange.com/questions/11583/how-can-i-use-mouse-a-for-local-and-remote-work
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" python
let python_highlight_all=1
au Filetype python set tabstop=4
au Filetype python set softtabstop=4
au Filetype python set shiftwidth=4
au Filetype python set textwidth=79
au Filetype python set expandtab
au Filetype python set autoindent
au Filetype python set fileformat=unix
autocmd Filetype python set foldmethod=indent
autocmd Filetype python set foldlevel=99
