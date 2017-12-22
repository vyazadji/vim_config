"Reload your .vimrc after saving the changes:
" :source $MYVIMRC
"
" Vundle
" Update plugins:
" :PluginUpdate
"
" :PluginClean
"
let mapleader = ","

"-------------------- VUNDLE ---------------------

set nocompatible

filetype off

"set rtp+=$VIMRUNTIME/../vimfiles/bundle/vundle/
set rtp+=~/.vim/bundle/Vundle.vim


call vundle#begin()


Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'vim-ruby/vim-ruby'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'othree/html5.vim'
Plugin 'ap/vim-css-color'
Plugin 'tmhedberg/matchit'
Plugin 'Raimondi/delimitMate'
Plugin 'nginx.vim'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
ino <c-q> <c-r>=TriggerSnippet()<cr>
snor <c-q> <esc>i<right><c-r>=TriggerSnippet()<cr>



"Plugin '907th/vim-auto-save'
"let g:auto_save = 1  " enable AutoSave on Vim startup
"let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
"let g:auto_save_silent = 1  " do not display the auto-save notification

" -------- Color themes
Plugin 'flazz/vim-colorschemes'
Plugin 'chriskempson/base16-vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'morhetz/gruvbox'

Plugin 'altercation/vim-colors-solarized'
if has('gui_running')
  "set background=light
  set background=dark
else
  set background=dark
  let g:solarized_termcolors=256
  let g:solarized_termtrans = 1
endif

"colorscheme hybrid


"--------- GIT

Plugin 'tpope/vim-fugitive'
nnoremap <silent> <leader>gs :Gstatus<CR>
nmap <D-9> :tabnew<CR>:e .<CR> :Gstatus<CR><C-N>dp
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
nmap <Leader>hr <Plug>GitGutterUndoHunk
nmap <Leader>hp <Plug>GitGutterPreviewHunk



Plugin 'bling/vim-airline'
let g:airline_detect_whitespace=0

Plugin 'Lokaltog/vim-easymotion'
"map <Leader> <Plug>(easymotion-prefix)
" use other windows also
"" <Leader>f{char} to move to {char}
map  <Leader><Leader>f <Plug>(easymotion-bd-f)
nmap <Leader><Leader>f <Plug>(easymotion-overwin-f)
" Move to line
map <Leader><Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader><Leader>L <Plug>(easymotion-overwin-line)
" Move to word
"map  <Leader><Leader>w <Plug>(easymotion-bd-w)
"nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)
" s{char}{char} to move to {char}{char}
"nmap s <Plug>(easymotion-overwin-f2)
map <Leader><Leader>s <Plug>(easymotion-overwin-f2)
nmap <Leader><Leader>s <Plug>(easymotion-overwin-f2)

Plugin 'haya14busa/incsearch.vim'


let g:EasyMotion_smartcase = 1

"comments
Plugin 'vim-scripts/The-NERD-Commenter'
:map <C-\> ,ci


"-------- Docker
Plugin 'ekalinin/dockerfile.vim'

"-------- Scala
"Plugin 'derekwyatt/vim-scala'

"-------- search

Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|node_modules)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] "Ignore files in .gitignore
let g:ctrlp_max_files=0
"let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript', 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
let g:ctrlp_extensions = [ 'bookmarkdir']
"nnoremap <Leader>f :CtrlP<CR>
"nnoremap <Leader>fb :CtrlPBuffer<CR>
"nnoremap <Leader>fr :CtrlPMRU<CR>
nmap <D-E> :CtrlPMRU<CR>
nmap <D-O> :CtrlPMixed<CR>
vmap   <D-O> :<C-U>CtrlPMixed<CR>
nmap <D-B> :CtrlPBuffer<CR>
nmap <D-D> :CtrlPBookmarkDir<CR>

Plugin 'ivalkeen/vim-ctrlp-tjump'
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>
let g:ctrlp_tjump_only_silent = 1



Plugin 'mileszs/ack.vim'
" :LAck the word under the cursor recursively and open the location list.
nnoremap <Leader>a  :Ack -w <C-r><C-w><CR>
vnoremap <Leader>a "zy :Ack -w '<C-r>z'<CR>
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
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
highlight SyntasticWarning guibg=#ff9100
highlight SyntasticError guibg=#ff0000
" let g:syntastic_debug=3
" :mes for showing logs
" :SyntasticInfo javascript
" http://remarkablemark.org/blog/2016/09/28/vim-syntastic-eslint/
" https://medium.com/@bill.turner/quick-dirty-guide-for-using-eslint-with-vim-a20662e6aab2

Plugin 'ntpeters/vim-better-whitespace'
Plugin 'terryma/vim-multiple-cursors'


Plugin 'scrooloose/nerdtree'
nnoremap <Leader>n :NERDTreeToggle<cr>
nnoremap <D-1> :NERDTreeToggle<cr>
nnoremap <Leader>nf :NERDTreeFind<cr>
nnoremap <Leader>nb :Bookmark<cr>
Plugin 'Xuyuanp/nerdtree-git-plugin'


Plugin 'vim-misc'
Plugin 'xolox/vim-session'
:let g:session_autosave = 'yes'
:let g:session_autoload = 'no'
let g:session_autosave_periodic = 10
let g:session_default_to_last = 1
nnoremap <Leader>,SS :SaveSession
nnoremap <Leader>,SO :OpenSession

" React + JSX
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0

Plugin 'kchmck/vim-coffee-script'

" For test
Plugin 'elzr/vim-json'
Plugin 'valloric/youcompleteme'

Plugin 'kshenoy/vim-signature'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'bufexplorer.zip'
Plugin 'romainl/vim-qlist'

Plugin 'eugen0329/vim-esearch'
let g:esearch = {
  \ 'adapter':    'ack',
  \ 'backend':    'vim8',
  \ 'out':        'win',
  \ 'batch_size': 300,
  \ 'use':        ['visual', 'hlsearch', 'last'],
  \}
"map <c-f>  ,ff
map <D-F> <Plug>(esearch)
hi ESearchMatch ctermfg=black ctermbg=white guifg=#000000 guibg=#E6E6FA


Plugin 'marijnh/tern_for_vim'





" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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

"colorscheme solarized
colorscheme gruvbox
set guifont=Monaco:h15 noanti
"set guifont=Menlo:h14

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

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/



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

