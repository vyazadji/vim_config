
let mapleader = ","

"-------------------- VUNDLE ---------------------

set nocompatible

filetype off  

"set rtp+=$VIMRUNTIME/../vimfiles/bundle/vundle/
set rtp+=~/.vim/bundle/Vundle.vim


call vundle#rc()

filetype plugin indent on


Bundle "gmarik/Vundle.vim"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-haml"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-bundler"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-cucumber"
Bundle "tpope/vim-repeat"
Bundle 'vim-ruby/vim-ruby'
Bundle "kchmck/vim-coffee-script"
Bundle "hail2u/vim-css3-syntax"
Bundle "othree/html5.vim"
Bundle "ap/vim-css-color"
Bundle "msanders/snipmate.vim"

Bundle 'Lokaltog/vim-easymotion'
map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_smartcase = 1

"comments
Bundle 'vim-scripts/The-NERD-Commenter'
:map <C-\> ,ci


Bundle "altercation/vim-colors-solarized"
set background=dark 
"set background=light
colorscheme solarized

Bundle "kien/ctrlp.vim"
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

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

au GUIEnter * simalt ~x

"Don't show message about children
set shortmess+=I 

"Highlight current line in insert mode
autocmd InsertEnter * set cursorline "cursorcolumn
autocmd InsertLeave * set nocursorline

set nu

set nobackup
set nowritebackup
set noswapfile

set statusline=%f\ %y%m%r%<[%{&encoding}]%<[%{&fileformat}]%<[%{strftime(\"%d.%m.%y\",getftime(expand(\"%:p\")))}]%k%=%-14.(%l,%c%V%)\ %P

" don't unload buffer when leave current tab
set hidden

" save more info when exit 
:set viminfo='1000,f1,<500,:100,@100,/100

" disable toolbar panel 
set guioptions=maeirL


"highlight Normal guibg=#FFFFA0 

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

" save changes
map ,s :w<CR>
imap ,s <esc>,sa
" exit vim without saving any changes
map ,q :qa!<CR>

" show and replace world under cursor 
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/
vmap // y/<C-R>"<CR> " search for visually higlightes text

"quick move between windows
:map <c-j> <c-w>j
:imap <c-j> <esc><c-j>
:map <c-k> <c-w>k
:imap <c-k> <esc><c-k>
map <c-_> <c-w>_
map <c-=> <c-w>=
imap <c-=> <esc><c-=>

"  disable speaker 
"set novisualbell
set vb t_vb= 

" ----------------------------- /GENERAL BUTTONS MAPPING ----------------------
