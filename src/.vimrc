if &compatible
    set nocompatible
endif

if !has('nvim')
    set encoding=utf-8
endif

" Plugins {{{

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
" Load vim-sensible now so settings can be overridden
" https://github.com/junegunn/vim-plug/issues/68
call plug#load('vim-sensible')

Plug 'airblade/vim-gitgutter'
Plug 'benmills/vimux'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'janko-m/vim-test'
Plug 'machakann/vim-highlightedyank'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

"Plug 'terryma/vim-multiple-cursors'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-unimpaired'
Plug 'michaeljsmith/vim-indent-object'
Plug 'justinmk/vim-sneak'
Plug 'voldikss/vim-floaterm'

Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'nvim-treesitter/nvim-treesitter-textobjects'
"Plug 'JoosepAlviste/nvim-ts-context-commentstring'

"Plug 'nvim-tree/nvim-web-devicons'
"Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }

" Colour schemes
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

" }}}

" Options {{{

set autoindent
set autoread
set autowrite
set backspace=indent,eol,start
set belloff=
set complete-=i
set cursorline
set display+=lastline
set errorbells
set expandtab
set foldmethod=marker
set foldopen+=jump
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
set laststatus=1
set linebreak
set list
set nowrapscan
set smartcase

if (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8') && version >= 700
    set listchars=tab:▸\ ,trail:•,extends:❯,precedes:❮
else
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<
endif

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

if (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8') && version >= 700
    set showbreak=↪\
else
    set showbreak=\ +
endif

set showcmd
set showtabline=1
set sidescroll=1
set sidescrolloff=8
set smarttab
set softtabstop=4
set spelllang=en_gb,en,en_us
set splitbelow
set splitright
set tabstop=4
set tags^=./.git/tags;
set textwidth=80

" Fixes escape key delays
" https://www.johnhawthorn.com/2012/09/vi-escape-delays
" set timeoutlen=1000 ttimeoutlen=0

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
set wildmenu
set wildmode=longest:full

" }}}

" Options (Plugins) {{{

let NERDTreeMinimalUI = 1

" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
" let g:airline_symbols.crypt = '🔒'
" let g:airline_symbols.linenr = ''
" let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.branch = '⎇ '
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.whitespace = ''

let g:ctrlp_follow_symlinks = 1
let g:ctrlp_show_hidden = 1

let g:php_baselib = 1
let g:php_folding = 0
let g:php_sql_query = 1

let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1

" let g:multi_cursor_exit_from_visual_mode = 0
" let g:multi_cursor_select_all_word_key = '<A-n>'

let g:sneak#use_ic_scs = 1

" }}}

" UI {{{

syntax enable

" Fixes insert and replace mode cursor shape in terminal
" https://github.com/neovim/neovim/issues/2475
" let &t_SI = "\<Esc>[5 q"
" let &t_SR = "\<Esc>[5 q"
" let &t_EI = "\<Esc>[2 q"

set t_Co=256

" Fixes issues with bg colour when scrolling
" https://superuser.com/a/588243
if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    set t_ut=
endif

if exists('+termguicolors')
    set termguicolors
endif

set background=dark

" Gruvbox colorscheme
let g:gruvbox_italic=1

" Molokai colorscheme
let g:molokai_original=0
let g:rehash256=1

" Solarized colorscheme
let g:solarized_termcolors=16
let g:solarized_termtrans=1 " Fix some tmux colour issues

" colorscheme solarized8_dark
colorscheme gruvbox
" colorscheme dracula

" Make the sign column background the same
" colour as the colorscheme background.
silent! highlight SignColumn ctermbg=bg guibg=bg
silent! highlight GruvboxGreenSign ctermbg=bg guibg=bg
silent! highlight GruvboxAquaSign ctermbg=bg guibg=bg
silent! highlight GruvboxRedSign ctermbg=bg guibg=bg

" Make the number column background the
" same as the colorscheme background.
silent! highlight LineNr ctermbg=bg guibg=bg

" Show ruler columns only on lines where the text overflows.
" http://youtu.be/aHm36-na4-4
silent! highlight RulerColumn ctermfg=bg ctermbg=fg guifg=bg guibg=fg
call matchadd("RulerColumn", '\%81v', 100)
silent! highlight RulerColumn2 ctermfg=white ctermbg=red guifg=white guibg=red
call matchadd("RulerColumn2", '\%121v', 200)

" Fix spell checking
hi SpellBad term=reverse guifg=#000000 guibg=#FF0000
hi SpellCap term=reverse guifg=#000000 guibg=#FF0000
hi SpellLocal term=underline guifg=#000000 guibg=#FF0000
hi SpellRare term=reverse guifg=#000000 guibg=#FF0000

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
autocmd Filetype gitcommit setlocal spell textwidth=72

" Better completions.
" https://jordaneldredge.com/blog/setting-up-php-completion-in-vim/
" autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
"}}}

" Mappings {{{

let mapleader=","

" " Fix delay in airline redraw.
" " http://superuser.com/a/252717
" inoremap <Esc> <Esc>
" vnoremap <Esc> <Esc>

" Saving.
nnoremap <C-s> :w<CR>
vnoremap <C-s> :w<CR>

" Enter Ex mode.
nnoremap <Space> :

" Easy buffer navigation.
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" https://bitbucket.org/sjl/dotfiles/src/b89b95f1cb1d06596c0c46bfb5a9e7e95ce71913/vim/vimrc?at=default
" noremap <C-h> <C-w>h
" noremap <C-j> <C-w>j
" noremap <C-k> <C-w>k
" noremap <C-l> <C-w>l

" Clear highlighting.
noremap <C-l> :nohlsearch<CR>

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

" Yank and paste using system clipboard.
" http://www.drbunsen.org/the-text-triumvirate/
map y <Plug>(highlightedyank)
noremap <leader>y "+y
noremap <leader>Y "+Y
noremap <leader>p "+p
noremap <leader>P "+P

" Show me the registers.
noremap <leader>r :reg<CR>

" " Match bracket pairs.
" " http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" nnoremap <tab> %
" vnoremap <tab> %

" NERDTree
noremap <leader>d :NERDTreeToggle<CR>
noremap <leader>f :call ShowFileInNERDTree()<CR>

" Sorted.
map <leader>s) vi):sort u<CR>
map <leader>s] vip:sort u<CR>
map <leader>sp vip:sort u<CR>
map <leader>si vii:sort u<CR>
map <leader>ss vii:sort u<CR>
vmap <leader>s :sort u<CR>

" Idea from : http://www.charlietanksley.net/blog/blog/2011/10/18/vim-navigation-with-lustyexplorer-and-lustyjuggler/
" Open CtrlP starting from a particular path, making it much
" more likely to find the correct thing first. mnemonic 'jump to [something]'
map <leader>jm :CtrlP app/models<CR>
map <leader>jc :CtrlP app/controllers<CR>
map <leader>jv :CtrlP app/views<CR>
map <leader>jh :CtrlP app/helpers<CR>
map <leader>jl :CtrlP lib<CR>
map <leader>jp :CtrlP public<CR>
map <leader>js :CtrlP spec<CR>
map <leader>jf :CtrlP fast_spec<CR>
map <leader>jd :CtrlP db<CR>
map <leader>jC :CtrlP config<CR>
map <leader>jV :CtrlP vendor<CR>
map <leader>jF :CtrlP factories<CR>
map <leader>jT :CtrlP test<CR>

" Windowing aliases (especially useful if you don't use ctrl-keys).
map <leader>= <C-w>=
map <leader><bar> <C-w><bar>
map <leader>_ <C-w>_

" Test
nnoremap <leader>t :TestNearest<CR>
nnoremap <leader>T :silent :TestFile<CR>
nnoremap <leader>a :silent :TestSuite<CR>
nnoremap <leader>l :silent :TestLast<CR>
nnoremap <leader>g :silent :TestVisit<CR>

" " PHPUnit
" nnoremap <leader>va :call PHPUnitRunTests()<CR>
" nnoremap <leader>vt :call PHPUnitRunSingleTest()<CR>

" Misc.
" nnoremap <leader>sa ggVG:sort<CR>:w<CR>
nnoremap <F10> :call DumpColorSchemeInfo()<CR>

" map <C-Space> iHelloCSpace
" map <M-space> iHelloMspace
""map <A-d> iHelloA
"map <M-bslash> iHelloM-bslash
"map <M-X> iHelloM-p
"map <M-S-u> iHelloM-bslash
" map <M-f> iHelloM-f
" map <M-k> iHelloM-k

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>oka :silent !gitk --all&<CR>
nnoremap <leader>okd :silent !gitk --max-count=200 --all --date-order&<CR>

" Mappings: Typos {{{
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
" Mappings: Disable arrow keys {{{
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
" }}}
