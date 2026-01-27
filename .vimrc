" Plugin manager (vim-plug)
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

" LSP settings
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> K <plug>(lsp-hover)
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
endfunction

augroup lsp_install
  autocmd!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
  autocmd User lsp_setup call lsp#activate()
augroup END

" LSP performance settings
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_document_code_action_signs_enabled = 0

" Auto-close quickfix/location list after selecting an entry
augroup auto_close_loclist
  autocmd!
  autocmd FileType qf nnoremap <buffer> <silent> <CR> <CR>:cclose<CR>:lclose<CR>
augroup END

" Git diff sign column settings
set signcolumn=yes
let g:gitgutter_terminal_reports_focus = 0
let g:gitgutter_highlight_lines = 1
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
set termguicolors
colorscheme iceberg

" Enable syntax color
syntax on
set re=0
set redrawtime=10000

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

