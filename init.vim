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
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
call plug#end()

" -------------------------------------------
" -- Visuals --------------------------------
" -------------------------------------------

syntax enable
set relativenumber

" -------------------------------------------
" -- Controls -------------------------------
" -------------------------------------------

set splitbelow
set splitright

let mapleader = ','
nmap <C-H> <C-W><C-H>
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <Leader><space> :nohlsearch<cr>
nmap <Leader>f :buffers<cr>:buffer<space>

" -------------------------------------------
" -- Coc ------------------------------------
" -------------------------------------------
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" -------------------------------------------
" -- Nerd Commentor -------------------------
" -------------------------------------------
" let g:NERDDefaultAlign = 'left'
" let g:NERDSpaceDelims = 1
" let g:NERDCustomDelimiters = {
"  \   'stylus': { 'left': '//' }
"  \ }
