" VimPlug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugins')

" Declare the list of plugins.
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'luochen1990/rainbow'
Plug 'maralla/completor.vim'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'ryanoasis/vim-devicons'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'yggdroot/indentLine'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


set nocompatible
" general config 
colorscheme codedark
syntax on               " syntax highlighting

set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]
set showcmd
set noshowmode
set mouse=a
set number
set guioptions+=a 
set ruler               " show file stats
set autoread            " reload externally modified files
set noswapfile
set nobackup
set nowb

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
" auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" search
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" keybindings 
let mapleader = " "
set timeoutlen=500
map <leader>r :call ToggleRelnumber()<CR>
map <leader>n :tabn<CR>
map <leader>p :tabp<CR>
map <leader>e :Explore<CR>
map <leader>f :Files<CR>
map <leader>b :Buffers<CR>
map <leader>g :Rg<CR>
nnoremap <F9> :Black<CR>
nmap <silent> <C-e> <Plug>(ale_next_wrap)

" netrw tweaks
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=3
let g:netrw_winsize=15

" complete with tab instead
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" functions 
function! ToggleRelnumber()
    set norelativenumber!
endfunction

" plugins 
let g:lightline = { 'colorscheme': 'powerlineish' }
let g:ale_fixers = {
\ '*' : ['remove_trailing_lines', 'trim_whitespace'],
\ 'c': ['clang-format'],
\ 'python': ['black'],
\}
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '❕'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.4, 'border': 'rounded', 'yoffset': 1.0} }
let g:rainbow_active = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

