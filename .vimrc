set number
set tabstop=2
set expandtab
set scrolloff=10

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
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'mattn/emmet-vim'
    Plug 'elzr/vim-json'
    Plug 'pangloss/vim-javascript'
call plug#end()

colorscheme nord

let g:user_emmet_leader_key=','

augroup ft_haskell
    au!
    au FileType haskell setlocal omnifunc=haskellcomplete#Complete
augroup END

" JavaScript/JSX-specific settings
augroup ft_javascript
    au!
    au FileType javascript,typescripx,tsx setlocal tabstop=2 shiftwidth=2
augroup END

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" important!!
set termguicolors

if executable('haskell-language-server-wrapper')
          let g:coc_global_extensions = ['coc-json', 'coc-tsserver']
if !isdirectory(expand('~/.vim'))
            call mkdir(expand('~/.vim'), 'p')
              endif

let s:coc_settings = {
                \ 'languageserver': {
                \   'haskell': {
                \     'command': 'haskell-language-server-wrapper',
                \     'args': ['--lsp'],
                \     'rootPatterns': ['*.cabal', 'stack.yaml', 'cabal.project', 'package.yaml'],
                \     'filetypes': ['haskell', 'lhaskell']
                \   }
                \ }
                \ }

call writefile([json_encode(s:coc_settings)], expand('~/.vim/coc-settings.json'))
endif

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <C-Space> coc#refresh()
