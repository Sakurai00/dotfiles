" ====== Load vim settings ======
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc
" ====== ====== ======

" ====== dein installer ======
if &compatible
  set nocompatible
endif
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
" ====== ====== ======


set helplang=ja

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


" colorscheme {molokai, ayu}
colorscheme ayu

" if use ayu, set ayucolor {light, mirage, dark}
let ayucolor="mirage"

let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
