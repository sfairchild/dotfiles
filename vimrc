set encoding=utf-8

set rtp+=/usr/local/opt/fzf

set t_Co=256
set number
set relativenumber
set mouse=a
set hidden
let nerdtreeshowhidden=1
set tabstop=2 shiftwidth=2 expandtab

" make leader key be space
let mapleader="\<SPACE>"

set splitbelow
set splitright

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'

Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
Plug 'airblade/vim-gitgutter'
Plug 'skywind3000/asyncrun.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf.vim'
Plug 'wokalski/autocomplete-flow'
Plug 'thalesmello/webcomplete.vim'

Plug 'Shougo/neoinclude.vim'
Plug 'tpope/vim-scriptease', {'type': 'opt'}
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'sotte/presenting.vim'
Plug 'inkarkat/vim-SyntaxRange'
Plug 'inkarkat/vim-ingo-library'
Plug 'vim-scripts/SyntaxRange'

Plug 'tpope/vim-abolish'
Plug 'junegunn/vader.vim'
Plug 'gabrielelana/vim-markdown'
Plug 'hwartig/vim-seeing-is-believing'
Plug 'lucasteles/SWTC.Vim'
Plug 'dahu/vim-rng'
Plug 'ervandew/supertab'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'othree/yajs.vim'
Plug 'mhartington/oceanic-next'

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'nanotech/jellybeans.vim'

" Plug 'https://github.com/trapd00r/vimpoint'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" typescript support
Plug 'HerringtonDarkholme/yats.vim'
Plug 'HerringtonDarkholme/deoplete-typescript'
Plug 'Quramy/tsuquyomi'

if has('nvim')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" vim airline for status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set laststatus=2

" view indentation in buffers
Plug 'Yggdroot/indentLine'
let g:indentLine_enabled = 1
let g:indentLine_char = "⟩"

" ctrl-p for fuzzy finding
Plug 'ctrlpvim/ctrlp.vim'
nnoremap <Leader>p :CtrlP<CR>

" use ag/silver searcher for searching in files
Plug 'mhinz/vim-grepper'
nnoremap <Leader>fp :Grepper<Space>-query<Space>
nnoremap <Leader>fb :Grepper<Space>-buffers<Space>-query<Space>-<Space>
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)

call plug#end()

let g:user_emmet_settings = {
      \  'javascript' : {
      \      'extends' : 'jsx',
      \  },
      \  'markdown' : {
      \      'extends' : 'md',
      \  },
      \  'elixir' : {
      \      'extends' : 'eex',
      \  },
      \}

autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
autocmd BufWritePost *.jsx AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

let g:deoplete#sources#ternjs#filetypes = [
      \ 'jsx',
      \ 'javascript.jsx',
      \ 'vue',
      \ '...'
      \ ]


" Enable plugins
let g:deoplete#enable_at_startup=1
autocmd FileType markdown let g:deoplete#enable_at_startup=0
set updatetime=250 "for vim gitgutter

" NeoSnippets
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)


imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

smap <expr><TAB>
\ neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

silent! nmap <leader>n :NERDTreeToggle<CR>
silent! nmap <leader>N :NERDTreeFind<CR>
silent! nmap <leader>f :Files<CR>

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

tnoremap <Esc> <C-\><C-n>

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-w> <C-\><C-n><C-w>l

nmap <leader>s :w<CR>

let g:fzf_layout = { 'left': '~20%' }

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'ruby', 'javascript']

" Trim whitespace on save for the specified filetypes
fun! TrimWhiteSpace()
    %s/\s\+$//e
endfun
autocmd FileType c,cpp,java,elixir,ruby,python,javascript autocmd BufWritePre <buffer> :call TrimWhiteSpace()

" Enable seeing-is-believing mappings only for Ruby
augroup seeingIsBelievingSettings
  autocmd!

  autocmd FileType ruby nmap <buffer> <Enter> <Plug>(seeing-is-believing-mark-and-run)
  autocmd FileType ruby xmap <buffer> <Enter> <Plug>(seeing-is-believing-mark-and-run)

  autocmd FileType ruby nmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
  autocmd FileType ruby xmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
  autocmd FileType ruby imap <buffer> <F4> <Plug>(seeing-is-believing-mark)

  autocmd FileType ruby nmap <buffer> <F5> <Plug>(seeing-is-believing-run)
  autocmd FileType ruby imap <buffer> <F5> <Plug>(seeing-is-believing-run)
augroup END

syntax on
color jellybeans
" color dracula

" Handle trailing whitespace
" This needs to be after setting other highlighting that might override these
" settings
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" use arrow keys to resize panes
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>
" Disable arrow keys completely in Insert Mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
