" Plugin manager (vim-plug)
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
call plug#end()

" Git diff sign column settings
set signcolumn=yes
let g:gitgutter_terminal_reports_focus = 0
augroup gitgutter_custom
  autocmd!
  autocmd VimEnter * autocmd! gitgutter CursorHold,CursorHoldI
  autocmd BufReadPost,BufWritePost * GitGutter
augroup END

set mouse=a
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
if has('clipboard')
  if system('uname -s') == "Darwin\n"
    set clipboard=unnamed "OSX
  else
    set clipboard=unnamedplus "Linux
  endif
endif

" Tab with 4 spaces
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

" Show status bar every time
set laststatus=2

