set mouse=a
set ttymouse=xterm2
set number

"NeoBundle
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" Required:
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'altercation/vim-colors-solarized'

filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

call neobundle#end()

""" unite.vim
" ファイル検索時に絶対パスを表示
let my_absolute_path = {
            \ 'is_selectable' : 1,
            \ }
function! my_absolute_path.func(candidates)
    let candidate = a:candidates[0]
    let path      = candidate.action__directory
    if candidate.kind == 'directory'
        let path = fnamemodify(path . '/../', ':p')
    else
        let path = fnamemodify(path, ':p:h') . '/'
    end
    call unite#start([['file'], ['file/new']],unite#get_context())
    call unite#mappings#narrowing(path)
endfunction
call unite#custom_action('file', 'absolute_path', my_absolute_path)
unlet my_absolute_path
inoremap <buffer><expr> <C-@> unite#do_action('absolute_path')
" 入力モードで開始する
let g:unite_enable_start_insert=1
" コマンドのショートカットを作成
cnoremap uf Unite<space>file
cnoremap ub Unite<space>buffer

" escが遠いので代用する。
noremap <C-j> <esc>
noremap! <C-j> <esc>

" tabをスペース4つに
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
if expand("%:t") =~ ".*\.twig"
    set tabstop=2
    set autoindent
    set expandtab
    set shiftwidth=2
endif

" twigのハイライト
set syntax=htmldjango

" twigの整形を有効に
autocmd BufNewFile,BufRead *.twig set filetype=html
augroup HighlightTrailingSpaces
autocmd!
autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" :の入れ替え(US配列用)
nnoremap ' :

" ステータスラインを常に表示
set laststatus=2

" カラーのテーマを指定
set background=dark
colorscheme solarized
