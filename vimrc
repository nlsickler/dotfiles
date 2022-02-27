" ##################################
" # Built-in VIM Settings
" ##################################

set nocompatible
set nomodeline
set backspace=indent,eol,start	" more powerful backspacing
set encoding=UTF-8 " Necessary for ryanoasis/vim-devicons

filetype indent plugin on
syntax on

set ignorecase
set smartcase
set number relativenumber

set nowrap " # Prevent wrapping
set linebreak " # Wrap on words if `:set wrap` is called

"Indentation defaults
set shiftwidth=4  
set softtabstop=4
set expandtab

set hlsearch
set mouse=a
set ruler
set splitbelow splitright " Opens new splits to the right or below

au BufReadPost *.thor set syntax=ruby
"autocmd BufNewFile,BufRead *.json set ft=javascript

