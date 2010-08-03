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
colorscheme busybee
autocmd BufNew,BufRead *.pml set filetype=xml

" hide the toolbar
if has("gui_running")
    set guioptions=egmrt
endif

" turn on spelling
syn spell toplevel
set spell spelllang=en_us

" turn the ruler stats on
set ruler

" turn beep off
set visualbell

" turn on syntax highlighting for LessCSS
autocmd BufNew,BufRead *.less set filetype=lessc

" map fuzzy finder shortcuts
map <leader>t :FuzzyFinderTextMate<CR>
map <leader>b :FuzzyFinderBuffer<CR>

" add in support for vork highlight
so ~/.vim/vork.vim
