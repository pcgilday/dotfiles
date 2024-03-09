nnoremap ; :
" set leader to space
nnoremap <SPACE> <Nop>
let mapleader="\<space>"

set number
set relativenumber
set splitbelow
set splitright
set expandtab
set tabstop=2
set shiftwidth=2
set showmatch

" Section: Search settings

set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <Esc> :nohl<cr>

" Section: Navigation settings

map j gj
map k gk
nnoremap <silent> <Leader>k :wincmd k<cr>
nnoremap <silent> <Leader>j :wincmd j<cr>
nnoremap <silent> <Leader>h :wincmd h<cr>
nnoremap <silent> <Leader>l :wincmd l<cr>
nnoremap <Leader>[ <C-o>
nnoremap <Leader>] <C-i>

" Section: Worfklow settings

" Copy to global clipboard
vnoremap <Leader>c "*y
