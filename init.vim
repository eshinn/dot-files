" --------------------------------------------
" --- Initialization -------------------------
" --------------------------------------------

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
Plug 'neoclide/jsonc.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tommcdo/vim-fubitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
" Plug 'iloginow/vim-stylus'
" Plug 'posva/vim-vue'
" Plug 'mustache/vim-mustache-handlebars'
Plug 'mxw/vim-jsx'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
Plug 'pangloss/vim-javascript'
Plug 'nvim-lua/plenary.nvim'
Plug 'andythigpen/nvim-coverage'

" ColorDev
Plug 'cocopon/inspecthi.vim'

call plug#end()


" --------------------------------------------
" --- Tabs -----------------------------------
" --------------------------------------------

" set softtabstop=4


" --------------------------------------------
" --- Visuals --------------------------------
" --------------------------------------------

syntax enable

if has("termguicolors")
  set termguicolors
endif

colorscheme intrepid-raven

set foldcolumn=1

" --- Set Hybrid Line Numbers ----------------
set number relativenumber
" --- ...but not for terminals ---------------
au TermOpen * setlocal nonumber norelativenumber



" --------------------------------------------
" --- Controls -------------------------------
" --------------------------------------------

set splitbelow
set splitright
set foldmethod=indent
set clipboard=unnamed
" set buftype=

let mapleader = ','
nn <leader><space> :nohlsearch<cr>
nn <leader>buf :buffers<cr>:buffer<space>

" --- Add <cr> in normal mode Ctrl-m ---------
nn <c-m> a<c-m><esc>

" --- Window Navigation ----------------------
nn <C-h> <C-w><C-h>
nn <C-j> <C-w><C-j>
nn <C-k> <C-w><C-k>
nn <C-l> <C-w><C-l>



" --------------------------------------------
" --- Codium Mappers -------------------------
" --------------------------------------------
let g:codeium_manual = v:true
inoremap <C-Bslash> <Cmd>call codeium#CycleCompletions(1)<cr>
inoremap <C-]> <Cmd>call codeium#CycleCompletions(-1)<cr>
inoremap <C-Enter> <Cmd>call codeium#Complete()<cr>
inoremap <C-'> <Cmd>call codeium#Clear()<cr>



" --------------------------------------------
" --- Dev Helpers ----------------------------
" --------------------------------------------

nm <leader>wi :let @+=synIDattr(synID(line("."), col("."), 1), "name")<cr>:echo synIDattr(synID(line("."), col("."), 1), "name")<cr>
nm <leader>hi :Inspecthi<cr>
nm <leader>hs :InspecthiShowInspector<cr>
nm <leader>hh :InspecthiHideInspector<cr>



" --------------------------------------------
" --- Plugin Settings ------------------------
" --------------------------------------------

" --- Coc ------------------------------------
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
\ '@raidou/coc-prettier-v3',
\ 'coc-json',
\ 'coc-css',
\ 'coc-html',
\ 'coc-vetur',
\ 'coc-explorer',
\ 'coc-svg',
\ 'coc-highlight',
\ 'coc-styled-components',
\ 'coc-cfn-lint',
\ 'coc-yaml',
\ 'coc-java',
\ '@yaegassy/coc-pug'
\ ]
"  \ 'coc-prettier',

" --- FZF ------------------------------------
nn <silent> <C-p> :Files<cr>

" --- Coc-CR Confirm Completion --------------
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" --- Coc-Eslint -----------------------------
nm <silent> qf <Plug>(coc-eslint)

" --- Coc-Explorer ---------------------------
nmap <leader>m :CocCommand explorer<cr>

" --- Git Gutter -----------------------------
" set foldtext=gitgutter#fold#foldtext()
nm <silent> <leader>ggn :GitGutterNextHunk<cr>
nm <silent> <leader>ggp :GitGutterPrevHunk<cr>

" --- Vim-JavaScript -------------------------
let g:javascript_plugin_jsdoc = 1

" Set filetype for .js files to javascript
autocmd BufRead,BufNewFile *.js set filetype=javascript

" --- Nerd Commentor -------------------------
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = {
\ 'stylus': { 'left': '//' },
\ 'javascriptreact': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\ 'typescriptreact': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' }
\}

" --- NeoVim-Coverage ------------------------
nnoremap <leader>cl :CoverageLoad<CR>
nnoremap <leader>cs :CoverageShow<CR>
nnoremap <leader>ch :CoverageHide<CR>
nnoremap <leader>tt :CoverageToggle<CR>

lua << EOF
require('coverage').setup({
  auto_reload = true,
  load_coverage = {
    lcov = function()
      return require('coverage').load_lcov('coverage/lcov.info')
    end,
  },
  lang = {
    javascript = {
      coverage_file = "coverage/lcov.info"
    },
    ["javascript.jsx"] = {
      coverage_file = "coverage/lcov.info"
    }
  }
})
EOF

