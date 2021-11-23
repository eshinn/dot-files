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

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'iloginow/vim-stylus'

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
nn <leader><space> :nohlsearch<cr>
nn <leader>buf :buffers<cr>:buffer<space>

" -- Add <cr> in normal mode Ctrl-m ---------
nn <c-m> a<c-m><esc>

" -- Window Navigation ----------------------
nn <C-h> <C-w><C-h>
nn <C-j> <C-w><C-j>
nn <C-k> <C-w><C-k>
nn <C-l> <C-w><C-l>



" -------------------------------------------
" -- Dev Helpers ----------------------------
" -------------------------------------------

nm <leader>wi :let @+=synIDattr(synID(line("."), col("."), 1), "name")<cr>:echo synIDattr(synID(line("."), col("."), 1), "name")<cr>
nm <leader>hi :Inspecthi<cr>
nm <leader>hs :InspecthiShowInspector<cr>
nm <leader>hh :InspecthiHideInspector<cr>



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
\ 'coc-tsserver',
\ 'coc-eslint',
\ 'coc-json',
\ 'coc-css',
\ 'coc-html',
\ 'coc-yaml',
\ 'coc-explorer',
\ 'coc-svg',
\ ]

" -- FZF ------------------------------------
nm <silent> <C-p> :Files<cr>

" -- Coc-Eslint -----------------------------
nm <silent> qf <Plug>(coc-eslint)

" -- Coc-Explorer ---------------------------
nmap <leader>m :CocCommand explorer<cr>

" -- Git Gutter -----------------------------
" set foldtext=gitgutter#fold#foldtext()
nm <silent> <leader>ggn :GitGutterNextHunk<cr>
nm <silent> <leader>ggp :GitGutterPrevHunk<cr>

" -- Nerd Commentor -------------------------
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = {
\ 'stylus': { 'left': '//' },
\ 'javascriptreact': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\ 'typescriptreact': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' }
\}
