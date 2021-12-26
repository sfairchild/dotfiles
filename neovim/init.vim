let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let mapleader = " "
set noswapfile

call plug#begin(stdpath('data') . '/plugged')

" COC LS completions
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
" Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'} " mru and stuff
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'} " color highlighting

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Gruvbox
Plug 'morhetz/gruvbox'

" Buffer Delete
Plug 'qpkorr/vim-bufkill'

" Prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" nvim treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" VIM practice plugin
Plug 'ThePrimeagen/vim-be-good'

" cht.sh <leader>kk
Plug 'dbeniamine/cheat.sh-vim'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'

autocmd FileType terraform setlocal commentstring=#\ %s

Plug 'hashivim/vim-terraform'
autocmd FileType terraform autocmd BufWritePre <buffer> :TerraformFmt

Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'skywind3000/asyncrun.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'vim-test/vim-test'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ThePrimeagen/git-worktree.nvim'
" Using floating windows of Neovim to start fzf
" if has('nvim')
"   let $FZF_DEFAULT_OPTS .= ' --border --margin=0,2'

"   function! FloatingFZF()
"     let width = float2nr(&columns * 0.9)
"     let height = float2nr(&lines * 0.6)
"     let opts = { 'relative': 'editor',
"                \ 'row': (&lines - height) / 2,
"                \ 'col': (&columns - width) / 2,
"                \ 'width': width,
"                \ 'height': height }

"     let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
"     call setwinvar(win, '&winhighlight', 'NormalFloat:Normal')
"   endfunction

"   let g:fzf_layout = { 'window': 'call FloatingFZF()' }
" endif
"
" let g:fzf_layout = { 'left': '~20%' }

" https://github.com/wokalski/autocomplete-flow
Plug 'wokalski/autocomplete-flow'
Plug 'thalesmello/webcomplete.vim'

Plug 'Shougo/neoinclude.vim'
" Plug 'tpope/vim-scriptease', {'type': 'opt'}
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'sotte/presenting.vim'
Plug 'inkarkat/vim-SyntaxRange'
Plug 'inkarkat/vim-ingo-library'
Plug 'vim-scripts/SyntaxRange'

Plug 'tpope/vim-abolish'
Plug 'junegunn/vader.vim'
" Plug 'gabrielelana/vim-markdown'
Plug 'lucasteles/SWTC.Vim'
Plug 'dahu/vim-rng'
Plug 'ervandew/supertab'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'othree/yajs.vim'
Plug 'mhartington/oceanic-next'

Plug 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0

" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'nanotech/jellybeans.vim'

" ruby plugins
Plug 'hwartig/vim-seeing-is-believing'

" Plug 'https://github.com/trapd00r/vimpoint'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" typescript support
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'HerringtonDarkholme/deoplete-typescript'
Plug 'Quramy/tsuquyomi'

" if has('nvim')
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif

Plug 'martinda/Jenkinsfile-vim-syntax'

let g:elixirls = {
  \ 'path': printf('%s/%s', stdpath('config'), 'bundle/elixir-ls'),
  \ }

let g:elixirls.lsp = printf(
  \ '%s/%s',
  \ g:elixirls.path,
  \ 'release/language_server.sh')

function! g:elixirls.compile(...)
  let l:commands = join([
    \ 'mix local.hex --force',
    \ 'mix local.rebar --force',
    \ 'mix deps.get',
    \ 'mix compile',
    \ 'mix elixir_ls.release'
    \ ], '&&')

  echom '>>> Compiling elixirls'
  silent call system(l:commands)
  echom '>>> elixirls compiled'
endfunction

" call coc#config('languageserver', {
"   \ 'elixir': {
"   \   'command': g:elixirls.lsp,
"   \   'trace.server': 'verbose',
"   \   'filetypes': ['elixir', 'eelixir']
"   \ }
"   \})

" Plug 'neoclide/coc.nvim', { 'tag': '*', 'do': { -> coc#util#install() } }
" Plug 'JakeBecker/elixir-ls', { 'do': { -> g:elixirls.compile() } }

" let g:elixirls = {
"   \ 'path': printf('%s/%s', stdpath('config'), 'bundle/elixir-ls'),
"   \ }

" let g:elixirls.lsp = printf(
"   \ '%s/%s',
"   \ g:elixirls.path,
"   \ 'release/language_server.sh')

" function! g:elixirls.compile(...)
"   let l:commands = join([
"     \ 'mix local.hex --force',
"     \ 'mix local.rebar --force',
"     \ 'mix deps.get',
"     \ 'mix compile',
"     \ 'mix elixir_ls.release'
"     \ ], '&&')

"   echom '>>> Compiling elixirls'
"   silent call system(l:commands)
"   echom '>>> elixirls compiled'
" endfunction

" call coc#config('languageserver', {
"   \ 'elixir': {
"   \   'command': g:elixirls.lsp,
"   \   'trace.server': 'verbose',
"   \   'filetypes': ['elixir', 'eelixir']
"   \ }
"   \})

" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'

" git plugins
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
Plug 'airblade/vim-gitgutter'
nnoremap <Leader>gs :Gstatus<CR>

" vim airline for status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

" view indentation in buffers
Plug 'Yggdroot/indentLine'
let g:indentLine_enabled = 1
let g:indentLine_char = "⟩"

" Plug 'gregsexton/MatchTag'

" ctrl-p for fuzzy finding
Plug 'ctrlpvim/ctrlp.vim'
nnoremap <Leader>p :CtrlP<CR>

" use ag/silver searcher for searching in files
Plug 'mhinz/vim-grepper'
nnoremap <Leader>fp :Grepper<Space>-query<Space>
nnoremap <Leader>fb :Grepper<Space>-buffers<Space>-query<Space>-<Space>
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)

Plug 'tpope/vim-apathy'

Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'

Plug 'jeetsukumaran/vim-indentwise'

" handle saving folds/settings between sessions
Plug 'zhimsel/vim-stay'

" create/list gists within vim
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
let g:gist_detect_filetype = 1

" Use nvim in the browser
Plug 'glacambre/firenvim'
let g:firenvim_config = {
    \ 'localSettings': {
        \ '.*': {
            \ 'selector': 'textarea',
            \ 'priority': 0,
        \ }
    \ }
\ }

call plug#end()

" let g:user_emmet_settings = {
"       \  'javascript' : {
"       \      'extends' : 'jsx',
"       \  },
"       \  'markdown' : {
"       \      'extends' : 'md',
"       \  },
"       \  'elixir' : {
"       \      'extends' : 'eex',
"       \  },
"       \}

" let g:deoplete#sources#ternjs#filetypes = [
"       \ 'jsx',
"       \ 'javascript.jsx',
"       \ 'vue',
"       \ '...'
"       \ ]


" Enable plugins
" let g:deoplete#enable_at_startup=1
" autocmd FileType markdown let g:deoplete#enable_at_startup=0

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


let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'ruby', 'javascript']

" Trim whitespace on save for the specified filetypes
fun! TrimWhiteSpace()
    %s/\s\+$//e
endfun
autocmd FileType c,cpp,java,elixir,ruby,python,javascript,terraform autocmd BufWritePre <buffer> :call TrimWhiteSpace()

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
" color jellybeans
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
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>

" use Alt-, or Alt-. to just to line with same indent level
nnoremap <M-,> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap <M-.> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>

" command -nargs=1 Vsb call VsbFunction(<f-args>)

function VsbFunction (arg1)
  execute 'vert sb' a:arg1
endfunction


autocmd filetype crontab setlocal nobackup nowritebackup

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({hidden=true})<CR>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<CR>
