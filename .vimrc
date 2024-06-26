source ~/.vim/common.vim

set nocompatible
set mouse=a
set autoread
set backspace=indent,eol,start
set wildmenu
set wildoptions=pum,tagfile
set laststatus=2
set ruler
set ttimeout
set ttimeoutlen=50
set ttyfast
set showcmd

" cursor shape for insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Section: Plugins

call plug#begin('~/dotfiles/.vim/plugged')

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
Plug 'editorconfig/editorconfig-vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" Section: Post plugin settings

colorscheme dracula

"Section: editorconfig

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

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

" Section: Fugitive
nmap <Leader>gl :Gclog -n 100<CR>
nmap <Leader>gc :G commit -v<CR>
nmap <Leader>gb :G blame<CR>

" Section: LSP

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
    nmap <Leader>ca :LspCodeAction<cr>
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
