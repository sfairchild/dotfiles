set encoding=utf-8

set rtp+=/usr/local/opt/fzf

set number
set relativenumber
set mouse=a
set hidden
let nerdtreeshowhidden=1
set tabstop=2 shiftwidth=2 expandtab

packadd minpac

call minpac#init()

call minpac#add('tpope/vim-sensible')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('scrooloose/nerdtree')
call minpac#add('tpope/vim-surround')
call minpac#add('pangloss/vim-javascript')
call minpac#add('mxw/vim-jsx')
call minpac#add('mattn/emmet-vim')
call minpac#add('w0rp/ale')
call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('tpope/vim-fugitive')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('skywind3000/asyncrun.vim')
call minpac#add('Xuyuanp/nerdtree-git-plugin')
call minpac#add('junegunn/fzf.vim')
call minpac#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
call minpac#add('roxma/nvim-yarp')
call minpac#add('roxma/vim-hug-neovim-rpc')
call minpac#add('wokalski/autocomplete-flow')
call minpac#add('thalesmello/webcomplete.vim')
call minpac#add('Shougo/neosnippet')
call minpac#add('Shougo/neosnippet-snippets')
call minpac#add('Shougo/neoinclude.vim')
call minpac#add('tpope/vim-scriptease', {'type': 'opt'})
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-repeat')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('sotte/presenting.vim')
call minpac#add('inkarkat/vim-SyntaxRange')
call minpac#add('inkarkat/vim-ingo-library')
" call minpac#add('vim-scripts/SyntaxRange')
call minpac#add('tpope/vim-markdown')
call minpac#add('tpope/vim-abolish')
call minpac#add('junegunn/vader.vim')
" call minpac#add('gabrielelana/vim-markdown')
call minpac#add('hwartig/vim-seeing-is-believing')
call minpac#add('lucasteles/SWTC.Vim')
call minpac#add('dahu/vim-rng')

call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('othree/yajs.vim')
call minpac#add('mhartington/oceanic-next')
call minpac#add('dracula/vim', { 'as': 'dracula' })

let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
autocmd BufWritePost *.jsx AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ '...'
                \ ]

silent! nmap <leader>n :NERDTreeToggle<CR>
silent! nmap <leader>N :NERDTreeFind<CR>
silent! nmap <leader>f :Files<CR>

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nmap <leader>s :w<CR>

let g:fzf_layout = { 'left': '~20%' }

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'ruby', 'javascript']

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
