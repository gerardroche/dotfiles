" Disable vi compatibility, if for some reason it's on.
if &compatible
    set nocompatible
endif

" Set encoding utf-8, if for some reason it's not set.
if &encoding != 'utf-8'
    set encoding=utf-8
endif

filetype plugin indent on

if has("syntax")
    syntax enable
endif

" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Load sensible first!
" https://github.com/tpope/vim-sensible
Plug 'tpope/vim-sensible'

" https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'

" https://github.com/christoomey/vim-tmux-navigator
Plug 'christoomey/vim-tmux-navigator'

" https://github.com/ctrlpvim/ctrlp.vim
"Plug 'ctrlpvim/ctrlp.vim'

" https://github.com/gruvbox-community/gruvbox
" https://github.com/morhetz/gruvbox
" Plug 'morhetz/gruvbox'
Plug 'gruvbox-community/gruvbox'

" https://github.com/junegunn/fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" https://github.com/justinmk/vim-sneak
Plug 'justinmk/vim-sneak'

" https://github.com/machakann/vim-highlightedyank
Plug 'machakann/vim-highlightedyank'

" https://github.com/mg979/vim-visual-multi
Plug 'mg979/vim-visual-multi'

" https://github.com/michaeljsmith/vim-indent-object
Plug 'michaeljsmith/vim-indent-object'

" https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree'

" https://github.com/ryanoasis/vim-devicons
Plug 'ryanoasis/vim-devicons'

" https://github.com/tpope/vim-abolish
Plug 'tpope/vim-abolish'

" https://github.com/tpope/vim-characterize
Plug 'tpope/vim-characterize'

" https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'

" https://github.com/tpope/vim-dispatch
Plug 'tpope/vim-dispatch'

" https://github.com/tpope/vim-endwise
Plug 'tpope/vim-endwise'

" https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'

" https://github.com/tpope/vim-repeat
Plug 'tpope/vim-repeat'

" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" https://github.com/tpope/vim-unimpaired
Plug 'tpope/vim-unimpaired'

" https://github.com/wellle/targets.vim
Plug 'wellle/targets.vim'

call plug#end()

if exists('+termguicolors')
    set termguicolors
endif

if &t_Co != 256
    set t_Co=256
endif

" if (&term =~ '256color' || &term =~ 'xterm-kitty') && !has('nvim')
"   " disable Background Color Erase (BCE) so that color schemes
"   " render properly when inside 256-color tmux and GNU screen.
"   " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
"   set t_ut=
" endif

" " I Beam cursor in Insert and Replace mode.
" let &t_SI = "\<Esc>[5 q"
" let &t_SR = "\<Esc>[5 q"
" let &t_EI = "\<Esc>[2 q"

set background=dark

" let g:gruvbox_bold=1
let g:gruvbox_color_column="none"
let g:gruvbox_improved_warnings=1
let g:gruvbox_italic=1
let g:gruvbox_sign_column="none"

silent! colorscheme gruvbox

" if !exists("g:gruvbox_sign_column")
"     hi GruvboxAquaSign ctermbg=NONE guibg=NONE
"     hi GruvboxGreenSign ctermbg=NONE guibg=NONE
"     hi GruvboxRedSign ctermbg=NONE guibg=NONE
" endif

hi FoldColumn ctermbg=NONE guibg=NONE
hi Folded ctermbg=NONE guibg=NONE
hi Normal ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi SpellBad ctermbg=NONE ctermfg=167 cterm=underline
hi SpellCap ctermbg=NONE ctermfg=142 cterm=bold,italic
hi SpellLocal ctermbg=NONE ctermfg=108 cterm=underline
hi SpellRare ctermbg=NONE ctermfg=175 cterm=underline

set autoindent
set autoread
set autowrite
set backspace=indent,eol,start
set clipboard=unnamedplus
set expandtab
set formatoptions+=c
set formatoptions+=j
set formatoptions+=l
set formatoptions+=q
set formatoptions+=r
set formatoptions-=t
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set linebreak
set listchars+=trail:•
set mouse=a
set nobackup
set noerrorbells
set nonumber
set norelativenumber
set noruler
set noshowmode
set noswapfile
set nowrap
set nowritebackup
set scrolloff=8
set shiftround
set shiftwidth=4
set shortmess+=I
set sidescroll=1
set sidescrolloff=8
set signcolumn=yes
set smartcase
set smartindent
set smarttab
set softtabstop=4
set spelllang=en_gb,en
set splitbelow
set splitright
set tabstop=4
set textwidth=72
set ttyfast
set wildmenu
set wildmode=longest:full,full
set wrapscan

" let g:ctrlp_follow_symlinks = 1
" let g:ctrlp_show_hidden = 1
let g:sneak#use_ic_scs = 1

function! TrimWhiteSpace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction

autocmd BufWritePre * call TrimWhiteSpace()
autocmd Filetype gitcommit setlocal spell spellcapcheck=
autocmd FocusLost * silent! wall

let mapleader=","
let maplocalleader="<Bslash>"
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <C-w>z <C-w>\|<C-w>_
nnoremap <Leader><Leader> :NERDTreeFind<CR>
nnoremap <Leader><Space> :FZF<CR>
nnoremap <Leader>d :NERDTreeToggle<CR>
nnoremap <Leader>ek :vsplit ~/.vimrc<CR>/mapleader<CR>zzzv:noh<CR>
nnoremap <Leader>en :vsplit ~/.vimrc<CR>
nnoremap <Leader>ep :vsplit ~/.vimrc<CR>
nnoremap <Leader>ff :FZF!<CR>
nnoremap <Leader>fg :call fzf#run({'source': 'git ls-files --exclude-standard --cached --others'})<CR>
nnoremap <Leader>qq :qa<CR>
nnoremap <Leader>r :w<CR>:source ~/.vimrc<CR>:noh<CR>
nnoremap <Leader>si vii:sort u<CR>
nnoremap <Leader>ss vip:sort u<CR>
nnoremap <Leader>ur :noh<CR>
nnoremap <Leader>zz <C-w>\|<C-w>_
nnoremap J mzJ`z
nnoremap N Nzzzv
nnoremap Q <nop>
nnoremap n nzzzv
noremap <C-s> :w<CR><Esc>
noremap <Leader>P "+P
noremap <Leader>Y "+Y
noremap <Leader>p "+p
noremap <Leader>y "+y
vnoremap <Leader>ss :sort u<CR>
