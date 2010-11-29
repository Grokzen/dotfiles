" = Plugin: Command-T
set runtimepath+=~/.vim/plugin-command-t-1.0
let g:CommandTMaxHeight=10

" = Plugin: SnipMate
set runtimepath+=~/.vim/plugin-snipmate-0.83
set runtimepath+=~/.vim/plugin-snipmate-0.83/after
let g:snippets_dir="~/.vim/snippets"

" = Plugin: vcscommand
set runtimepath+=~/.vim/plugin-vcscommand-1.99.42

" = Wildcard
set wildignore=*.pyc

" = Filetype autodetection
filetype plugin indent on

" = Spell checking
set spell

" = Search options 
set ignorecase
set smartcase
set hlsearch
set incsearch

" = Tab settings 
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab

" = Indent option
set smartindent

" = Text display options
set textwidth=79
set scrolloff=3

" = Mappings 
map <F11> :set syntax=mail<CR>
map <F12> :set spelllang=sv<CR>
nmap <Space> <C-f>
nmap <S-Space> <C-b>
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>

" = Tags 
" Search for tags file upwards until home dir
set tags=./tags;~/

" = Autocommand clear 
autocmd!

" = Projects

" Examples:
"
" function! SetupCompilerForProjFoo()
"     compiler pyunit
"     setlocal makeprg=python\ ~/proj-foo/tests/run.py
" endfunction
" autocmd BufWritePost ~/proj-foo/* :make
" autocmd BufReadPost ~/proj-foo/* call SetupCompilerForProjFoo()

function! FoldMethodForVimrc()
    setlocal foldmethod=expr
    setlocal foldexpr=getline(v:lnum)=~'^\"\ =\ '?'>1':1
endfunction
autocmd BufWritePost ~/.vim/* source ~/.vimrc
autocmd BufReadPost ~/.vim/vimrc call FoldMethodForVimrc()
autocmd BufReadPost ~/.vim/projects.vim call FoldMethodForVimrc()

if filereadable(expand("~/.vim/projects.vim"))
    source ~/.vim/projects.vim
endif

" = UI 
syntax enable
colorscheme murphy
set laststatus=2      " Always show status line for a window

if has("gui_running")
    set guioptions-=T " Hide toolbar
    set guioptions+=c " Use console dialogs
    set guioptions-=m " Hide menu bar
    set guioptions-=r " Hide right scroll bar
    set guioptions-=R
    set guioptions-=l " Hide left scroll bar
    set guioptions-=L
    colorscheme candycode
endif

" = Local

if filereadable(expand("~/.vim/local.vim"))
    source ~/.vim/local.vim
endif
