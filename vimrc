colorscheme codedark
syntax on " syntax highlighting

set cursorline " highlight current line
set showmatch           " highlight matching [{()}]
set showcmd
set noshowmode
set mouse=a
set number
set guioptions+=a 
set ruler " show file stats

filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set laststatus=2        " vim-lightline
set showtabline=2

" whitespace
set tabstop=4 
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set autoindent

" search
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" config
let mapleader = " "
set timeoutlen=500
map <leader>r :call ToggleRelnumber()<CR>
map <leader>n :tabn<CR>
map <leader>p :tabp<CR>
map <leader>e :Explore<CR>

let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=3
let g:netrw_winsize=15

" functions
function! ToggleRelnumber()
    set norelativenumber!
endfunction

" plugins
let g:lightline = { 'colorscheme': 'powerlineish' }
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" VimPlug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugins')

" Declare the list of plugins.
Plug 'itchyny/lightline.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'


" List ends here. Plugins become visible to Vim after this call.
call plug#end()

