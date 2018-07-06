" Section for vim plugins
" Increase plugin install timeout
let g:plug_timeout = 1000

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" NERDTree file explorer
Plug 'scrooloose/nerdtree'

" fzf fuzzy file finder
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" vim-airline status bar and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" solarized colorscheme
Plug 'micha/vim-colors-solarized'

" YouCompleteMe autocompletion
Plug 'Valloric/YouCompleteMe'

" Better vim+tmux navigation
Plug 'christoomey/vim-tmux-navigator'

" Initialize plugin system
call plug#end()

" Close vim if only a NERDTree tab is left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Automatically open NERDTree if vim is opened with a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" initialize solarized colorscheme
syntax enable
set background=dark
colorscheme solarized

" No weirdness with swap files
set nobackup
set nowritebackup
set noswapfile

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

" Highlight search matches
set hlsearch

" Press return to clear highlighting after a search
nnoremap <CR> :nohlsearch<CR><CR>

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
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

" Keybindings
" Set leader key
let mapleader = " "

" Toggle NERDTree
map <leader>d  :NERDTreeToggle<CR>

" Run fzf fuzzy finder
map <leader>f :Files<CR>
map <leader>b :Buffers<CR>
map <leader>l :Lines<CR>

" Refresh .vimrc
map <leader>r :source ~/.vimrc<CR>

" Use arrow keys to navigate between buffers
nnoremap <Left> :bp<CR>
nnoremap <Right> :bn<CR>

" Get off my lawn
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
