if !has('gui_running') && &t_Co < 256
  finish
endif

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'intrepid-raven'

" hi Normal  	guibg=NONE guifg=#ffffff guisp=#990000 gui=undercurl
hi Normal  	guibg=#0e0713
hi EndOfBuffer	guibg=bg guifg=bg

hi LineNr	guibg=NONE guifg=#594880
hi FoldColumn	guibg=NONE
hi! link Folded Pmenu

" hi Pmenu 	guibg=#09020f guifg=#7957c4 
hi Pmenu 	guibg=#09020f guifg=#594880 
hi PmenuSel 	guibg=#16091a guifg=#a564b9 

hi VertSplit	guibg=#09020f guifg=#09020f
hi StatusLine	guibg=#09020f guifg=#594880 gui=NONE,bold
hi StatusLineNC	guibg=#09020f guifg=#594880 gui=NONE

" hi! link VertSplit PmenuSel
" hi! link StatusLine Pmenu
" hi! link StatusLineNC Pmenu
" hi! link Statement Normal
" hi! link StatusLine Normal
