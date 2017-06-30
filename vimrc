" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set shell=/bin/bash

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'skalnik/vim-vroom'
Plugin 'tpope/vim-endwise'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/LustyExplorer'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary'
" Plugin 'vimwiki/vimwiki'
Plugin 'bkad/CamelCaseMotion'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdcommenter'
Plugin 'wesQ3/vim-windowswap'
Plugin 'tpope/vim-repeat'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Autodetect markdown files
" See https://github.com/tpope/vim-markdown for more detail
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

""""""""""""""""""""""""""""""""""""""""""
" Custom settings
set number
set relativenumber
call camelcasemotion#CreateMotionMappings('<leader>')
set cursorline 						" highlight current line
filetype indent on      				" load filetype-specific indent files

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

" map <silent> n <Plug>CamelCaseMotion_w
""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""
" Map control-[hjkl] to move between window pains
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""
" syntastic recomended basic settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_exec = '~/.rbenv/shims/ruby'
""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""
" Settings for vim vroom
" let g:vroom_use_terminal = 1
""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""
" Settings for vim airline
let g:airline_theme='badwolf'
""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""
" Settings for vim-windowswap
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>mw :call WindowSwap#EasyWindowSwap()<CR>
""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""
" MY SETTINGS
" Settings for buffer swithching
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>
" Quickly list buffers
:nnoremap <leader>l :redraw<CR>:ls<CR>
" Use CTRL-S for saving, also in Insert mode
noremap <leader>s :update<CR>
vnoremap <leader>s <C-C>:update<CR>
inoremap <leader>s <C-O>:update<CR>
" Open and save vimrc file
noremap <leader>vim :source $MYVIMRC<CR>:edit $MYVIMRC<CR>
""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""
" vimwiki/vimwiki
" let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""
" Settings for NERDCommenter
let NERDSpaceDelims=1
let NERDTreeShowHidden=1
""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""
" Auto remove trailing whitespace on save
autocmd BufWritePre *.rb %s/\s\+$//e " Ruby .rb files
autocmd BufWritePre *.html %s/\s\+$//e " HTML .html files
autocmd BufWritePre *.js %s/\s\+$//e " JavaScript .js files
""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""
" system clipboard settings
set clipboard=unnamed
""""""""""""""""""""""""""""""""""""""""""
" ctrl-p settings
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40 
""""""""""""""""""""""""""""""""""""""""""
set hidden
