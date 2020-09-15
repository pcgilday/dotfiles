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
set relativenumber " show relative line numbers
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

" clear search highlights
nnoremap <Leader>c :nohl<cr>

" copy outside vim buffer
vnoremap <Leader>c "*y


""" SETUP PLUGINS VIA VIMPLUG
call plug#begin('~/.vim/plugged') " Initialise vim-plug

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'json', 'xml']}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " enables GBrowse for github
Plug 'vim-airline/vim-airline'
" Plug 'reedes/vim-pencil'

" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

call plug#end() " Lock in the plugin list.


colorscheme dracula


""" COC.NVIM SETTINGS
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" NERDTREE SETTINGS
nnoremap <Leader>\ :NERDTreeToggle<CR> 
let NERDTreeShowHidden = 1


" FZF SETTINGS
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>a :Ag<CR>


" Commentary settings
nmap <Leader>/ :Commentary<CR>
vmap <Leader>/ :Commentary<CR>
nmap <Leader>/ :Commentary<CR>

""" AIRLINE
" let g:airline_section_a=''
" let g:airline_section_b=''
let g:airline_section_x=''
let g:airline_section_y=''
let g:airline_section_z = '%3l/%L:%3v'
" use shortform text for modes
let g:airline_mode_map = {
    \ '__'     : '-',
    \ 'c'      : 'C',
    \ 'i'      : 'I',
    \ 'ic'     : 'I',
    \ 'ix'     : 'I',
    \ 'n'      : 'N',
    \ 'multi'  : 'M',
    \ 'ni'     : 'N',
    \ 'no'     : 'N',
    \ 'R'      : 'R',
    \ 'Rv'     : 'R',
    \ 's'      : 'S',
    \ 'S'      : 'S',
    \ ''     : 'S',
    \ 't'      : 'T',
    \ 'v'      : 'V',
    \ 'V'      : 'V',
    \ ''     : 'V',
    \ }


""" vim-jsx-typescript

" using dracula theme colors for 
hi tsxTagName ctermfg=212
hi tsxCloseTagName ctermfg=212
hi tsxComponentName ctermfg=159 cterm=italic
hi tsxCloseComponentName ctermfg=159 cterm=italic
" hi tsxTag ctermfg=210
" hi tsxCloseTag ctermfg=210
hi tsxAttrib ctermfg=120 cterm=italic

" hi tsxString ctermfg=120
" hi tsxCloseString ctermfg=120

hi tsxAttributeBraces ctermfg=212
hi tsxEqual ctermfg=212
"
" hi ReactState ctermfg=120
" hi ReactProps ctermfg=120
" hi ApolloGraphQL guifg=#CB886B
" hi Events ctermfg=204 guifg=#56B6C2
" hi ReduxKeywords ctermfg=204 guifg=#C678DD
" hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
" hi WebBrowser ctermfg=204 guifg=#56B6C2
" hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66

