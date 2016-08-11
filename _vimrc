
let mapleader = ","

"-------------------- VUNDLE ---------------------

set nocompatible

filetype off

"set rtp+=$VIMRUNTIME/../vimfiles/bundle/vundle/
set rtp+=~/.vim/bundle/Vundle.vim


call vundle#begin()


Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-repeat'
Plugin 'vim-ruby/vim-ruby'
Plugin 'kchmck/vim-coffee-script'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'othree/html5.vim'
Plugin 'ap/vim-css-color'
Plugin 'tmhedberg/matchit'
Plugin 'Raimondi/delimitMate'

Plugin 'garbas/snipmate.vim'
ino <c-q> <c-r>=TriggerSnippet()<cr>
snor <c-q> <esc>i<right><c-r>=TriggerSnippet()<cr>



Plugin '907th/vim-auto-save'
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
let g:auto_save_silent = 1  " do not display the auto-save notification

Plugin 'altercation/vim-colors-solarized'
if has('gui_running')
  set background=dark
else
  set background=dark
  let g:solarized_termcolors=256
  let g:solarized_termtrans = 1
endif

Plugin 'tpope/vim-fugitive'
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>

nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gr :Gremove<CR>


Plugin 'gregsexton/gitv'
nnoremap <silent> <leader>gv :Gitv<CR>
nnoremap <silent> <leader>gV :Gitv!<CR>
Plugin 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 1
nmap <Leader>hk <Plug>GitGutterPrevHunk
nmap <Leader>hj <Plug>GitGutterNextHunk
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterRevertHunk
nmap <Leader>hp <Plug>GitGutterPreviewHunk



Plugin 'bling/vim-airline'
let g:airline_detect_whitespace=0

Plugin 'Lokaltog/vim-easymotion'
map <Leader> <Plug>(easymotion-prefix)

let g:EasyMotion_smartcase = 1

"comments
Plugin 'vim-scripts/The-NERD-Commenter'
:map <C-\> ,ci


"docker syntax
Plugin 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}

"-------- search

Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_max_files=0
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript', 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
nnoremap <Leader>f :CtrlP<CR>
nnoremap <Leader>fb :CtrlPBuffer<CR>
nnoremap <Leader>fr :CtrlPMRU<CR>



Plugin 'mileszs/ack.vim'
" :LAck the word under the cursor recursively and open the location list.
nnoremap <Leader>a :sp<CR> :Ack <C-r><C-w><CR>
vnoremap <Leader>a "zy:sp<CR> :Ack '<C-r>z'<CR>
" Location list navigation.
nnoremap ]w :lnext<CR>
nnoremap [w :lprevious<CR>



Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/vimproc.vim'
nnoremap <silent> <Leader>ur :Unite -buffer-name=recent -winheight=10 file_mru<cr>
nnoremap <Leader>ub :Unite -buffer-name=buffers -winheight=10 buffer<cr>
nnoremap <Leader>ug :Unite grep:.<CR><C-r><C-w><cr>
vnoremap <Leader>us "zy:Unite grep:.<CR><C-r>z<cr>
vnoremap <Leader>ud "zy:Unite grep:.<CR><C-r>z *=<cr>
let g:unite_source_rec_async_command = 'ack -f --nofilter'
if executable('ack')
    let g:unite_source_grep_command = 'ack'
    let g:unite_source_grep_default_opts = '-i --no-heading  --no-color -H'
    let g:unite_source_grep_recursive_opt = ''
endif


"-------- /search


Plugin 'scrooloose/syntastic'
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
highlight SyntasticWarning guibg=#ff9100
highlight SyntasticError guibg=#ff0000


Plugin 'ntpeters/vim-better-whitespace'
Plugin 'terryma/vim-multiple-cursors'


"Plugin 'Valloric/YouCompleteMe'

Plugin 'scrooloose/nerdtree'
nnoremap <Leader>n :NERDTreeToggle<cr>
nnoremap <Leader>nf :NERDTreeFind<cr>
nnoremap <Leader>nb :Bookmark<cr>


Plugin 'vim-misc'
Plugin 'xolox/vim-session'
:let g:session_autosave = 'yes'
:let g:session_autoload = 'no'
let g:session_autosave_periodic = 10
let g:session_default_to_last = 1
nnoremap <Leader>,SS :SaveSession 
nnoremap <Leader>,SO :OpenSession 

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

Plugin 'elzr/vim-json'


colorscheme solarized

"-------------------- /VUNDLE ---------------------


" ----------------------------- VIM SETTINGS --------------------------------

set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

set ignorecase
set smartcase

set laststatus=2

set tabstop=4
set softtabstop=2
set shiftwidth=2
set expandtab


set fileencodings=utf-8,cp1251,koi8-r,cp866

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  "Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

if has('win32') || has('win64')
  au GUIEnter * simalt ~x  "use this options only for Windows
endif

"Don't show message about children
set shortmess+=I

"Highlight current line in insert mode
autocmd InsertEnter * set cursorline "cursorcolumn
autocmd InsertLeave * set nocursorline

set nu

set nobackup
set nowritebackup
set noswapfile

"set statusline=%f\ %y%m%r%<[%{&encoding}]%<[%{&fileformat}]%<[%{strftime(\"%d.%m.%y\",getftime(expand(\"%:p\")))}]%k%=%-14.(%l,%c%V%)\ %P

" don't unload buffer when leave current tab
set hidden


" save more info when exit
:set viminfo='1000,f1,<500,:100,@100,/100

" disable toolbar panel
set guioptions=maeirL


"highlight Normal guibg=#FFFFA0


"Vim can highlight whitespaces for you in a convenient way:
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

"Autoread will suppress the prompt when file was changed
set autoread

"Always autosave everything
":au FocusLost * silent! wa
"set autowrite
"set autowriteall

"Save in MacOS buffer
"You can also use pbcopy/pbpaste command to achieve the same thing.
"By default copied text appers in '+' or '*'
set clipboard=unnamed



" ----------------------------- /VIM SETTINGS --------------------------------


" ----------------------------- GENERAL BUTTONS MAPPING ----------------------

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>		"+gP
imap <C-V>		<c-r>+
map <S-Insert>		"+gP

" Replace a word from the " bufer withou changing of bufer
nmap <silent> cp "_cw<C-R>"<Esc>

:imap jj <Esc>
:imap ;; <Esc>$a;<Esc>
:nnoremap ;; $a;<Esc>
:imap ,, <Esc>$a,<Esc>
:imap <c-l> <esc>la

" save changes
map ,s :w<CR>
imap ,s <esc>,sa
" exit vim without saving any changes
map ,q :q!<CR>

map ,t :tabnew<CR>

" show and replace world under cursor
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/
vmap // y/<C-R>"<CR> " search for visually higlightes text

"quick move between windows
:map <c-j> <c-w>j
:imap <c-j> <esc><c-j>
:map <c-k> <c-w>k
:imap <c-k> <esc><c-k>
:map <c-h> <c-w>h
:imap <c-h> <esc><c-h>
:map <c-l> <c-w>l
":imap <c-l> <esc><c-l>
map <c-_> <c-w>_
map <c-=> <c-w>=
imap <c-=> <esc><c-=>

"  disable speaker
"set novisualbell
set vb t_vb=

" Maps for mac Command key (use instead of Control
map <D-d> <C-d>
map <D-u> <C-u>
:nnoremap <D-o> <C-o>

:map <D-\> <C-\>

:map <D-j> <c-w>j
:imap <D-j> <esc><c-j>
:map <D-k> <c-w>k
:imap <D-k> <esc><c-k>
map <D-_> <c-w>_
map <D-=> <c-w>=
imap <D-=> <esc><c-=>

map <D-V> "+gP
imap <D-V> <c-r>+
" ----------------------------- /GENERAL BUTTONS MAPPING ----------------------
"
highlight clear SignColumn

" :%!python -m json.tool " format json in file

