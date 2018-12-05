""""""""""""""""""""""""""""""""
" vim-plug config
"""""""""""""""""""""""""""""""""

" Initialise vim-plug
call plug#begin('~/.vim/plugged')

" load plugins
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
" FIXME - remove vim-sensible so easier to see settings set
" Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
"Plug 'easymotion/vim-easymotion'
"Plug 'Valloric/YouCompleteMe'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
" Plug 'flowtype/vim-flow'
Plug 'tomasr/molokai'
Plug 'terryma/vim-multiple-cursors'
Plug 'suan/vim-instant-markdown'
Plug 'w0rp/ale'
Plug 'crusoexia/vim-monokai'
Plug 'croaker/mustang-vim'
Plug 'jparise/vim-graphql'
" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Lock in the plugin list.
call plug#end()

""""""""""""""""""""""""""""""""""""""
" PLUGIN CONFIGS
""""""""""""""""""""""""""""""""""""""

"
" ctrlpvim/ctrlp.vim
"
" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|coverage\|dist\|flow-typed\|lib\|tmp$',
  \ 'file': '\.so$\|\.pyc$|\.dat$|\.DS_Store$'
  \ }


" :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

let g:ale_fix_on_save = 1

" use shift - i to toggle
let NERDTreeShowHidden = 1

"
" scrooloose/nerdcommenter
"

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

"
" flowtype/vim-flow
"
" let g:flow#autoclose = 1
" let g:flow#enable = 0

"
" plangloss/vim-javascript
"
" enable flow syntax highlighting
let g:javascript_plugin_flow = 1

"
" mxw/vim-jsx
"
let g:jsx_ext_required = 0


""""""""""""""""""""""""""""""""""
" SETTINGS
""""""""""""""""""""""""""""""""""
set nocompatible " less vi compatible; therefore, more useful
set modelines=0 " prevent some security vulnerbilities, I don't use modelines

set t_Co=256 " moarr colors

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" colorscheme molokai
colorscheme monokai
" colorscheme mustang

set ruler
set wildmenu
" Change the mapleader from \ to ,
let mapleader=","


" set number " always show line numbers
set relativenumber " show relative line numbers
set incsearch " show search matches while typing
set hlsearch " highlight search terms
set showmatch
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent " always set autoindenting on
set copyindent " copy the previous indentation on autoindenting
set ignorecase
set smartcase " ignore case if search pattern is all lowercase, case-sensitive otherwise
set tw=72
set nobackup
set noswapfile

" tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab

set history=1000    " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title           " change the terminal's title
set visualbell      " don't beep
set noerrorbells    " don't beep

set pastetoggle=<F2> " toggle 'paste mode'


" FIXME
" set laststatus=2
" set statusline=lightsabre!
" set statusline=%f
" set statusline+=%m
" set statusline+=%=
" set statusline+=%l
" set statusline+=/
" set statusline+=%c

set splitbelow
set splitright

set ttyfast " Send more characters for redraws
set mouse=a " Enable mouse use in all modes
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

""""""""""""""""""""""""""""""""""
" MAPPINGS
""""""""""""""""""""""""""""""""""
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" use ; not : for quicker command entry
nnoremap ; :

" jj to escape insert mode
inoremap jj <ESC>

vnoremap <C-c> "*y
vnoremap <C-v> <C-r><C-p>*

" clear search highlights
nnoremap <C-c> :nohl<cr>

" use tab to go to matching delim
nnoremap <tab> %
vnoremap <tab> %

nnoremap <C-\> :NERDTreeToggle<CR>

" Pane navigation using vim nav commands
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-l> :wincmd l<CR>

" FZF
"nmap ; :Buffers<CR>
nmap <silent> <C-t> :Files<CR>
nmap <silent> <C-p> :Files<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>a :Ag<CR>

nmap <Leader>o :e %:h/

nmap <Leader>{ ysiw{<CR>

" setup set replace for word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
" TODO shortcut for :sort
" nmap <Leader>s :sort<CR>

" disable arrows to work on using vim nav/motion commands
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>

" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
