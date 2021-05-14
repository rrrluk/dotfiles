
call plug#begin(expand('~/.config/nvim/plugged'))
" Plugin Section
" Themes
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'vim-utils/vim-man'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'mtdl9/vim-log-highlighting'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'StanAngeloff/php.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'dense-analysis/ale'
Plug 'junegunn/vim-easy-align'
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                                 " fuzzy search integration
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-python']
call plug#end()"Config Section"

if (has("termguicolors"))
 set termguicolors
endif

syntax enable
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
" set nu
set wrap

set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set hidden
set colorcolumn=80
colorscheme gruvbox
set background=dark

" space leader
let mapleader = "\<Space>"

" disable ctrl-a
map <C-a> <Nop>

" window movements
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" resize
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

" line numbers toggle
nmap <F3> :set invnumber<CR>

" undotree
nnoremap <leader>u  :UndotreeToggle<CR>

" wrap on off
nnoremap <leader>w :set wrap!<CR>


" buffer prev/next
nnoremap <C-J> :bnext<CR>
nnoremap <C-K> :bprev<CR>

" paste toggle
set pastetoggle=<F2>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

vnoremap <leader>jq :%!jq .<CR>
" nerdtree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" insert date
nnoremap <Leader>tt "=strftime("_%d/%m/%y_  ")<CR>P

" ripgrep
" if executable('rg')
"     let g:rg_derive_root='true'
" endif

" not needed because fzf?
" nnoremap <leader>ps :Rg<SPACE>

" Find files with fzf
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)

nmap <leader>p :Files!<CR>
nmap <leader>f :Rg<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
    

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ale
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \}

let g:ale_fixers = {
      \    'python': ['yapf'],
      \}
" nmap <leader>a :ALEFix<CR>
let g:ale_fix_on_save = 1

" airline
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = ''

" yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" html
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab

" diffget
nmap <leader>gl :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>
" git status
nmap <leader>gs :G<CR>

" hidden chars
" set showbreak=↪\
set listchars=tab:»·,eol:¬,nbsp:+,space:·,extends:→,precedes:←
noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>

" Jenkinsfile as groovy
au BufNewFile,BufRead Jenkinsfile setf groovy

