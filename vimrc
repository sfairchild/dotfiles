set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set shell=/bin/bash

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'skalnik/vim-vroom'
Plugin 'tpope/vim-endwise'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/LustyExplorer'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" set line numbers on
set number

" set syntax highlighting on
syntax on

" set indent width to 2
set sw=2

" set tab width
set tabstop=2 softtabstop=0 smarttab expandtab

set hidden
