syntax on
filetype plugin on
" set relativenumber
set number
set noshowmode
set noshowcmd
set updatetime=200
set nowrap
set noswapfile
set laststatus=2
set showtabline=2
set mouse=nicr
set shortmess=flinxtToOs
set numberwidth=5
set nohlsearch
set completeopt+=noinsert
set list
set listchars=tab:\ \ ,trail:·
let mapleader = " "

inoremap <C-f> <C-x><C-o>
vmap Y y `]

nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

nmap <leader>def <Plug>(coc-definition)
nmap <leader>ref <Plug>(coc-references)
nmap <leader>ren <Plug>(coc-rename)
nmap <leader>fix <Plug>(coc-fix-current)
nmap <leader>inf :call CocAction('doHover')<CR>
nmap <leader>imp :call CocAction('runCommand', 'editor.action.organizeImport')<CR>
nmap <leader>fmt :call CocAction('format')<CR>

nmap <leader>c gcc
vmap <leader>c gc
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>w <C-W><C-W>
nnoremap <leader>ff :FZF<CR>
nnoremap <leader>rg :Rg<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>e <C-z>
nnoremap <leader>us :UltiSnipsEdit 

autocmd FileType go nnoremap <leader>t :!go test -covermode=atomic -coverprofile=/tmp/profile.out .<CR>
autocmd FileType go nnoremap <leader>run :!go run main.go<CR>

nnoremap <leader>gs :Git status<CR>
nnoremap <leader>ga :Git add .<CR>
nnoremap <leader>gb :Git branch
nnoremap <leader>gd :Gdiffsplit<CR>
nnoremap <leader>dg :diffget<CR>
nnoremap <leader>dp :diffput<CR>
nnoremap <expr> <leader>gco ':Git commit -m "' . input("Commit message: ") . '"<CR>:e<CR>'
nnoremap <leader>gch :Git checkout
nnoremap <leader>gm :Git merge

nmap <leader>1 <Plug>lightline#bufferline#go(1)
nmap <leader>2 <Plug>lightline#bufferline#go(2)
nmap <leader>3 <Plug>lightline#bufferline#go(3)
nmap <leader>4 <Plug>lightline#bufferline#go(4)
nmap <leader>5 <Plug>lightline#bufferline#go(5)
nmap <leader>6 <Plug>lightline#bufferline#go(6)
nmap <leader>7 <Plug>lightline#bufferline#go(7)
nmap <leader>8 <Plug>lightline#bufferline#go(8)
nmap <leader>9 <Plug>lightline#bufferline#go(9)
nmap <leader>0 <Plug>lightline#bufferline#go(10)

autocmd FileType css,scss,html,javascript,typescript,typescriptreact,javascriptreact setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd CompleteDone * pclose

augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
    autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
    autocmd BufNewFile,BufRead *.js set filetype=javascript
    autocmd BufNewFile,BufRead *.scss set filetype=scss
augroup END

call plug#begin('~/.vim/plugged')
Plug 'nvie/vim-flake8'
Plug 'omnisharp/omnisharp-vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'niklaas/lightline-gitdiff'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'mike-hearn/base16-vim-lightline'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'townk/vim-autoclose'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-eunuch'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
call plug#end()

let g:NERDSpaceDelims = 1
let g:NERDCreateDefaultMappings = 0

let g:lightline = {}
let g:lightline.active = {}
let g:lightline.active.right = [['columninfo'], ['lineinfo'], ['filetype']]
let g:lightline.active.left = [['mode', 'paste'], ['gitbranch', 'gitdiff', 'readonly', 'modified']]
let g:lightline.component = {}
let g:lightline.component.lineinfo = "%{printf('%03d / %03d', line('.'), line('$'))}"
let g:lightline.component.columninfo = "%02c"
let g:lightline.component_function = {'gitbranch': 'FugitiveHead'}
let g:lightline.tabline = {'left': [['buffers']], 'right': []}
let g:lightline.component_type = {'buffers': 'tabsel'}
let g:lightline.component_expand = {'gitdiff': 'lightline#gitdiff#get', 'buffers': 'lightline#bufferline#buffers'}
let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#filename_modifier = ':t'

set termguicolors

" let g:lightline.colorscheme = 'gruvbox'
" set background=dark
" let g:gruvbox_invert_selection = 0
" let g:gruvbox_inverse = 0
" hi! link tsxCloseTagName GruvboxBlue
" colorscheme gruvbox

" runtime autoload/lightline/colorscheme/gruvbox.vim
" call lightline#init()
" call lightline#colorscheme()
" call lightline#update()

let g:lightline.colorscheme = 'base16_default_dark'
let base16colorspace=256
colorscheme base16-default-dark

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-n>"
let g:UltiSnipsJumpBackwardTrigger="<C-p>"

let $FZF_DEFAULT_COMMAND = 'rg --files'

source ~/.config/nvim/coc.vim
