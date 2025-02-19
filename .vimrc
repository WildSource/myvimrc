set number
set tabstop=2
set expandtab
set scrolloff=10

" Set specific tab width for HTML
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

syntax on

set backspace=indent,eol,start  " more powerful backspacing

" now it is possible to paste many times over selected text
xnoremap <expr> p 'pgv"'.v:register.'y`>'
xnoremap <expr> P 'Pgv"'.v:register.'y`>'

call plug#begin()
    Plug 'preservim/nerdtree'
    Plug 'nordtheme/vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vim-airline/vim-airline'
    Plug 'spolu/dwm.vim'
    " for vim-hoogle to work install hoogle through cabal or stack
    " although stack works a bit better
    " then execute hoogle generate and hoogle data
    Plug 'Twinside/vim-hoogle'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'yuezk/vim-js'
    Plug 'mattn/emmet-vim'
    Plug 'elzr/vim-json'
    Plug 'pangloss/vim-javascript'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'ziglang/zig.vim'
call plug#end()

colorscheme nord 

" Remove bg color
hi Normal guibg=NONE ctermbg=NONE

" JavaScript/JSX-specific settings
augroup ft_javascript
    au!
    au FileType javascript,typescripx,tsx setlocal tabstop=2 shiftwidth=2
augroup END

" important!!
set termguicolors

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <C-Space> coc#refresh()
