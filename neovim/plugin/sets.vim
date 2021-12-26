set encoding=utf-8

set rtp+=/usr/local/opt/fzf

set t_Co=256
set number
set relativenumber
set mouse=a
set hidden
let nerdtreeshowhidden=1
set tabstop=2 shiftwidth=2 expandtab

" no wrapping lines
set nowrap

" set cursor to block in insert mode
set guicursor=i:block

set splitbelow
set splitright

set list
set listchars=tab:-\|


set laststatus=2
set viewoptions=cursor,folds,slash,unix
set updatetime=250 "for vim gitgutter

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif



