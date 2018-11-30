set nocompatible

call plug#begin('~/.vim/plugged')

" Plugin 'Valloric/YouCompleteMe'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'tmhedberg/SimpylFold'
Plug 'marciomazza/vim-brogrammer-theme'
" Plug 'itchyny/calendar.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'blindFS/vim-taskwarrior'
Plug 'pangloss/vim-javascript'
Plug 'pearofducks/ansible-vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'StanAngeloff/php.vim'
" Plug 'mattn/emmet-vim'
Plug 'dzeban/vim-log-syntax'
Plug 'kien/ctrlp.vim'
Plug 'maksimr/vim-jsbeautify'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

" deoplete
let g:deoplete#enable_at_startup = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

filetype off
filetype indent on
filetype plugin on

" The rest of your config follows here
set t_Co=256

"set fillchars=""
" set fillchars=stl:-,stlnc:-,vert:│
set fillchars=vert:│

" Hides buffers, instead of closing them
"
" set fillchars=""
set hidden
" Default vim arvab et 0-ga algavad numbrid on octal süsteemis 007 + 001 = 010.
" Et vim suhtuks kõikidesse numbritesse kui decimali-tesse.
set nrformats=
set encoding=utf-8
set history=200
set textwidth=79
set colorcolumn=+1
set tabstop=4       " Number of spaces that a <Tab> in the file counts foh.
 
set mouse=a         " hiir :D" 
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
 
set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.
 
set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.
set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).
set showcmd	        " Show commands as typed	
set hlsearch	    " When there is a previous search pattern, highlight all
		            " its matches.
 
set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.
set showmatch       " When a bracket is inserted, briefly jump to the matching
                    " one. The jump is only done if the match can be seen on
                    " the  screen. The time to show the match can be set with 'matchtime'.


let python_highlight_all=1

set matchtime=3
syntax on

" lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'readonly': 'LightlineReadonly',
      \   'modified': 'LightlineModified',
      \   'filename': 'LightlineFilename'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
function! LightlineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightlineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightlineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

" colorscheme brogrammer
colorscheme gruvbox
" airline theme
" let g:airline_theme='powerlineish'
" powerline fonts for airline
" let g:airline_powerline_fonts = 1

" space leader
let mapleader = "\<Space>"

set background=dark

" NERD Tree
map <F8> :NERDTreeToggle<CR>
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeHijackNetrw=0

" paste toggle
set pastetoggle=<F2>

" line numbers toggle
nmap <F3> :set invnumber<CR>

" hidden chars
set showbreak=↪\
set listchars=tab:»·,eol:¬,nbsp:+,space:·,extends:→,precedes:←
noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>

" normaalne backspace
set backspace=indent,eol,start

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" controliga liigub splittide vahel

" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" buffer ls
nnoremap <leader>l :ls<CR>:b<space>

" buffer prev/next
" nnoremap <C-N> :bnext<CR>
" nnoremap <C-P> :bprev<CR>
nnoremap <C-J> :bnext<CR>
nnoremap <C-K> :bprev<CR>

" buffer close, vaheta eelmine, sule viimane, vajalik NERDtree jaoks
nnoremap <C-C> :bp\|bd #<CR>


" kiirem save
" noremap <Leader>w :update<CR>

" replace from buffer until end of line
" :map <C-j> c$<C-r>0<ESC>

" jk teeb escape
" inoremap jk <ESC>

:nnoremap <Leader>tt "=strftime("*%d/%m/%y*  ")<CR>P
" :inoremap <Leader>tt <C-R>=strftime("*%d/%m/%y*  ")<CR>


" leader-z to za
nnoremap <Leader>z za
" Powerline setup
set laststatus=2

" YouCompleteMe asjad
" let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_python_binary_path = '/usr/bin/python3'
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


" wsgi failid on python failid tegelikult
au BufRead,BufNewFile *.wsgi    set filetype=python
" vim-ansible
au BufRead,BufNewFile */playbooks/*.yml set filetype=ansible

" indent guides
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1

" ctrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" vim-emmet
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall
" let g:user_emmet_expandabbr_key='<Tab>'
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" let g:user_emmet_mode='i'    "enable all function in all mode.

" jsbeautify
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" trailing whitespace
highlight RedundantSpaces ctermbg=darkgrey guibg=red  
match RedundantSpaces /\s\+$/

