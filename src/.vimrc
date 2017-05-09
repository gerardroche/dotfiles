
silent! execute pathogen#infect()

" Options {{{
set autoindent
set autoread
set autowrite
set backspace=indent,eol,start
set complete-=i
set cursorline
set display+=lastline
if !has('nvim')
    set encoding=utf-8
endif
set expandtab
set foldmethod=marker
set foldopen+=jump
set formatoptions+=c
set formatoptions+=j
set formatoptions+=r
set formatoptions+=q
set formatoptions-=t
set guioptions-=e
set hidden
set hlsearch
set incsearch
set laststatus=2
set lazyredraw
set linebreak
set list
if (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8') && version >= 700
    set listchars=tab:▸\ ,trail:•,extends:❯,precedes:❮
else
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<
endif
set nobackup
set nocompatible
set noswapfile
set nowrap
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
set showmatch
set showmode
set showtabline=2
set sidescroll=1
set sidescrolloff=12
set smarttab
set softtabstop=4
set spelllang=en_gb,en,en_us
set splitbelow
set splitright
set tabstop=4
set textwidth=80
set ttyfast
set visualbell
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
" Options: Plugins {{{
let NERDTreeMinimalUI = 1
let g:SuperTabDefaultCompletionType = "<c-p>"
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = ''
let g:airline_powerline_fonts=0
let g:airline_right_sep = ''
let g:airline_symbols = {}
let g:airline_symbols.branch = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.readonly = ''
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_show_hidden = 1
let g:gitgutter_highlight_lines = 0
let g:gitgutter_map_keys = 1
let g:gitgutter_sign_column_always = 1
let g:multi_cursor_next_key='j'
let g:multi_cursor_prev_key='k'
let g:multi_cursor_quit_key='J'
let g:multi_cursor_skip_key='l'
let g:multi_cursor_start_key='gh'
let g:multi_cursor_use_default_mapping=0
let g:php_baselib = 1
let g:php_folding = 1
let g:php_sql_query = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_jump = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php']
if exists('$TMUX')
    let g:test#strategy = 'vimux'
endif
let g:test#php#phpunit#options = '--no-coverage'
let g:test#preserve_screen = 0
let g:vim_markdown_folding_disabled = 1
" }}}
" Visual {{{
syntax enable
set background=dark
set t_Co=256

if (has("gui_running"))
    set guifont=Monospace\ Medium\ 12
endif

" Molokai colorscheme.
let g:molokai_original=0
let g:rehash256=1

" Solarized colorscheme.
let g:solarized_termcolors=16
let g:solarized_termtrans=1 " Fix some tmux colour issues.

silent! colorscheme molokai

" Make the sign column background the same
" colour as the colorscheme background.
silent! highlight SignColumn ctermbg=bg guibg=bg

" Make the number column background the
" same as the colorscheme background.
silent! highlight LineNr ctermbg=bg guibg=bg

" Show ruler columns only on lines where the text overflows.
" http://youtu.be/aHm36-na4-4
silent! highlight RulerColumn ctermfg=bg ctermbg=fg guifg=bg guibg=fg
call matchadd("RulerColumn", '\%81v', 100)
silent! highlight RulerColumn2 ctermfg=white ctermbg=red guifg=white guibg=red
call matchadd("RulerColumn2", '\%121v', 200)
" }}}
" Commands {{{

" Trim trailing whitespace.
" http://git.io/vTBO8
function! TrimWhiteSpace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction

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
"autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
"}}}
" Mappings {{{
let mapleader=","

" Fix delay in airline redraw.
" http://superuser.com/a/252717
"inoremap <Esc> <Esc>
"vnoremap <Esc> <Esc>

nnoremap <Space> :

" Make j and k work file linewise instead of screen linewise.
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/nnoremap <up> <nop>
nnoremap j gj
nnoremap k gk

" Scroll viewport faster.
" http://items.sjbach.com/319/configuring-vim-right
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Match bracket pairs.
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
"nnoremap <tab> %
"vnoremap <tab> %

" Yank and paste using system clipboard.
" http://www.drbunsen.org/the-text-triumvirate/
map <leader>y "+y
map <leader>Y "+Y
map <leader>p "+p
map <leader>P "+P
noremap <leader>yy "+Y

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

" PHPUnit
nnoremap <leader>va :call PHPUnitRunTests()<CR>
nnoremap <leader>vt :call PHPUnitRunSingleTest()<CR>

" vim-test
nnoremap <leader>t :silent :TestNearest<CR>
nnoremap <leader>T :silent :TestFile<CR>
nnoremap <leader>a :silent :TestSuite<CR>
nnoremap <leader>l :silent :TestLast<CR>
nnoremap <leader>g :silent :TestVisit<CR>

" Misc.
nnoremap <leader>? :call pathogen#helptags()
nnoremap <leader>ov :split $MYVIMRC<CR>
nnoremap <leader>sa ggVG:sort<CR>:w<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>va ggVG<CR>
noremap <leader>d :NERDTreeToggle<CR>
noremap <leader>s :set nolist!<CR>

" Show colorscheme information
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" :inoremap <c-s> <Esc>:w<CR>

" Mappings: Typos {{{
" Don't care if I typo when saving or quitting!
" http://git.io/vTBOa
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
command! E e
command! Q q
command! Qa qa
command! QA qa
command! W w
command! Wa wa
command! WA wa
command! Wq wq
command! WQ wq
" }}}
" Mappings: Disable arrow keys {{{
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" }}}
" }}}
