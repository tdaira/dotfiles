set mouse=a
set ttymouse=xterm2
set number

" Backspace delete options
set backspace=indent,eol,start

" Set default encoding
set encoding=utf-8

" Spell check
" set spell
" set spelllang=en,cjk

" Set color scheme
colorscheme iceberg

" Enable syntax color
syntax on

" Enable clipboard
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

" Remap escape
noremap <C-[> <esc>

" Tab with 4 spaces
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

" Show status bar every time
set laststatus=2

