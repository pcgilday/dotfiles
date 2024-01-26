""" BASE SETTINGS
set nocompatible " less vi compatible; therefore, more useful
set splitbelow
set splitright
set ttyfast " Send more characters for redraws
set mouse=a "Enable mouse use in all modes
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set expandtab " indent using spaces instead of tabs
set tabstop=2
set shiftwidth=2
set showmatch
set number
set ignorecase
set smartcase " ignore case if search pattern is all lowercase, case-sensitive otherwise
set tw=72
" use ; not : for quicker command entry
nnoremap ; :
" set mapleader to <space>
nnoremap <SPACE> <Nop>
let mapleader=" "

""" MAPPINGS
" move up/down wrapped lines
map j gj
map k gk

" Pane navigation using vim nav commands
nnoremap <silent> <Leader>k :wincmd k<cr>
nnoremap <silent> <Leader>j :wincmd j<cr>
nnoremap <silent> <Leader>h :wincmd h<cr>
nnoremap <silent> <Leader>l :wincmd l<cr>

" use tab to go to matching delim
nnoremap <tab> %
vnoremap <tab> %

nnoremap <Leader>[ <C-o>
nnoremap <Leader>] <C-i>

" clear search highlights
nnoremap <Leader>c :nohl<cr>

" copy outside vim buffer
vnoremap <Leader>c "*y


""" SETUP PLUGINS VIA VIMPLUG
call plug#begin('~/dotfiles/.vim/plugged') " Initialise vim-plug

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'prabirshrestha/vim-lsp'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rhubarb' " enables GBrowse for github
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'github/copilot.vim'

" https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end() " Lock in the plugin list.

" Post plugin settings

colorscheme dracula

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


filetype plugin on
set omnifunc=syntaxcomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" " NERDTREE SETTINGS
nnoremap <Leader>b :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

nnoremap <Leader>p :silent %!prettier --stdin-filepath %<CR>


" FZF SETTINGS
" Places fzf window at bottom rather than overlay in middle
" let g:fzf_layout = { 'window': '10split enew' }
nmap <Leader>f :Files<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>a :Ag<CR>


" Commentary settings
nmap <Leader>/ :Commentary<CR>
vmap <Leader>/ :Commentary<CR>
nmap <Leader>/ :Commentary<CR>
