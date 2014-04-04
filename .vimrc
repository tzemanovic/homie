execute pathogen#infect()

set encoding=utf-8
syntax enable
filetype plugin indent on
set background=dark
" colorscheme solarized
set number
set autoindent

" space for tab
set expandtab
" 4 spaces for tab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" nagivating between splits
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" " GHC plugin autocommand
" "au BufEnter *.hs compiler ghc
" " hdevtools
" au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
" au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
"
" vim-airline show all the time
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tomorrow'
set ttimeoutlen=50
