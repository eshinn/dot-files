" -------------------------------------------
" -- Initialization -------------------------
" -------------------------------------------

set clipboard=unnamed

" Setup Plugin Manager
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs 
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
call plug#end()



" -------------------------------------------
" -- Visuals --------------------------------
" -------------------------------------------

syntax enable
set relativenumber

if has("termguicolors")
  set termguicolors
endif



" -------------------------------------------
" -- Controls -------------------------------
" -------------------------------------------

set splitbelow
set splitright
set foldmethod=syntax

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



" -------------------------------------------
" -- Dev Helpers ----------------------------
" -------------------------------------------

nm <Leader>wi :let @+=synIDattr(synID(line("."), col("."), 1), "name")<cr>:echo synIDattr(synID(line("."), col("."), 1), "name")<cr>



" -------------------------------------------
" -- Plugin Settings ------------------------
" -------------------------------------------

" -- Coc ------------------------------------
nm <silent> gd <Plug>(coc-definition)
nm <silent> gy <Plug>(coc-type-definition)
nm <silent> gi <Plug>(coc-implementation)
nm <silent> gr <Plug>(coc-references)

" -- Nerd Commentor -------------------------
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = {
 \   'stylus': { 'left': '//' }
 \ }
