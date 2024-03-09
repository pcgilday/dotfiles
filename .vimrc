set nocompatible
set splitbelow
set splitright
set ttimeout
set ttimeoutlen=1
set ttyfast
set mouse=a
set backspace=indent,eol,start
set expandtab
set tabstop=2
set shiftwidth=2
set showmatch
set number
set relativenumber

vnoremap <Leader>c "*y

nnoremap ; :
" set leader to space
nnoremap <SPACE> <Nop>
let mapleader="\<space>"

" status line
set laststatus=2
set ruler

" cursor shape for insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" search settings
set ignorecase
set smartcase " ignore case if search pattern is all lowercase, case-sensitive otherwise
set incsearch
set hlsearch
nnoremap <Leader>c :nohl<cr>

" Navigation
map j gj
map k gk

" TODO: switch to ctrl-w hjkl so it works with virtual terminal
nnoremap <silent> <Leader>k :wincmd k<cr>
nnoremap <silent> <Leader>j :wincmd j<cr>
nnoremap <silent> <Leader>h :wincmd h<cr>
nnoremap <silent> <Leader>l :wincmd l<cr>

nnoremap <Leader>[ <C-o>
nnoremap <Leader>] <C-i>


""" SETUP PLUGINS VIA VIMPLUG
call plug#begin('~/dotfiles/.vim/plugged') " Initialise vim-plug

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'leafgarland/typescript-vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'github/copilot.vim'
Plug 'hashivim/vim-terraform'
Plug 'adelarsq/vim-matchit'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end() " Lock in the plugin list.

" Section: Post plugin settings

colorscheme dracula

" Section: Nerdtree
nnoremap <Leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

" Section: fzf
nmap <Leader>f :Files<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>a :Ag<CR>
nmap <Leader>b :Buffers<CR>

" Section: Commentary
nmap <Leader>/ :Commentary<CR>
vmap <Leader>/ :Commentary<CR>
nmap <Leader>/ :Commentary<CR>

" Section: Fugitive
nmap <Leader>gl :Gclog -n 100<CR>

"""
""" VIM-LSP SETTINGS
"""
if executable('typescript-language-server')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'typescript-language-server',
    \ 'cmd': {server_info->['typescript-language-server', '--stdio']},
    \ 'whitelist': ['typescript', 'typescriptreact'],
    \ })
endif

if executable('solargraph')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'solargraph',
    \ 'cmd': {server_info->['solargraph', 'stdio']},
    \ 'whitelist': ['ruby'],
    \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    " from docs, but don't want to enable yet
    " inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    " inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    " let g:lsp_format_sync_timeout = 1000
    " autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
