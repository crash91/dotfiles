" VimPlug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugins')

" Declare the list of plugins.
Plug 'b4winckler/vim-angry'
Plug 'chrisbra/vim-autosave'
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kurkale6ka/vim-pairs'
Plug 'luochen1990/rainbow'
Plug 'maralla/completor.vim'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'rhysd/clever-f.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'unblevable/quick-scope'
Plug 'yegappan/taglist'
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
if has("mouse_sgr")     " fix to allow resize with mouse inside tmux
    set ttymouse=sgr
else
    set ttymouse=xterm2
end
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
set scrolloff=10        " always scroll to show context for search results

" project-specific vimrc
set exrc                " allow local vimrc files
set secure              " don't allow autocmd, shell and write commands in local vimrc files

" keybindings
let mapleader = " "
set timeoutlen=500
nnoremap <leader>r :call ToggleRelnumber()<CR>
nnoremap <leader>n :tabn<CR>
nnoremap <leader>p :tabp<CR>
nnoremap <leader>e :Explore<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>g :Rg <C-R><C-W><CR>
nnoremap <F9> :ALEFix<CR>
" termdebug
nnoremap <leader>w :call TermDebugSendCommand('where')<CR>
nnoremap <F5> :TermDebug<CR>
nnoremap <F10> :Over<CR>
nnoremap <F11> :Next<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

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
packadd! termdebug      " visual debugging with gdb 
let g:termdebug_wide=1
let g:lightline = { 'colorscheme': 'powerlineish' }
let g:ale_fixers = {
\ '*' : ['remove_trailing_lines', 'trim_whitespace'],
\ 'c': ['clang-format'],
\ 'python': ['black'],
\}
let g:ale_linters = {
\ 'c': ['cc', 'clangtidy'],
\ 'python': ['flake8'],
\}
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_python_flake8_options = "--ignore=E203,E501 --max-line-length 88"
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '❕'
let g:autosave_backup = '~/.vim/backup'
let g:autosave_timer = 60*3*1000
let g:fzf_layout = { 'down': '40%' }
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = "nv"
let g:rainbow_active = 1
