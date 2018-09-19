
" Color scheme
set background=dark

if has('gui_vimr')
    colorscheme evening
elseif
    set termguicolors
    colorscheme default
endif

syntax on

" Plugins
packadd minpac
call minpac#init()

call minpac#add('tpope/vim-surround')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
call minpac#add('vim-airline/vim-airline')
call minpac#add('pangloss/vim-javascript')
call minpac#add('junegunn/fzf.vim')

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Indentation/Tab Settings

set shiftwidth=2
set autoindent
set expandtab
set laststatus=2

" Sets column and line guides
set cursorcolumn
set cursorline

let mapleader=" "

set rnu
set updatetime=100

set nowrap
set showbreak=↪\ 
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set list

" Filetype settings
au BufNewFile,BufRead *.js set filetype=javascript

" Input mappings
inoremap jk <ESC>

" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

nmap <Leader>t :Files<CR>
nmap <Leader>b :Buffers<CR>

set rtp+=/usr/local/opt/fzf

let g:fzf_tags_command = 'ctags --extra=+f -R'
let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


let g:gitgutter_sign_column_always = 1
let g:deoplete#enable_at_startup = 1
