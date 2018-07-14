" Section for vim plugins
" Increase plugin install timeout
let g:plug_timeout = 1000

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" vim-airline status bar and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" solarized colorscheme
Plug 'micha/vim-colors-solarized'

" Better vim+tmux navigation
Plug 'christoomey/vim-tmux-navigator'

" Git indicators in vim gutter
Plug 'airblade/vim-gitgutter'

" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" NERDTree file explorer
Plug 'scrooloose/nerdtree'

" automatically close paired characters
Plug 'jiangmiao/auto-pairs'

" deoplete completion
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

" deoplete completion sources
Plug 'Shougo/neco-syntax'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/neco-vim'
Plug 'zchee/deoplete-zsh'

" Easily change surrounding characters
Plug 'tpope/vim-surround'

" ALE asynchronous linter
Plug 'w0rp/ale'

" Initialize plugin system
call plug#end()

let g:deoplete#enable_at_startup = 1

" Create the tags file for the entire project
command! MakeTags !ctags -R .

" Decrease vim updatetime so gitgutter updates faster
set updatetime=100

" initialize solarized colorscheme
syntax enable
set background=dark
colorscheme solarized

" No weirdness with swap files
set nobackup
set nowritebackup
set noswapfile

" Don't wrap lines
set nowrap

" Show incomplete commands
set showcmd

" Hybrid line numbers 
set number relativenumber

" Search options
" Lower case search case insensitive, upper case search case sensitive
set ignorecase
set smartcase

" Show the next match while entering the search string
set incsearch

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Make all buffers except netrw hidden
set hidden 

" Indent settings
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
    
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Make file commands search directories recursively
set path+=**

" Display all matching files upon tab completion
set wildmenu

" Show hidden files in fzf 
let $FZF_DEFAULT_COMMAND = 'find .'

" ALE config
let g:ale_fixers = {
 \'python': [ 'autopep8', 'trim_whitespace', 'yapf', 'isort', 'remove_trailing_lines' ]
 \}

" Keybindings
" Set leader key
let mapleader = " "

" Refresh .vimrc
nnoremap <leader>r :source ~/.vimrc<CR>

" Use arrow keys to navigate between buffers
nnoremap <Left> :bp<CR>
nnoremap <Right> :bn<CR>

" Close the current buffer
nnoremap <leader>x :bd<CR>

" Get off my lawn
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" FZF shortcuts
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>

" Toggle NERDTree file explorer
nnoremap <leader>d :NERDTreeToggle<CR>

" Switch between the last two files
nnoremap <leader><leader> <C-^>

" Toggle git gutter line highlights
nnoremap <leader>lh :GitGutterLineHighlightsToggle<CR>

" Fix current file with Ale
nmap <leader>af :ALEFix<CR> 
