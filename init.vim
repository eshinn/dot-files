" -------------------------------------------
" -- Initialization -------------------------
" -------------------------------------------

" Install vim-plug if not already installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl 
	\ -fLo ~/.config/nvim/autoload/plug.vim 
	\ --create-dirs 
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'iloginow/vim-stylus'

" Dart/Flutter
Plug 'dart-lang/dart-vim-plugin'
" Plug 'thosakwe/vim-flutter'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'

" ColorDev
Plug 'cocopon/inspecthi.vim'
call plug#end()



" -------------------------------------------
" -- Visuals --------------------------------
" -------------------------------------------

syntax enable

if has("termguicolors")
  set termguicolors
endif

colorscheme intrepid-raven

set foldcolumn=1

" -- Set Hybrid Line Numbers ----------------
set number relativenumber
" -- ...but not for terminals ---------------
au TermOpen * setlocal nonumber norelativenumber




" -------------------------------------------
" -- Controls -------------------------------
" -------------------------------------------

set splitbelow
set splitright
set foldmethod=indent
set clipboard=unnamed

let mapleader = ','
nn <Leader><space> :nohlsearch<cr>
nn <Leader>f :buffers<cr>:buffer<space>

" -- Window Navigation ----------------------
nn <C-h> <C-w><C-h>
nn <C-j> <C-w><C-j>
nn <C-k> <C-w><C-k>
nn <C-l> <C-w><C-l>

" -- FZF ------------------------------------
nm <C-p> :FZF<cr>

" -- Coc-Explorer ---------------------------
nmap <Leader>m :CocCommand explorer<cr>



" -------------------------------------------
" -- Dev Helpers ----------------------------
" -------------------------------------------

nm <Leader>wi :let @+=synIDattr(synID(line("."), col("."), 1), "name")<cr>:echo synIDattr(synID(line("."), col("."), 1), "name")<cr>
nm <Leader>hi :Inspecthi<cr>
nm <Leader>hs :InspecthiShowInspector<cr>
nm <Leader>hh :InspecthiHideInspector<cr>



" -------------------------------------------
" -- Plugin Settings ------------------------
" -------------------------------------------

" -- Coc ------------------------------------
set updatetime=300
nm <silent> gd <Plug>(coc-definition)
nm <silent> gy <Plug>(coc-type-definition)
nm <silent> gi <Plug>(coc-implementation)
nm <silent> gr <Plug>(coc-references)
nm <silent> rn <Plug>(coc-rename)
nm <silent> rf <Plug>(coc-refactor)
nm <silent> [g <Plug>(coc-diagnostic-prev)
nm <silent> ]g <Plug>(coc-diagnostic-next)

" Scavanged from github.com/weirongxu/dotvim/blob/master/plugins-conf/coc.rc.vim
let g:coc_global_extensions = [
\ 'coc-marketplace',
\ 'coc-explorer',
\ 'coc-tsserver',
\ 'coc-json',
\ 'coc-css',
\ 'coc-html',
\ 'coc-yaml',
\ 'coc-svg',
\ 'coc-flutter',
\ ]
" \ 'coc-tslint-plugin',
" \ 'coc-vimlsp',
" \ 'coc-lists',
" \ 'coc-vetur',
" \ 'coc-eslint',
" \ 'coc-prettier',
" \ 'coc-tag',
" \ 'coc-dictionary',
" \ 'coc-word',
" \ 'coc-syntax',
" \ 'coc-jest',
" \ 'coc-emoji',
" \ 'coc-emmet',
" \ 'coc-highlight',
" \ 'coc-ultisnips',
" \ 'coc-phpls',
" \ 'coc-solargraph',
" \ 'coc-vimtex',
" \ 'coc-calc',
" \ 'coc-pairs',
" \ 'coc-git',
" \ 'coc-import-cost',
" \ 'coc-go',
" \ 'coc-docker',
" \ 'coc-rust-analyzer',
" \ 'coc-actions',
  
" -- ALE ------------------------------------
let g:ale_disable_lsp = 1

" -- Git Gutter -----------------------------
set foldtext=gitgutter#fold#foldtext()
nm <silent> ,ggn :GitGutterNextHunk<cr>
nm <silent> ,ggp :GitGutterPrevHunk<cr>

" -- Nerd Commentor -------------------------
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = {
\ 'stylus': { 'left': '//' },
\ 'javascriptreact': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\ 'typescriptreact': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' }
\}
