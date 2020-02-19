let g:solarized_termcolors=256
set background=dark
colorscheme solarized

function! ToggleBackground()
  if &background == "dark"
    set background=light
  else
    set background=dark
  endif
  runtime autoload/lightline/colorscheme/solarized.vim
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

let g:lightline.colorscheme = 'solarized'
