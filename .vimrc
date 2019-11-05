set nocompatible				"We want the latest Vim settings/options.

"Setup Plugin Manager Here.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'moll/vim-node'
Plug 'iloginow/vim-stylus'
Plug 'pangloss/vim-javascript'
Plug 'ryanoasis/vim-devicons'
Plug 'bling/vim-bufferline'
Plug 'mattn/emmet-vim'
Plug 'https://github.com/m-kat/aws-vim'
Plug 'jiangmiao/auto-pairs'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'leafgarland/typescript-vim'
Plug 'dense-analysis/ale'

call plug#end()

set clipboard=unnamed
" set pyxversion=3
" let g:python3_host_prog='/usr/local/bin/python3'

"---------------------------------------"
"--- Visuals ---------------------------"
"---------------------------------------"

syntax enable

set relativenumber
set hlsearch
set incsearch
set encoding=utf-8

if has("termguicolors")
  set termguicolors
endif

colorscheme eshinn

set splitbelow
set splitright
set guioptions=
set foldcolumn=1

hi Normal guibg=NONE
hi LineNr guibg=NONE
hi EndOfBuffer guibg=NONE
hi CurshorLineNr guibg=NONE
hi ColorColumn guibg=#ffffff
hi foldcolumn guibg=NONE
hi vertsplit guifg=bg guibg=NONE

"---------------------------------------"
"--- Controls --------------------------"
"---------------------------------------"

let mapleader = ','
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>
nmap <Leader>m :NERDTreeToggle<cr>
nmap <Leader><space> :nohlsearch<cr>
nmap <Leader>f :buffers<CR>:buffer<Space>

"---------------------------------------"
"--- Vim-Node --------------------------"
"---------------------------------------"

" nmap <buffer>:


"---------------------------------------"
"--- Nerd Commentor --------------------"
"---------------------------------------"

 let g:NERDDefaultAlign = 'left'
 let g:NERDSpaceDelims = 1
 let g:NERDCustomDelimiters = {
   \ 'stylus': { 'left': '//' }
 \ }

"---------------------------------------"
"--- Nerd Tree -------------------------"
"---------------------------------------"

let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.swp$', '\.git$']
let NERDTreeQuitOnOpen = 1

"---------------------------------------"
"--- Deoplete --------------------------"
"---------------------------------------"

let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"---------------------------------------"
"--- Fuzzy Finder ----------------------"
"---------------------------------------"

nmap <C-P> :FZF<cr>

"---------------------------------------"
"--- Ag SilverSearcher -----------------"
"---------------------------------------"

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" command! -bang -nargs=* AgWord call fzf#vim#ag(<q-args>, '--word-regexp', <bang>0)

"---------------------------------------"
"--- Airline----------------------------"
"---------------------------------------"

let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

"---------------------------------------"
"--- Ale -------------------------------"
"---------------------------------------"

let g:ale_completion_enabled = 1
let g:ale_completion_tsserver_autoimport = 1
let g:ale_sign_highlight_linenrs = 1
let g:ale_sign_error = '👾'
let g:airline#extensions#ale#enabled = 1
