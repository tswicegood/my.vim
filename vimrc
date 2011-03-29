" load up pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Set standard setting for PEAR coding standards
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nocompatible
" Auto expand tabs to spaces
set expandtab

" Auto indent after a {
set autoindent
set smartindent

filetype plugin indent on

" colorscheme ir_black
colorscheme jellybeans

" Pragmatic Markup Language should be rendered as XML
autocmd BufNew,BufRead *.pml set filetype=xml

" hide the toolbar
if has("gui_running")
    set guioptions=egmrt
endif

" turn on spelling with \s
map <silent> <leader>s :set spell!<CR>
set nospell

" turn the ruler stats on
set ruler

" turn beep off
set visualbell

" turn syntax highlighting on
syntax on

" turn on syntax highlighting for LessCSS
autocmd BufNew,BufRead *.less set filetype=lessc

" map fuzzy finder shortcuts
map <leader>b :FuzzyFinderBuffer<CR>

" make sure that git-vim can locate my Homebrew binary
let g:git_bin = "/usr/local/bin/git"

" load my github credentials
so ~/.vim/github_credentials.vim

" make sure the cursor is always in the middle
set scrolloff=10

" add in short cut for Nerd tree
map <leader>e :NERDTreeToggle<CR>
