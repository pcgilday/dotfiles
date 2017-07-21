source ~/.vim/bootstrap.vim

syntax enable
colorscheme monokai
set t_Co=256

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

vnoremap <C-c> "*y
vnoremap <C-v> <C-r><C-p>*

