" this must be first, because it changes other options as a side effect.
set nocompatible

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Re-organize statusline, using example from here http://got-ravings.blogspot.com.br/2008/08/vim-pr0n-making-statuslines-that-own.html
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{fugitive#statusline()} "fugitive.vim information
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

set number

" hides the buffer instead of closing the files
set hidden
" dont wrap lines
set nowrap
" set tab to be 4 spaces
set tabstop=4
" allow backspace over everything in edit mode
set backspace=indent,eol,start
" set auto indent
set autoindent
" copy the previous indentation
set copyindent
" set 4 space for autoindenting
set shiftwidth=4
" set multiples of shiftwidth when indenting with '<' 
set shiftround
" show the matching symbols
set showmatch
" ignore case when searching
set ignorecase
" use case sensitive when the terms are not all in smallcase
set smartcase
" highlight search terms
set hlsearch
" show search matches as you type
set incsearch
" remember more commands
set history=1000
" levels of undo command
set undolevels=1000
" Change the terminal title
set title
" no sonds
set visualbell
set noerrorbells
" show the cursor position all the time
set ruler 
" display incomplete commands
set showcmd
" set 4 lines on the edge of the screen
set scrolloff=4
" let the cursor go anywhere
set virtualedit=all
" no backup file :D
set nobackup
set noswapfile

" Set the identation on
filetype indent on

" highlight the syntax
syntax on
highlight Normal ctermfg=grey ctermbg=black
"set color scheme
colorscheme molokai
set background=dark
" set the default gui font to Monaco
set guifont=Inconsolata\ 12
" disable the toolbar
set guioptions-=T
" disable the menu
set guioptions-=m
" set the tab space to 4
set ts=4
" convert tab to spaces
set expandtab
" highlights interpolated variables in sql strings and does sql-syntax highlighting. yay
autocmd FileType php let php_sql_query=1
" does exactly that. highlights html inside of php strings
autocmd FileType php let php_htmlInStrings=1
" no short tags
autocmd FileType php let php_noShortTags=1
" automagically folds functions & methods. this is getting IDE-like isn't it?
autocmd FileType php let php_folding=1
" autocomplete funcs and identifiers for languages
autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete

" Set multiple filetypes to the php files
autocmd Filetype php set ft=php.html

" In many terminal emulators the mouse works just fine, thus enable it.
" set "make" command when editing php files
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l

if has('mouse')
  set mouse=a
endif

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq
" Activate the Zencoding
imap <C-z> <Esc><C-y>,a
" Activate Nerd Commenter
map <C-c> <leader>ci
" Avoid accidental hits of <F1> while aiming for <Esc>
map! <F1> <Esc>
" Map taglist plugin shortcut
map <C-f> <Esc>:TlistToggle<cr>
" Check php syntax
"map <F5> :Php<cr>
map <F5> :Phpcs<cr>

map <C-E> :NERDTreeFind<CR>
map <C-y> :tabnew<CR>
map <C-tab> :tabprevious<CR>
map <S-tab> :tabprevious<CR>
map <tab> gt
map ss <esc>:w<cr>
map ssq <esc>:wq!<cr>
map ssa <esc>:wall<cr>
map ssaq <esc>:wallq!<cr>
map ssp <esc>:w !make %<cr>
map sspa <esc>:w <F5><cr>


au! BufRead,BufNewFile *.json setfiletype json
" Highlight long lines (soft limit: 80, hard limit: 100)
au BufWinEnter *.php,*.py let w:m1=matchadd('Search', '\%<101v.\%>80v', -1)
au BufWinEnter *.php,*.py let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)

set termencoding=utf-8
set encoding=utf-8
set lazyredraw                  " don't update the display while executing macros
set laststatus=2                " tell VIM to always put a status line in, even
                                "    if there is only one window
set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete

" Enable filetype plugins
filetype plugin on

:nohl
"Sourced from vim tip: http://vim.wikia.com/wiki/Keep_folds_closed_while_inserting_text
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'L9'

"Good Plugins
"Vim plugin for intensely orgasmic commenting
Plugin 'scrooloose/nerdcommenter' 

"The NERD tree allows you to explore your filesystem and to open files and
"directories. It presents the filesystem to you in the form of a tree which
"you manipulate with the keyboard and/or mouse. It also allows you to perform
"simple filesystem operations.
Plugin 'scrooloose/nerdtree'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'
Plugin 'tpope/vim-surround'
Plugin 'spf13/vim-autoclose'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/matchit.zip'
Plugin 'tyru/capture.vim'
"Powerline is a statusline plugin for vim, and provides statuslines and prompts for several
"other applications, including zsh, bash, tmux, IPython, Awesome and Qtile.
Plugin 'powerline/powerline'
Plugin 'vim-scripts/taglist.vim'


"Test
"Plugin 'Shougo/vimproc'
"Plugin 'Shougo/unite.vim'
"Plugin 'm2mdas/phpcomplete-extended'
"Plugin 'Shougo/neocomplete.vim'
Plugin 'wincent/command-t'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'mileszs/ack.vim'

"Removed
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'joonty/vim-phpunitqf.git'
Plugin 'joonty/vim-phpqa'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'spf13/PIV'
Plugin 'Shougo/neocomplcache'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Cscope
if has("cscope")
    set csprg=/usr/local/bin/cscope
    set csto=0
    set cst
    set nocsverb

    "add any database in current directory
    if filereadable("cscope.out")
	cs add cscope.out
    endif
endif

"Mapping
nnoremap <F8> :cs reset <CR>
nnoremap <C-\>s :cs find s <cword><CR>
nnoremap <C-]> :cs find g <cword><CR>
nnoremap <C-\>c :cs find c <cword><CR>
nnoremap <C-F> :cs find t 
nnoremap <C-\>e :cs find e <cword><CR>
nnoremap <C-\>f :cs find f <cword><CR>
nnoremap <C-\>i :cs find i <cword><CR>
nnoremap <C-\>d :cs find d <cword><CR>
map <tab> gt
let g:ctrlp_match_window = 'results:100'


autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
"let g:phpcomplete_index_composer_command="php composer.phar --quiet"
