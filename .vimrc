execute pathogen#infect()
syntax on
filetype plugin indent on
syntax enable
"set background=dark
"colorscheme solarized
"set colorcolumn=80
execute "set colorcolumn=" . join(range(81,335), ',')
highlight ColorColumn ctermbg=DarkGrey
set number
set hlsearch

"racer
"set hidden
"let g:racer_cmd = "/usr/local/dev/github/racer/target/release/racer"
"let $RUST_SRC_PATH="/usr/local/src/rustc-1.2.0/src"

"NERDtree
autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror

"NERDtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" close NERDtree when the buffer is empty
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"CTRL-t to toggle tree view with CTRL-t
nmap <silent> <C-t> :NERDTreeToggle<CR>
""Set F2 to put the cursor to the nerdtree
nmap <silent> <F2> :NERDTreeFind<CR>
"open a NERDTree automatically when vim starts up
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"enable mouse support
set mouse=a

" check file change every 4 seconds ('CursorHold') and reload the buffer upon
" detecting change
set autoread
au CursorHold * checktime

" move between splits
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_

" move in buffers
:nnoremap <C-n> :bnext<CR>
:nnoremap <C-p> :bprevious<CR>

" vim-numbertoogle
let g:NumberToggleTrigger = "<C-M>"

" elm autocompile
":au BufWritePost *.elm ElmMakeFile("Main.elm")
" elm show docs
let g:elm_make_main_file = "src/Main.elm"
au FileType elm nmap <leader>b <Plug>(elm-make)
au FileType elm nmap <leader>m <Plug>(elm-make-main)
au FileType elm nmap <leader>t <Plug>(elm-test)
au FileType elm nmap <leader>r <Plug>(elm-repl)
au FileType elm nmap <leader>d <Plug>(elm-show-docs)
au FileType elm nmap <leader>e <Plug>(elm-error-detail)
au FileType elm nmap <leader>w <Plug>(elm-browse-docs)

" AutoSave
let g:auto_save_in_insert_mode = 0
au FileType elm let g:auto_save = 1

" Tab, untab paragraphs
vmap <Tab> >gv
vmap <S-Tab> <gv

" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab
" always uses spaces instead of tab characters
set expandtab
" size of an "indent"
set shiftwidth=4
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4
