if !has('gui_running') && &t_Co < 256
  finish
endif

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'intrepid-raven'

hi TabLine	guibg=NONE guifg=#645873 gui=NONE
hi TabLineFill 	guibg=NONE guifg=#09020f gui=NONE
hi TabLineSel	guibg=NONE guifg=#8879d0 gui=NONE
" hi BufTabLineCurrent	guibg=NONE guifg=NONE
" hi BufTabLineActive	guibg=NONE guifg=NONE
" hi BufTabLineHidden	guibg=NONE guifg=NONE
" hi BufTabLineFill	guibg=NONE guifg=NONE

hi Normal  	guibg=#0e0713 guifg=#8879d0
" hi Normal  	guibg=#0e0713 guifg=#5b2997
hi EndOfBuffer	guibg=bg guifg=bg

hi LineNr	guibg=NONE guifg=#482657
hi CursorLineNr	guibg=NONE guifg=#6c3c82
hi FoldColumn	guibg=NONE guifg=#6c3c82
hi Folded	guibg=#09020f guifg=#3a2b5b

" hi Pmenu 	guibg=#09020f guifg=#7957c4 
hi Pmenu 	guibg=#09020f guifg=#594880 
hi PmenuSel 	guibg=#16091a guifg=#a564b9 

" hi VertSplit	guibg=#09020f guifg=#09020f
hi VertSplit	guibg=NONE guifg=#09020f
hi StatusLine	guibg=#09020f guifg=#594880 gui=NONE,bold
hi StatusLineNC	guibg=#09020f guifg=#594880 gui=NONE

hi Statement	guibg=NONE guifg=#bebba5
" hi Statement	guibg=NONE guifg=#5b2997
hi Type	guibg=NONE guifg=#5fb073
hi Special	guibg=NONE guifg=#cf07d5
" hi Identifier	guibg=NONE guifg=#5d2c99 gui=NONE
hi Identifier	guibg=NONE guifg=#7334bd gui=NONE
hi Constant	guibg=NONE guifg=#d5d207
hi Comment	guibg=NONE guifg=#3d3548

" hi! link VertSplit PmenuSel
" hi! link StatusLine Pmenu
" hi! link StatusLineNC Pmenu
" hi! link Statement Normal
" hi! link StatusLine Normal

hi! link SignColumn LineNr
hi GitGutterAdd		guifg=#009900
hi GitGutterChange	guifg=#bbbb00
hi GitGutterDelete	guifg=#ff2222
