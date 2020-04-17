set nocompatible              " be iMproved, required
filetype off                  " required
set cindent cinoptions+=j1
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'chr4/nginx.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'AndrewRadev/sideways.vim'
Plugin 'wincent/command-t'
Plugin 'vimplugin/project.vim'
Plugin 'vim-scripts/ZoomWin'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'derekwyatt/vim-scala'
Plugin 'kchmck/vim-coffee-script'
Plugin 'hail2u/vim-css3-syntax.git'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'vim-scripts/SQLUtilities'
Plugin 'vim-scripts/Align'
Plugin 'leafgarland/typescript-vim'
Plugin 'wavded/vim-stylus'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'mtscout6/syntastic-local-eslint.vim'
Plugin 'https://github.com/rhysd/vim-fixjson'
Plugin 'prettier/vim-prettier'

let g:syntastic_cpp_compiler = 'g++-9'
let g:syntastic_cpp_compiler_options = '-std=c++14 -Wall'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']
call vundle#end()            " required
" begin steven code
let g:jsx_ext_required = 0 " jsx on .js files as well
filetype plugin indent on    " required
syntax on
set splitright
nnoremap ,<LEFT> :SidewaysLeft<cr>

" keyboard shortcuts
let mapleader = ';'
nnoremap <leader>/ /<C-R>"<CR>
nnoremap <leader>; :tabn<CR>
map # <plug>NERDCommenterToggle
nnoremap <leader>r :YcmCompleter RestartServer<CR>
nnoremap <leader><CR> :YcmCompleter GoToDefinition<CR>
nnoremap C <C-I>
nnoremap R <C-O>
nnoremap <silent> <leader><DOWN> :NERDTreeFocus<CR>
nnoremap <silent> <leader><UP> :NERDTreeClose<CR>
map <leader>f :NERDTreeFind<cr>
nnoremap <silent> <leader><LEFT> <C-W><C-H>
nnoremap <silent> <leader><RIGHT> <C-W><C-L>
noremap <silent> <leader>v :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
noremap <silent> <leader>z :ZoomWin<CR>
" in case you forgot to sudo


nnoremap ,<RIGHT> :SidewaysRight<cr>
map ,y "+y
map ,p "+p
map ,P "+P
vnoremap <silent> <leader> :SQLUFormatter<CR>
nnoremap <silent> <leader> V:SQLUFormatter<CR>
nnoremap K f{a<cr><esc>

autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4

" end steven code


set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=2                                                " actual tabs occupy 8 characters
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc,client/**
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 0

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell
" extra rails.vim help
autocmd User Rails silent! Rnavcommand decorator      app/decorators            -glob=**/* -suffix=_decorator.rb
autocmd User Rails silent! Rnavcommand observer       app/observers             -glob=**/* -suffix=_observer.rb
autocmd User Rails silent! Rnavcommand feature        features                  -glob=**/* -suffix=.feature
autocmd User Rails silent! Rnavcommand job            app/jobs                  -glob=**/* -suffix=_job.rb
autocmd User Rails silent! Rnavcommand mediator       app/mediators             -glob=**/* -suffix=_mediator.rb
autocmd User Rails silent! Rnavcommand stepdefinition features/step_definitions -glob=**/* -suffix=_steps.rb
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Don't copy the contents of an overwritten selection.
vnoremap p "_dP

" Go crazy!
if filereadable(expand("~/.vimrc.local"))
  " In your .vimrc.local, you might like:
  "
  " set autowrite
  " set nocursorline
  " set nowritebackup
  " set whichwrap+=<,>,h,l,[,] " Wrap arrow keys between lines
  "
  " autocmd! bufwritepost .vimrc source ~/.vimrc
  " noremap! jj <ESC>
  source ~/.vimrc.local
endif
map ff mzgg=G`z
colorscheme peachpuff
