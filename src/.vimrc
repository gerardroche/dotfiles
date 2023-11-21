if &compatible
    set nocompatible
endif

if !has('nvim')
    set encoding=utf-8
endif

" Plugins {{{

call plug#begin('~/.vim/plugged')

" Load vim-sensible now so settings can be overridden
" https://github.com/junegunn/vim-plug/issues/68
Plug 'tpope/vim-sensible'
call plug#load('vim-sensible')

"Plug 'terryma/vim-multiple-cursors'
Plug 'benmills/vimux'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'janko-m/vim-test'
Plug 'justinmk/vim-sneak'
Plug 'machakann/vim-highlightedyank'
Plug 'mg979/vim-visual-multi'
Plug 'michaeljsmith/vim-indent-object'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'voldikss/vim-floaterm'
Plug 'wellle/targets.vim'

"Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
"Plug 'nvim-tree/nvim-web-devicons'
"Plug 'ryanoasis/vim-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Syntax Highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
if has('nvim')
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
endif

" LSP
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Git
if has('nvim')
    Plug 'lewis6991/gitsigns.nvim'
else
    Plug 'airblade/vim-gitgutter'
endif

" Colour schemes
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

" }}}

" Options {{{

"set wildmenu
set autoindent
set autoread
set autowrite
set backspace=indent,eol,start
set belloff=
set colorcolumn=80
set complete-=i
set cursorline
set display+=lastline
set errorbells
set expandtab
set foldlevelstart=99
set foldmethod=syntax
set formatoptions+=c
set formatoptions+=j
set formatoptions+=l
set formatoptions+=q
set formatoptions+=r
set formatoptions-=t
set guicursor=
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=1
set linebreak
set list
set modeline
set mouse=a
set nobackup
set noshowmode
set noswapfile
set novisualbell
set nowrap
set number
set relativenumber
set scrolloff=8
set shiftround
set shiftwidth=4
set showcmd
set showtabline=1
set sidescroll=1
set sidescrolloff=8
set signcolumn=yes
set smartcase
set smarttab
set softtabstop=4
set spelllang=en_gb,en,en_us
set splitbelow
set splitright
set tabstop=4
set tags^=./.git/tags;
set textwidth=72
set ttyfast
set updatetime=100
set wildignore+=*.bak,*~,*.o,*.h,*.info,*.swp,*.obj
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=*.log
set wildignore+=*.pyc
set wildignore+=*.sublime-workspace
set wildignore+=*/CodeCoverage/Report
set wildignore+=*/build
set wildignore+=*/data
set wildignore+=*/public/assets
set wildignore+=*/tmp
set wildignore+=*/vendor/*/*/Tests
set wildignore+=*/vendor/*/*/build
set wildignore+=*/vendor/*/*/test
set wildignore+=*/vendor/*/*/tests
set wildignore+=*/vendor/*/*/tmp
set wildignore+=*/vendor/*/*/vendor
set wildignore+=.DS_Store
set wildignore+=.git,.hg,.svn
set wildignore+=composer.lock,bower_components,node_modules
set wildmode=longest:full,full
set wrapscan

if (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8') && version >= 700
    set listchars=tab:▸\ ,trail:•,extends:❯,precedes:❮
    set showbreak=↪\
else
    set showbreak=\ +
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<
endif

" }}}

" Options - Plugins {{{

let g:gitgutter_sign_added = '|'
let g:gitgutter_sign_modified = '|'
let g:gitgutter_sign_removed = '_'

let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline_theme = 'dracula'
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_show_hidden = 1
let g:php_baselib = 1
let g:php_folding = 1
let g:php_sql_query = 1
let g:sneak#use_ic_scs = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1

" }}}

" Look and Feel {{{

if has("syntax")
    syntax enable
endif

" Fixes insert and replace mode cursor shape in terminal
" https://github.com/neovim/neovim/issues/2475
" let &t_SI = "\<Esc>[5 q"
" let &t_SR = "\<Esc>[5 q"
" let &t_EI = "\<Esc>[2 q"

set t_Co=256

" Fixes issues with bg colour when scrolling
" https://superuser.com/a/588243
if &term =~ 'xterm-kitty' || &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    if !has('nvim')
        set t_ut=
    endif

endif

if exists('+termguicolors')
    set termguicolors
endif

let g:gruvbox_italic=1
let g:molokai_original=0
let g:rehash256=1
let g:solarized_termcolors=16
let g:solarized_termtrans=1 " Fix some tmux colour issues

set background=dark

" colorscheme dracula
" colorscheme solarized8_dark
colorscheme gruvbox

" Sign column background === colorscheme background.
silent! highlight SignColumn ctermbg=bg guibg=bg
silent! highlight GruvboxGreenSign ctermbg=bg guibg=bg
silent! highlight GruvboxAquaSign ctermbg=bg guibg=bg
silent! highlight GruvboxRedSign ctermbg=bg guibg=bg

" Number column background === colorscheme background.
silent! highlight LineNr ctermbg=bg guibg=bg

" Show ruler columns only on lines where the text overflows.
" http://youtu.be/aHm36-na4-4
" silent! highlight RulerColumn ctermfg=bg ctermbg=fg guifg=bg guibg=fg
" call matchadd("RulerColumn", '\%81v', 100)
" silent! highlight RulerColumn2 ctermfg=white ctermbg=red guifg=white guibg=red
" call matchadd("RulerColumn2", '\%121v', 200)

" Fix spell checking.
hi SpellBad term=reverse guifg=#000000 guibg=#FF0000
hi SpellCap term=reverse guifg=#000000 guibg=#FF0000
hi SpellLocal term=underline guifg=#000000 guibg=#FF0000
hi SpellRare term=reverse guifg=#000000 guibg=#FF0000

" }}}

" Nvim Lui {{{
    if has('nvim')
        lua require('user')
    endif
" }}}

" Commands {{{

" Runs the current file through PHPUnit via tmux.
" http://git.io/vTBOo
function! PHPUnitRunSingleTest()
    let l:filename = bufname("%")
    let l:filetype = &ft
    if (filetype == "php")
        let l:runner = "phpunit --no-coverage"
    endif
    if (exists("runner"))
        call VimuxRunCommand("clear; " . runner . " " . filename)
    else
        echo "No test runner for files of type: " . filetype
    endif
endfunction

" Runs all PHPUnit tests via tmux.
" http://git.io/vTBOo
function! PHPUnitRunTests()
    let l:filename = bufname("%")
    let l:filetype = &ft
    if (filetype == "php")
        let l:runner = "phpunit --no-coverage"
    endif
    if (exists("runner"))
        call VimuxRunCommand("clear; " . runner)
    else
        echo "No test runner for files of type: " . filetype
    endif
endfunction

function! ShowFileInNERDTree()
  if exists("t:NERDTreeBufName")
    NERDTreeFind
  else
    NERDTree
    wincmd l
    NERDTreeFind
  endif
endfunction

" Trim trailing whitespace.
" http://git.io/vTBO8
function! TrimWhiteSpace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction

function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! DumpColorSchemeInfo()
    let hi = synIDattr(synID(line("."),col("."),1),"name")
    let trans = synIDattr(synID(line("."),col("."),0),"name")
    let lo = synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")

    echo "hi<" . hi . "> trans<" . trans . "> lo<" . lo . ">"

    execute join(['hi', hi], ' ')
    execute join(['hi', trans], ' ')
    execute join(['hi', lo], ' ')
endfunction

command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" }}}

" Autocommands {{{
filetype plugin indent on

" Trim trailing whitespace on save.
" http://git.io/vTBO8
autocmd BufWritePre * call TrimWhiteSpace()

" Save on lost focus.
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
autocmd FocusLost * silent! wall

" Better git commit messages.
" http://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message
autocmd Filetype gitcommit setlocal spell spellcapcheck= textwidth=72

" Better completions.
" https://jordaneldredge.com/blog/setting-up-php-completion-in-vim/
" autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
"}}}

" Mappings {{{

let mapleader=","

nnoremap <leader>oka :silent !gitk --all&<CR>
nnoremap <leader>okd :silent !gitk --max-count=200 --all --date-order&<CR>
noremap <leader>D :call ShowFileInNERDTree()<CR>
noremap <leader>d :NERDTreeToggle<CR>
"noremap <leader>r :registers<CR>

noremap <leader>r :source ~/.vimrc<CR>

nnoremap <C-d> <C-d>zz
nnoremap <C-l> :nohlsearch<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-u> <C-u>zz
nnoremap <Space> :
nnoremap J mzJ`z
nnoremap N Nzzzv
nnoremap Q <nop>
nnoremap n nzzzv

map y <Plug>(highlightedyank)

" Yank and paste using system clipboard.
noremap <leader>y "+y
noremap <leader>Y "+Y
noremap <leader>p "+p
noremap <leader>P "+P

xnoremap <localleader>p "_dp

" Sorting.
nnoremap <leader>si vii:sort u<CR>
nnoremap <leader>ss vip:sort u<CR>
vnoremap <leader>s :sort u<CR>

" Telescope.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Testing.
nnoremap <leader>tn :silent :TestNearest<CR>
nnoremap <leader>tf :silent :TestFile<CR>
nnoremap <leader>ts :silent :TestSuite<CR>
nnoremap <leader>tl :silent :TestLast<CR>
nnoremap <leader>tv :silent :TestVisit<CR>

" Easy buffer navigation.
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" https://bitbucket.org/sjl/dotfiles/src/b89b95f1cb1d06596c0c46bfb5a9e7e95ce71913/vim/vimrc?at=default
" noremap <C-h> <C-w>h
" noremap <C-j> <C-w>j
" noremap <C-k> <C-w>k
" noremap <C-l> <C-w>l

" Scroll viewport faster.
" http://items.sjbach.com/319/configuring-vim-right
" nnoremap <C-e> 3<C-e>
" nnoremap <C-y> 3<C-y>

" Make j and k work file linewise instead of screen linewise.
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" https://bitbucket.org/sjl/dotfiles/src/b89b95f1cb1d06596c0c46bfb5a9e7e95ce71913/vim/vimrc?at=default
" noremap j gj
" noremap k gk
" noremap gj j
" noremap gk k

" " Match bracket pairs.
" " http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" nnoremap <tab> %
" vnoremap <tab> %

" Idea from : http://www.charlietanksley.net/blog/blog/2011/10/18/vim-navigation-with-lustyexplorer-and-lustyjuggler/
" Open CtrlP starting from a particular path, making it much
" more likely to find the correct thing first. mnemonic 'jump to [something]'
" map <leader>jm :CtrlP app/models<CR>
" map <leader>jc :CtrlP app/controllers<CR>
" map <leader>jv :CtrlP app/views<CR>
" map <leader>jh :CtrlP app/helpers<CR>
" map <leader>jl :CtrlP lib<CR>
" map <leader>jp :CtrlP public<CR>
" map <leader>js :CtrlP spec<CR>
" map <leader>jf :CtrlP fast_spec<CR>
" map <leader>jd :CtrlP db<CR>
" map <leader>jC :CtrlP config<CR>
" map <leader>jV :CtrlP vendor<CR>
" map <leader>jF :CtrlP factories<CR>
" map <leader>jT :CtrlP test<CR>

" Windowing aliases (especially useful if you don't use ctrl-keys).
" map <leader>= <C-w>=
" map <leader><bar> <C-w><bar>
" map <leader>_ <C-w>_

" " PHPUnit
" nnoremap <leader>va :call PHPUnitRunTests()<CR>
" nnoremap <leader>vt :call PHPUnitRunSingleTest()<CR>

" " Fix delay in airline redraw.
" " http://superuser.com/a/252717
" inoremap <Esc> <Esc>
" vnoremap <Esc> <Esc>

" Debug.
" nnoremap <F10> :call DumpColorSchemeInfo()<CR>

" }}}

" Mappings - Hard mode {{{
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
" noremap h <NOP>
" noremap j <NOP>
" noremap k <NOP>
" noremap l <NOP>
" }}}

" Auto fix typos {{{
" Don't care if I typo when saving or quitting!
" http://git.io/vTBOa
cnoreabbrev Q q
cnoreabbrev Q! q!
cnoreabbrev Qall qall
cnoreabbrev Qall! qall!
cnoreabbrev W w
cnoreabbrev W! w!
cnoreabbrev WQ wq
cnoreabbrev Wa wa
cnoreabbrev Wq wq
cnoreabbrev wQ wq
command! E e
command! Q q
command! QA qa
command! Qa qa
command! W w
command! WA wa
command! WQ wq
command! Wa wa
command! Wq wq
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" }}}
