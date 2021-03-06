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
Plugin 'hail2u/vim-css3-syntax'
Plugin 'othree/html5.vim'
Plugin 'ap/vim-css-color'
Plugin 'tmhedberg/matchit'
Plugin 'Raimondi/delimitMate'
"Plugin 'nginx.vim'

" -------- Sortging
" gs - default mapping
Plugin 'christoomey/vim-sort-motion'
map sr} vi}gs" sorting inside {}
map sr] vi]gs" sorting inside []
map sr) vi]gs" sorting inside ()

" -------- Highlight
" Plugin 'yuezk/vim-js'

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

Plugin 'rakr/vim-one'
let g:airline_theme='one'

Plugin 't9md/vim-quickhl'
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)

nmap <Space>w <Plug>(quickhl-manual-this-whole-word)
xmap <Space>w <Plug>(quickhl-manual-this-whole-word)

nmap <Space>c <Plug>(quickhl-manual-clear)
vmap <Space>c <Plug>(quickhl-manual-clear)

nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

nmap <Space>j <Plug>(quickhl-cword-toggle)
nmap <Space>] <Plug>(quickhl-tag-toggle)
map H <Plug>(operator-quickhl-manual-this-motion)

"--------- GIT

Plugin 'tpope/vim-fugitive'
nnoremap <silent> <leader>gs :Gstatus<CR>
nmap <D-9> :tabnew %<CR>:Gstatus<CR><c-w>o G [[
nnoremap <silent> <leader>gd :Gvdiffsplit!<CR>
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
nmap <Leader>hk <Plug>(GitGutterPrevHunk)
nmap <Leader>hj <Plug>(GitGutterNextHunk)
nmap <Leader>hs <Plug>(GitGutterStageHunk)
nmap <Leader>hr <Plug>(GitGutterUndoHunk)
nmap <Leader>hp <Plug>(GitGutterPreviewHunk)


"--------- /GIT

Plugin 'bling/vim-airline'
let g:airline_detect_whitespace=0
" Show tabs
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_buffers = 0
"let g:airline#extensions#tabline#formatter = 'unique_tail'

" Don't show branch info - it takes to much space
let g:airline#extensions#branch#enabled = 0
" Don't show info about changed lines
"let g:airline#extensions#hunks#enabled = 0


Plugin 'Lokaltog/vim-easymotion'
" Move to word
map  <Leader>w <Plug>(easymotion-w)
map <Leader>W <Plug>(easymotion-W)
"nmap <Leader>w <Plug>(easymotion-overwin-w)
map  <Leader>e <Plug>(easymotion-e)
nmap <Leader>E <Plug>(easymotion-E)
"nmap <Leader>e <Plug>(easymotion-overwin-e)
map  <Leader>b <Plug>(easymotion-b)
nmap <Leader>B <Plug>(easymotion-B)
"nmap <Leader>b <Plug>(easymotion-overwin-b)
" use other windows also
"" <Leader>f{char} to move to {char}
map  <Leader><Leader>f <Plug>(easymotion-bd-f)
nmap <Leader><Leader>f <Plug>(easymotion-overwin-f)
map <Leader><Leader>t <Plug>(easymotion-bd-t)
nmap <Leader><Leader>t <Plug>(easymotion-overwin-t)
" Move to line
map <Leader><Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader><Leader>L <Plug>(easymotion-overwin-line)
" s{char}{char} to move to {char}{char}
"nmap s <Plug>(easymotion-overwin-f2)
map <Leader><Leader>s <Plug>(easymotion-overwin-f2)
nmap <Leader><Leader>s <Plug>(easymotion-overwin-f2)

Plugin 'haya14busa/incsearch.vim'


let g:EasyMotion_smartcase = 1

"comments
Plugin 'vim-scripts/The-NERD-Commenter'
let g:NERDSpaceDelims = 1
:map <C-\> ,ci


"-------- Docker
Plugin 'ekalinin/dockerfile.vim'

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
vmap <D-O> :<C-U>CtrlPMixed<CR>
nmap <D-B> :CtrlPBuffer<CR>
nmap <D-D> :CtrlPBookmarkDir<CR>


"Plugin 'Shougo/unite.vim'
"Plugin 'Shougo/neomru.vim'
"Plugin 'Shougo/vimproc.vim'
"nnoremap <silent> <Leader>ur :Unite -buffer-name=recent -winheight=10 file_mru<cr>
"nnoremap <Leader>ub :Unite -buffer-name=buffers -winheight=10 buffer<cr>
"nnoremap <Leader>ug :Unite grep:.<CR><C-r><C-w><cr>
"vnoremap <Leader>us "zy:Unite grep:.<CR><C-r>z<cr>
"vnoremap <Leader>ud "zy:Unite grep:.<CR><C-r>z *=<cr>
"let g:unite_source_rec_async_command = 'ack -f --nofilter'
"if executable('ack')
    "let g:unite_source_grep_command = 'ack'
    "let g:unite_source_grep_default_opts = '-i --no-heading  --no-color -H'
    "let g:unite_source_grep_recursive_opt = ''
"endif

Plugin 'eugen0329/vim-esearch'
let g:esearch = {
  \ 'adapter':    'ack',
  \ 'backend':    'vim8',
  \ 'out':        'win',
  \ 'batch_size': 300,
  \ 'use':        ['visual', 'hlsearch', 'last'],
  \}
"map <c-f>  ,ff
"map <D-F> <Plug>(esearch)
hi ESearchMatch ctermfg=black ctermbg=white guifg=#000000 guibg=#E6E6FA


"-------- /search

"---------- Syntax check

Plugin 'w0rp/ale'
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_sign_error =  "✗"
let g:ale_sign_warning = "⚠"
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" Enable completion where available.
"let g:ale_completion_enabled = 1


" After this is configured, :ALEFix will try and fix your JS code
let g:ale_fixers = {
\   'javascript': ['prettier','eslint'],
\}
"\   'javascript': ['eslint'],
"\   'javascript': ['prettier', 'eslint'],
"\   'javascript': ['prettier_eslint'],
" Set this setting if you want to fix files automatically on save.
let g:ale_fix_on_save = 0
nmap <Leader>p <Plug>(ale_fix)

"---------- /Syntax check

Plugin 'ntpeters/vim-better-whitespace'


Plugin 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-m>'
"let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-m>'
"let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-m>'
"let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


Plugin 'scrooloose/nerdtree'
"nnoremap <Leader>n :NERDTreeToggle<cr>
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

Plugin 'elzr/vim-json'

Plugin 'kshenoy/vim-signature' "plugin to place, toggle and display marks.
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'romainl/vim-qlist'



Plugin 'marijnh/tern_for_vim'

"---------- COMPLETE
Plugin 'ervandew/supertab'
Plugin 'valloric/youcompleteme'
" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

let g:ycm_goto_buffer_command = 'split-or-existing-window'
autocmd FileType javascript nmap <buffer> <C-]> :tab  YcmCompleter GoTo<CR>
autocmd FileType javascript nmap <buffer> <leader>gv :rightbelow vertical YcmCompleter GoTo<CR>
autocmd FileType javascript nmap <buffer> <leader>gs :aboveleft YcmCompleter GoTo<CR>
"autocmd FileType javascript nmap <buffer> <leader>gt :tab YcmCompleter GoTo<CR>
autocmd FileType javascript nmap <buffer> <leader>gt :YcmCompleter GetType<CR>
autocmd FileType javascript nmap <buffer> <leader>gr :tab YcmCompleter GoToReferences<CR>
autocmd FileType javascript nmap <buffer> <leader>gn :YcmCompleter RefactorRename<CR> "need to fix

let g:ycm_enable_diagnostic_signs = 0

" For debug
" :YcmDebugInfo
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'
" Track the engine.
"https://brigade.engineering/sharpen-your-vim-with-snippets-767b693886db
Plugin 'SirVer/ultisnips'
" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<c-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-k>', '<C-p>', '<Up>']


" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
"---------- /COMPLETE
"

" https://vimawesome.com/plugin/dash-vim
"Plugin 'rizzatti/dash.vim'

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

colorscheme solarized
"colorscheme OceanicNext
"colorscheme gruvbox
"set guifont=Monaco:h15 noanti
set guifont=JetBrainsMono-Regular:h16
set linespace=1
"set guifont=Menlo:h14
"

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
"vnoremap <C-X> "+x
"vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>		"+gP
imap <C-V>		<c-r>+
map <S-Insert>		"+gP

" Replace a word from the " bufer withou changing of bufer
nmap <silent> cp "_ce<C-R>"<Esc>

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
map <leader>tc :tabp<cr>:+tabclose<cr>
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
"
"format xml
" :1,$!xmllint --format --recover - 2>/dev/null
"
"
" ----------------------------- FORMATTING LOGS ---------------------
" format logs from Kibana
:map <leader>flog :%s/\\"/"/g<cr>:%s/"{/{/g<cr>:%s/}"/}/g<cr>:%!python -m json.tool<CR>:set filetype=javascript<cr>
:map <leader>fjs :%!~/.pyenv/shims/js-beautify<cr>:set filetype=javascript<cr>

" ----------------------------- /FORMATTING LOGS ---------------------

set exrc

