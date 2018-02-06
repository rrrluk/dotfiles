set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

" The bundles you install will be listed here

Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'morhetz/gruvbox'
Plugin 'tmhedberg/SimpylFold'
Plugin 'marciomazza/vim-brogrammer-theme'
" Plugin 'itchyny/calendar.vim'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
Plugin 'itchyny/lightline.vim'
Plugin 'shinchu/lightline-gruvbox.vim'
Plugin 'blindFS/vim-taskwarrior'
Plugin 'pangloss/vim-javascript'
Plugin 'pearofducks/ansible-vim'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'nathanaelkane/vim-indent-guides'

call vundle#end()            " required

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

" vahetab bg dark/light
" call togglebg#map("<F5>")
set background=dark                        

" NERD Tree
map <F8> :NERDTreeToggle<CR>
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" paste toggle
set pastetoggle=<F2>

" line numbers toggle
nmap <F3> :set invnumber<CR>

" normaalne backspace
set backspace=indent,eol,start

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" controliga liigub splittide vahel

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" buffer ls
nnoremap <leader>l :ls<CR>:b<space>

" buffer prev/next
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" buffer close, vaheta eelmine, sule viimane, vajalik NERDtree jaoks
nnoremap <C-C> :bp\|bd #<CR>


" kiirem save
" noremap <Leader>w :update<CR>

" replace from buffer until end of line
:map <C-j> c$<C-r>0<ESC>

" jk teeb escape
" inoremap jk <ESC>

:nnoremap <Leader>tt "=strftime("*%d/%m/%y*  ")<CR>P
" :inoremap <Leader>tt <C-R>=strftime("*%d/%m/%y*  ")<CR>


" leader-z to za
nnoremap <Leader>z za
" Powerline setup
set laststatus=2

" YouCompleteMe asjad
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path = '/usr/bin/python3'
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


" wsgi failid on python failid tegelikult
au BufRead,BufNewFile *.wsgi    set filetype=python
" vim-ansible
au BufRead,BufNewFile */playbooks/*.yml set filetype=ansible

" indent guides
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1


