set nocompatible				"We want the latest Vim settings/options.

so ~/.vim/plugins.vim


set clipboard=unnamed
syntax enable

set backspace=indent,eol,start			"Make backspace behave like every other editor."
let mapleader = ','				"Sets <Leader> to be forward-slash /"
set number					"Let's activate line numbers."
set encoding=utf8
set guifont=Source_Code_Pro_for_Powerline:h12
if (has("termguicolors"))
  set termguicolors 
endif

"--------------------------------"
"--- Visuals --------------------"
"--------------------------------"

colorscheme moody
set splitbelow
set splitright
hi LineNr guibg=bg

" Fake custom left-padding
set foldcolumn=1
hi foldcolumn guibg=bg

hi vertsplit guifg=bg guibg=bg



"--------------------------------"
"--- Search ---------------------"
"--------------------------------"

set hlsearch
set incsearch



"--------------------------------"
"--- Mappings -------------------"
"--------------------------------"

" Make it easy to edit the .vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>
" Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>
nmap <Leader>t :NERDTreeToggle<cr>
nmap <C-R> :CtrlPBufTag<cr>
nmap <C-E> :CtrlPMRUFiles<cr>
nmap <Leader>f :tags<space>


"--------------------------------"
"--- Plugins --------------------"
"--------------------------------"

" CtrlP
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"/ NERDTree
let NERDTreeHijackNetrw = 0

" Airline
let g:airline_powerline_fonts = 1

" The Nerd Commenter
filetype plugin on

"--------------------------------"
"--- Auto-Commands --------------"
"--------------------------------"

" Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END


"--------------------------------"
"--- Nerd Icons -----------------"
"--------------------------------"
"set encoding=utf8
"set guifont=DroidSansMono\ Nerd\ Font\ 11



" Notes and Tips
" - Press 'zz' to instantly center the line where the cursor is located.
" - Crtl+] takes me to a ctag the cursor is on
" - Ctrl+^ brings me back from the previous Ctrl+]
"
" - vi' VisuallySelect Inside quote(')
" - di' Delete inside quote(')
" - da( Delete inside AND the parens'('
