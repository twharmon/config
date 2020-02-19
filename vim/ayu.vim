set termguicolors
let ayucolor="mirage"
colorscheme ayu

let g:lightline.colorscheme = 'ayu'

function! ToggleBackground()
  set termguicolors
  if g:ayucolor == "light"
    let g:ayucolor="mirage"
  else
    let g:ayucolor="light"
  endif
  colorscheme ayu
  runtime autoload/lightline/colorscheme/ayu.vim
  execute 'source' globpath(&rtp, 'autoload/lightline/colorscheme/ayu.vim')
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction
