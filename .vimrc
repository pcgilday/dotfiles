"""""""""""""""""""""""""""""""""
" vim-plug config
"""""""""""""""""""""""""""""""""

" Initialise vim-plug
call plug#begin('~/.vim/plugged')

" load plugins
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
"Plug 'easymotion/vim-easymotion'
"Plug 'Valloric/YouCompleteMe'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'flowtype/vim-flow'
Plug 'vim-syntastic/syntastic'
Plug 'crusoexia/vim-monokai'
Plug 'tomasr/molokai'
Plug 'terryma/vim-multiple-cursors'
Plug 'suan/vim-instant-markdown'

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
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|coverage\|dist\|lib\|tmp$',
  \ 'file': '\.so$\|\.pyc$|\.dat$|\.DS_Store$'
  \ }

"
" vim-syntastic/syntastic
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Set passive mode and map check b/c check is slow as crap and we don't
" want it on every save.
" Consider switching to ALE (https://github.com/w0rp/ale) since it
" doesn't look like syntastic is going to get async support anytime
" soon. - https://github.com/vim-syntastic/syntastic/issues/699
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': []}
silent! nmap <F6> :SyntasticCheck<CR>

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_css_checkers = ['stylelint']
let g:syntastic_python_checkers = ['pylint']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '❌'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '⚠️'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

"
" flowtype/vim-flow
"
let g:flow#autoclose = 1
let g:flow#enable = 0

"
" plangloss/vim-javascript
"
let g:javascript_plugin_flow = 1

"
" mxw/vim-jsx
"
let g:jsx_ext_required = 0


""""""""""""""""""""""""""""""""""
" SETTINGS
""""""""""""""""""""""""""""""""""
syntax enable
" colorscheme molokai
colorscheme monokai
set t_Co=256

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
" set clipboard=unnamed

" Centralize backups, swapfiles and undo history
" set backupdir=~/.vim/backups
" set directory=~/.vim/swaps
" if exists("&undodir")
"    set undodir=~/.vim/undo
" endif

set nu
set hlsearch
set tw=72

set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4

" Send more characters for redraws
set ttyfast

" Enable mouse use in all modes
set mouse=a

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2

set statusline=%f
set statusline+=%m
set statusline+=%=
set statusline+=%l
set statusline+=/
set statusline+=%c

set splitbelow
set splitright

if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

""""""""""""""""""""""""""""""""""
" MAPPINGS
""""""""""""""""""""""""""""""""""

vnoremap <C-c> "*y
vnoremap <C-v> <C-r><C-p>*

