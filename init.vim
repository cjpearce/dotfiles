" Color scheme
set background=dark

"colorscheme "base16-default-dark"

set termguicolors
syntax on

" Plugins
packadd minpac
call minpac#init()

call minpac#add('tpope/vim-surround')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('vim-airline/vim-airline')
call minpac#add('pangloss/vim-javascript')

call minpac#add('junegunn/fzf.vim')

call minpac#add('scrooloose/nerdtree')
call minpac#add('Xuyuanp/nerdtree-git-plugin')
call minpac#add('elixir-editors/vim-elixir')
call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
call minpac#add('elzr/vim-json')
call minpac#add('airblade/vim-rooter')
call minpac#add('chriskempson/base16-vim')
call minpac#add('prettier/vim-prettier', {'do': '!yarn install'})
call minpac#add('benmills/vimux')

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

filetype plugin indent on

" Mouse settings
set mouse=a

" Indentation/Tab Settings

set shiftwidth=2
set autoindent
set expandtab
set laststatus=2

" Sets column and line guides

let mapleader=" "
set clipboard=unnamedplus

let &colorcolumn="80,100"
set number
set rnu
set updatetime=100

set nowrap
set showbreak=↪\ 
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set list

" Filetype settings
au BufNewFile,BufRead *.js set filetype=javascript
au BufNewFile,BufRead *.jbuilder set filetype=javascript

" Input mappings
inoremap jk <ESC>

" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

nmap <Leader>f :Format<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>/ :Rg 
nmap <Leader>b :Buffers<CR>
nmap <Leader>ce :edit $MYVIMRC<CR>
nmap <Leader>cs :source $MYVIMRC<CR>
nmap <Leader>w :Windows<CR>
nmap <silent> <Leader>nf :NERDTreeFind<CR>
nmap <silent> <Leader>nt :NERDTreeToggle<CR>
nmap <Leader><Leader> :Rg<CR>

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


let signcolumn=1
let g:fzf_buffers_jump = 1

command! -bang -nargs=* Agc call fzf#vim#ag(<q-args>, '--word-regexp', <bang>0)

" colour configuration
hi SpellBad ctermbg=10

let g:vim_json_syntax_conceal = 0

" autocommands
autocmd BufNewFile,BufRead .babelrc set syntax=json

"COC configuration

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

command! -nargs=0 Format :call CocAction('format')

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

map gm :call SynStack()<CR>

set inccommand=split
