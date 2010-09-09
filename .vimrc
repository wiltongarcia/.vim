" An example for a vimrc file.
"
" Maintainer: Bram Moolenaar <Bram@vim.org>
" Last change: 2008 Jul 02
"
" To use it, copy it to
" for Unix and OS/2: ~/.vimrc
" for Amiga: s:.vimrc
" for MS-DOS and Win32: $VIM\_vimrc
" for OpenVMS: sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

syntax on
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" keep a backup file
set nobackup 
set history=100 
" keep 50 lines of command line history
set ruler 
" show the cursor position all the time
set showcmd 
" display incomplete commands
set incsearch 
" do incremental searching
set hlsearch
" This is done so we can walk around with the cursor
" set virtualedit=all
" Set the default gui font to Monaco
set guifont=Monaco
" Set the autoindent to always on
set autoindent
" Indent functions body
set smartindent
" Disable the toolbar
set guioptions-=T
" Disable the menu
set guioptions-=m
" Add line numbers
set number
" Set the tab space to 4
set ts=4
" Convert tab to spaces
set expandtab
" Set tab spaces to 4
set tabstop=4
" highlights interpolated variables in sql strings and does sql-syntax highlighting. yay
autocmd FileType php let php_sql_query=1
" does exactly that. highlights html inside of php strings
autocmd FileType php let php_htmlInStrings=1
" discourages use oh short tags. c'mon its deprecated remember
autocmd FileType php let php_noShortTags=1
" automagically folds functions & methods. this is getting IDE-like isn't it?
autocmd FileType php let php_folding=1
" autocomplete funcs and identifiers for languages
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
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
" Control + s to write changes"
imap <C-s> <Esc>:w<cr>a
" Control + w to quit"
imap <C-w> <Esc>:q<cr>a
" Control + z to undo"
imap <C-z> <Esc>:u<cr>a
" Shift + Del to delete the current line
imap <S-Del> <Esc>:d<cr>a
" Show the NERDTree window on the /var/www dir
map <C-p> <Esc>:NERDTree /var/www/<cr>
" Show the taglist window
"map <C-t> <Esc>:TlistToggle<cr>
" Toggle autoclose
map <C-a> <Esc>:AutoCloseToggle<cr>
" Activate the Zencoding
imap <C-c> <Esc><C-y>,a

au! BufRead,BufNewFile *.json setfiletype json

colorscheme molokai
