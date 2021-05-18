call plug#begin()
" shortcut cheat sheet
Plug 'liuchengxu/vim-which-key'
" Fancy colors
Plug 'rafi/awesome-vim-colorschemes'
" Fuzzy Find
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Nicer netrw
Plug 'tpope/vim-vinegar'
" Commands for commenting
" TODO hook up to mappings
Plug 'tpope/vim-commentary'
" Surround commands
Plug 'tpope/vim-surround'
" Auto close { pairs }
Plug 'jiangmiao/auto-pairs'
" TODO add vim-commentary?
" TODO add matching pairs {}
" File tree panel
Plug 'preservim/nerdtree'
" Language stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
call plug#end()
