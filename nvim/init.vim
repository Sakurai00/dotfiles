set encoding=utf-8

set title
set number

set expandtab
set tabstop=4
set shiftwidth=4
set autoindent

set cursorline
set ruler

set hlsearch
set ignorecase
set incsearch


if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/nvim/dein')
  call dein#begin('~/.cache/nvim/dein')
  call dein#add('~/.cache/nvim/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif


set helplang=ja
colorscheme molokai
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1