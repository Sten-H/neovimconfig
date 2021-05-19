" MAPPINGS

" Set map-leader to space
nnoremap <SPACE> <Nop>
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
" Define prefix dictionary
let g:which_key_map =  {}
call which_key#register(' ', 'g:which_key_map')
" Time before popup triggers
set timeoutlen=500

" list files/git files
nnoremap <expr> <leader><leader> (len(system('git rev-parse')) ? ':Files' : ':GFiles')."\<cr>"
" Search file contents
command! -bang -nargs=*  All
  \ call fzf#run(fzf#wrap({ 'source': 'rg --files --hidden --no-ignore-vcs --glob "!{build/*,dist/*,node_modules/*,.git/*}"', 'options': ['--preview', '~/.config/nvim/plugged/fzf.vim/bin/preview.sh {}', '--expect=ctrl-t,ctrl-x,ctrl-v'] }))
nnoremap <silent> <leader>/ :All<CR>

" === FILE ===
let g:which_key_map.f = { 'name' : '+file' }
nnoremap <silent> <leader>fs :update<CR>
let g:which_key_map.f.s = 'save-file'
nnoremap <silent> <leader>ff :NERDTreeFind<CR>
" === FILE --> EDIT 
let g:which_key_map.f.f = 'reload-vimrc'
let g:which_key_map.f.e = { 'name' : '+config' }
nnoremap <silent> <leader>fed :edit $MYVIMRC<CR>
let g:which_key_map.f.e.d = 'open-vimrc'
nnoremap <silent> <leader>feR :source $MYVIMRC<CR>
let g:which_key_map.f.e.R = 'reload-vimrc'

" === M-something
" Thinking this can contain som general language stuff
let g:which_key_map.m = { 'name': '+code-operations' }
" symbol renaming
nmap <leader>mn <Plug>(coc-rename)
let g:which_key_map.m.n =  'rename-symbol'
" === GO TO ===
let g:which_key_map.g = { 'name': '+go-to' }
nnoremap <silent> <leader>gh :call <SID>show_documentation()<CR>
let g:which_key_map.g.h = 'do-hover'
nmap <silent> <leader>gd <Plug>(coc-definition)
let g:which_key_map.g.d = 'go-to-definition'
map <silent> <leader>gt <Plug>(coc-type-definition)
let g:which_key_map.g.t = 'go-to-type-definition'
nmap <silent> <leader>gr <Plug>(coc-references)
let g:which_key_map.g.r = 'go-to-references'
nmap <silent> <leader>gi <Plug>(coc-implementation)
let g:which_key_map.g.i = 'go-to-implementation'
" Remap keys for gotos (without leader)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> gh :call <SID>show_documentation()<CR>


nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)

""" === ERROR ===
let g:which_key_map.e = { 'name': 'error' }
nmap <leader>ef <Plug>(coc-fix-current)
let g:which_key_map.e.f = 'fix-current'
nmap <leader>ea <Plug>(coc-codeaction)
let g:which_key_map.e.a = 'code-action'
nmap <silent>]e <Plug>(coc-diagnostic-next)
let g:which_key_map.e.n = 'next-error'
nmap <silent>[e <Plug>(coc-diagnostic-prev)
let g:which_key_map.e.p = 'prev-error'

" === WINDOW ===
let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : [':resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : [':resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ }

" === PROJECT ===
let g:which_key_map.p = { 'name' : '+project' }
nnoremap <silent> <leader>pd :CocList diagnostics<cr>
let g:which_key_map.p.d = 'project-diagnostics'
nnoremap <silent> <space>ps :<C-u>CocList -I symbols<cr>
let g:which_key_map.p.s = 'project-symbols'

" === OPEN ===
let g:which_key_map.o = { 'name': '+open' }
nnoremap <silent> <leader>op :NERDTreeToggle<cr>
let g:which_key_map.o.p = "open-project-tree"
" TODO open terminal (never really use terminal from here)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
