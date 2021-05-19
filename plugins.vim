call plug#begin()
" shortcut cheat sheet
Plug 'liuchengxu/vim-which-key'
" Fancy colors
Plug 'rafi/awesome-vim-colorschemes'
" Fuzzy Find
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Uses fzf for cocs lists. Provides better overview and navigation
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
" Nicer netrw
Plug 'tpope/vim-vinegar'
" Commands for commenting
" TODO hook up to mappings
Plug 'tpope/vim-commentary'
" Surround commands
Plug 'tpope/vim-surround'
" Auto close { pairs }
Plug 'jiangmiao/auto-pairs'
" Highlight yanked text
Plug 'machakann/vim-highlightedyank'
" File tree panel
Plug 'preservim/nerdtree'
" Fancy status bar - Do I evene like this?
Plug 'vim-airline/vim-airline'
" Language stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
call plug#end()
