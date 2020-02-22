let g:lightline.colorscheme = 'gruvbox'
set termguicolors
let g:gruvbox_invert_selection = 0
let g:gruvbox_inverse = 0
hi! link tsxCloseTagName GruvboxBlue
set background=light
colorscheme gruvbox

function! ToggleBackground()
  if &background == "dark"
    set background=light
  else
    set background=dark
  endif
  runtime autoload/lightline/colorscheme/gruvbox.vim
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

call ToggleBackground()

