" VimPlug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugins')
" Declare the list of plugins.
Plug 'ludovicchabant/vim-gutentags'
Plug 'rhysd/clever-f.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'unblevable/quick-scope'
Plug 'wellle/targets.vim'
if !exists('g:vscode')
    " vim/nvim only
    Plug 'airblade/vim-gitgutter'
    Plug 'dense-analysis/ale'
    Plug 'itchyny/lightline.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'luochen1990/rainbow'
    Plug 'maralla/completor.vim'
    Plug 'maximbaz/lightline-ale'
    Plug 'ptzz/lf.vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tmux-plugins/vim-tmux'
    Plug 'tomasiser/vim-code-dark'
    Plug 'voldikss/vim-floaterm'
    Plug 'wellle/context.vim'
    Plug 'yegappan/taglist'
    Plug 'yggdroot/indentLine'
    if has('nvim')
        Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-tree/nvim-web-devicons'
        Plug 'sindrets/diffview.nvim'
    endif
endif
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" plugin config
if !exists('g:vscode')
    colorscheme codedark
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
    let g:fzf_layout = { 'down': '40%' }
    let g:lightline = {
                \ 'colorscheme': 'powerlineish',
                \ 'active': {
                \   'left': [ [ 'mode', 'paste' ],
                \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
                \ },
                \ 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
                \            [ 'lineinfo' ],
	            \            [ 'percent' ],
	            \            [ 'fileformat', 'fileencoding', 'filetype'] ],
                \ 'component_function': {
                \   'gitbranch': 'FugitiveHead',
                \   'filetype': 'MyFiletype',
                \   'fileformat': 'MyFileformat',
                \ }
                \ }
    let g:lightline.component_expand = {
                \  'linter_checking': 'lightline#ale#checking',
                \  'linter_infos': 'lightline#ale#infos',
                \  'linter_warnings': 'lightline#ale#warnings',
                \  'linter_errors': 'lightline#ale#errors',
                \  'linter_ok': 'lightline#ale#ok',
                \ }
    let g:lightline.component_type = {
                \ 'linter_checking': 'right',
                \ 'linter_infos': 'right',
                \ 'linter_warnings': 'warning',
                \ 'linter_errors': 'error',
                \ 'linter_ok': 'right',
                \ }
    let g:indentLine_char_list = ['|', '¦', '┆', '┊']
    let g:indentLine_concealcursor = "nv"
    let g:rainbow_active = 1
endif

set nocompatible
syntax on               " syntax highlighting

set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]
set showcmd
set noshowmode
set mouse=a
if !has('nvim')
    if has("mouse_sgr")     " fix to allow resize with mouse inside tmux
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    end
endif
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
set fillchars+=diff:╱

" search
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set scrolloff=10        " always scroll to show context for search results


" keybindings
" fat fingers - shift key pressed too long
cabbrev Q quit
cabbrev Qa qa
cabbrev W write
cabbrev WQ wq
cabbrev Wq wq
if has('nvim')
    cabbrev dv DiffviewOpen
endif

if !exists('g:vscode')
    let mapleader = " "
    set timeoutlen=500
    nnoremap <F9> :ALEFix<CR>
    nnoremap <leader>b :Buffers<CR>
    nnoremap <leader>dd :DiffviewOpen<CR>
    nnoremap <leader>dh :DiffviewFileHistory<CR>
    nnoremap <leader>dg :diffget
    nnoremap <leader>dp :diffput
    nnoremap <leader>g :Rg <C-R><C-W><CR>
    nnoremap <leader>gb :Git blame<CR>
    nnoremap <leader>gd :Git diff<CR>
    nnoremap <leader>gs :Git status<CR>
    nnoremap <leader>r :call ToggleRelnumber()<CR>
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

    function! MyFiletype()
      return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
    endfunction

    function! MyFileformat()
      return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
    endfunction
endif
