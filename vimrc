"dmrd vimrc
"Frankensteined from the internet.  Large parts from Steve Losh
"Could use some reorganization

"Init -----------------------------------------------{{{
set nocompatible "It's not vi!

set rtp+=~/.vim/bundle/vundle/,/usr/share/lilypond/2.14.2/vimk/
call vundle#rc()

" Github repos ------------------------------------{{{

"Package management
Bundle 'vundle'
"w,e,b operate on camelCaseText
Bundle 'bkad/CamelCaseMotion'
"Break out region into its own buffer. Changes transfer back
Bundle 'chrisbra/NrrwRgn'
"Completion from other words in buffer
"Bundle 'ervandew/supertab'
"Essentially a tab view for buffers (not the same as the built in tabs)
Bundle 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplUseSingleClick=1
"Aligning code
Bundle 'godlygeek/tabular'
"Interface to emacs org-mode
Bundle 'hsitz/VimOrganizer'
"Latex plugin
Bundle 'jcf/vim-latex'
"Solarized
Bundle 'altercation/vim-colors-solarized'

"Like command-T but uses only vimscript
Bundle 'kien/ctrlp.vim'
let g:ctrlp_use_caching=1
let g:ctrlp_clear_cache_on_exit=0

"Color matching parens various colors
"Limited usability, may get rid of
Bundle 'kien/rainbow_parentheses.vim'
"Bundle 'kikijump/tslime.vim'
"Bundle 'klen/python-mode'
"Jumping long distances - ,,w/e/b
Bundle 'Lokaltog/vim-easymotion'
"Cool status bar
Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols='unicode'
"Tags
Bundle 'majutsushi/tagbar'
"Like snipmate but better/fucks up digraphs
"Bundle 'SirVer/ultisnips'
",c* comments stuff in/out
Bundle 'scrooloose/nerdcommenter'
"File explorer
Bundle 'scrooloose/nerdtree'
"Automatic syntax/code checker
Bundle 'scrooloose/syntastic'
let g:syntastic_auto_loc_list=1

",lj will allow jumping to to buffers easily
Bundle 'sjbach/lusty'
"Undo tree visualizer
Bundle 'sjl/gundo.vim'
"Git integration
Bundle 'tpope/vim-fugitive'
"Lets . repeat more types of commands
Bundle 'tpope/vim-repeat'
""Operate on surrounding symbols (like change parens to brackets)
Bundle 'tpope/vim-surround'
"Random functions. [e ]e switch lines (stuff like that)
Bundle 'tpope/vim-unimpaired'
"Build a single file. Very easy to use without make
Bundle 'xuhdev/SingleCompile'
" }}}

" Vim-scripts------------------------------------ {{{
"Lets me edit files in hex
Bundle 'vim-scripts/hexman.vim'
"Assembly language syntax highlighting
Bundle 'vim-scripts/GNU-as-syntax'
"Makes Vim work better with large files
Bundle 'LargeFile'
""Cpp completion
Bundle 'OmniCppComplete'
",d will pull up all lines with TODO
Bundle 'TaskList.vim'
""Clipboard manager
Bundle 'YankRing.vim'
"<c-w>o to toggle "zooming into" a window
Bundle 'ZoomWin'
"For Calendar
let g:calendar_navi = ''
" }}}
" }}}

" Basic options & behaviors -----------------------------------------------{{{
filetype plugin indent on

set encoding=utf-8
set modelines=0
set updatetime=4000

"Misc settings for usability

syntax on
"Allow hidden buffers
set hidden

"Number of spaces a tab ('\t') is shown as
set tabstop=8
"Number spaces to use per step of autoindent (<< >> cindent)
set shiftwidth=2
"Number of spaces pressing tab inserts
set softtabstop=2
"Presing tab inserts spaces
set expandtab
set smarttab

"Scroll up or down when # lines away from edge
set scrolloff=15
set autoindent
set smartindent
"Alert me if a file has been changed
set autoread
set showmode
set showcmd
"No flashing.
set novisualbell
set noerrorbells
"Increases smoothness - fast terminal
set ttyfast

"Show current line/column in statusbar
"Not necessary thanks to powerline
"set ruler

"Can backspace over autoindents, linebreaks (join lines), and start of insert
"without start means no backspacing except through what was just inserted.
"Must use x/d/some other method in such cases
set backspace=indent,eol,start "Same as set backspace=2
"Set wrapping directives
set whichwrap=<,>,b,s,h,l
"Every window has a status line
set laststatus=2
"Line numbers - can set relative/absolute style
set number

" Don't try to highlight lines longer than 500 characters.
set synmaxcol=500

" do not redraw while running macros (much faster) (LazyRedraw)
set lazyredraw
" Better Completion
set completeopt=longest,menu,menuone,preview

"Wrap text to fit on screen
set wrap
set linebreak
"Break lines at whitespace after # characters
set textwidth=78
"Allow larger history in command mode
set history=1000
"q: allow formatting comments with gq
"r: auto insert comment leader on newline
"n: detect numbered lists
"1: Don't break line after 1 letter words
set formatoptions=tcroqwn2l1j
"Do not scroll windows together
set noscrollbind

"Enable mouse, hide mouse when typing in gvim
set mouse=a "HERESY!
set mousehide

"Special characters for tab and eol
set list
set listchars=tab:▸\ ,eol:¬

"Move by screen line
nnoremap j gj
nnoremap k gk
"gj/k now move by logical line
nnoremap gj j
nnoremap gk k
" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

" Change cdir to current file location
"   Mainly for ctrlp
set autochdir

"Appearances -----------------------------------------------{{{
"Get some color in here

colorscheme default
set background=dark

highlight Visual ctermfg=white ctermbg=darkgrey
highlight CursorColumn ctermfg=green ctermbg=red

" GUI ----------------------------------------------- {{{

if has('gui_running')
  set background=light
  colorscheme solarized

  "No toolbar
  "No menubar
  "No scrollbar
  set guioptions=

  set guifont=DejaVu\ Sans\ Mono\ 9
endif

" }}}

" }}}

" }}}
" Tags ----------------------------------------------- {{{
"Check these directories for tag files
set tags+=~/vim/commontags
set tags+=./tags;
" }}}

" Wildmenu ---------------------------------------------{{{

"Command completion - list all matches, match to longest string
set wildmenu
set wildmode=list:longest

"Ignore all of this
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.dvi,*.tif,*.pdf,*.xoj          " Other graphical files
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*~
set wildignore+=*/.vim/tmp/*

" }}}

" Search -----------------------------------------------{{{

"Because everyone loves real regex search (Or, as vim puts it, VERY MAGICAL)
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault "Global substitute by default - put /g to change to first in line
set incsearch
set showmatch
set hlsearch
set wrapscan
nnoremap <silent> <leader>n :let @/=""<cr>
" }}}

"backup stuff -----------------------------------------------{{{

set undofile
set undoreload=100000
set undodir=~/.vim/tmp/undo//     " undo files - this I DO need
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup                        " enable backups - may not be really needed
set noswapfile                    " It's 2012, Vim. I haz version control

"}}}

" Folding -----------------------------------------------{{{
set foldenable
"Start unfolded
set foldlevelstart=100

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

"Refocus folds - close all folds, open current
nnoremap ,z zMzvzz

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

"Default fold method --- use the three braces ({{{  }}})
"No default - rather, set it up by filetype
"setlocal foldmethod=marker

" }}}

" Leader stuff & nonplugin leader mappings --------------------------------{{{
"My fingers are lazy
let mapleader = ','
nnoremap ; :
vnoremap ; :

"Command sanity
set timeout
set timeoutlen=400
set showcmd

"Clear whitespace in file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR><c-o>

"Reselect pasted text
"nnoremap <leader>v V`]

"Open vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<CR>

"Who types jk in normal text anyways?
"Also, remember TODO remap capslock to esc
inoremap jk <ESC>
inoremap kj <ESC>

"Open a new vertical split
nnoremap <leader>v <C-w>v<C-w>l

"Horizontal split
nnoremap <leader>h <C-w>s<C-w>j

"Toggle line numbers - relative good for jumping
nnoremap <leader>lr :setlocal relativenumber!<cr>
nnoremap <leader>la :setlocal number!<cr>

"Awesome save leader mapping
nnoremap <leader>w :w!<CR>

"Quit mapping
nnoremap <leader>q :q<CR>

" }}}


"Buffer navigation -----------------------------------------------{{{
map <C-h> <C-w>h
map <C-l> <C-w>l

map <F1> :bprevious<CR>
"Overidden by yankring
map <C-p> :bprevious<CR>
map <F2> :bnext<CR>
"Ditto on yankring
map <C-n> :bnext<CR>

"Useful plugin for fast switching - default ,lj
"nnoremap <Leader>b LustyJuggler<cr>
"Disable default mappings for LustyJuggler/Explorer
"I do not use explorer, so no new mappings for it
let g:LustyExplorerDefaultMappings=0
" }}}

"TeX settings -----------------------------------------------{{{
set grepprg=grep\ -nH\ $*

let g:Tex_DefaultTargetFormat='pdf'
let g:tex_flavor='latex'
" }}}

" Misc & mappings ---------------------------- {{{

" Write as sudo
cmap w!! w !sudo tee % >/dev/null

"TODO: Should find out more about these two - basically hacky local refactor
" Limited usage
" For local replace
nnoremap gr gd[{V%:s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

" Using <c-e> and <c-y> from insert mode
inoremap <c-e> <esc><c-e>
inoremap <c-y> <esc><c-y>

nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

"Gundo
nnoremap <F4> :GundoToggle<CR>

"command-t entirely in vim script
nnoremap <leader>t :CtrlPBufTagAll<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>f :CtrlPMixed<cr>

"my [to]do list in each file
map <Leader>d <Plug>TaskList

" alignment plugin
nmap <leader>a= :Tab assignment<cr>
vmap <leader>a= :Tab assignment<cr>

" when to enable large file plugin in MB
let g:LargeFile=10

"Yankring location
let g:yankring_history_dir="~/.vim/tmp"

map <F6> <Plug>HexManager
"Spawn a new terminal in my current directory
map <silent> <F7> :!urxvtc<CR>

nnoremap <F9> :SingleCompile<CR>
nnoremap <F10> :SingleCompileRun<CR>
"Tagbar for tag navigation
nnoremap <F11> :TagbarToggle<cr>
nnoremap <F12> :NERDTreeToggle<CR>

nnoremap <leader>ss :mksession

"Toggle rainbow parens - Should make more vibrant
nnoremap <leader>R :RainbowParenthesesToggle<cr>

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

"set cpo-=<
"set wcm=<C-Z>
"map <F4> :emenu <C-Z>

"Nerdtree if no arguments given
"autocmd vimenter * if !argc() | NERDTree | endif

" Fugitive {{{
let g:extradite_width = 60
nmap <leader>gs :Gstatus<CR>
nmap <leader>gg :Ggrep
nmap <leader>gl :Extradite!<CR>
nmap <leader>gd :Gdiff<CR>
nmap <silent> <C-\> :Ggrep <cword><CR>:copen<CR>
" }}}

" }}}

"Language bindings --------------------------------------- {{{

" Plaintext {{{
augroup ft_txt
  au!
  au FileType txt set colorcolumn=0
  au FileType txt set foldmethod=indent
  set nonumber
augroup END
" }}}

" C {{{
augroup ft_c
    au!
    au FileType c setlocal foldmethod=syntax
    au FileType c call SetNarrowText()
    au FileType c call EmacsTab()
augroup END
" }}}

" Assembly {{{
augroup ft_asm
    au!
    au FileType asm setlocal comments+=:##
    au FileType asm setlocal noexpandtab
    au FileType asm setlocal softtabstop=0
    au FileType asm setlocal shiftwidth=8
    au FileType asm setlocal foldmethod=syntax
    au FileType asm call SetNarrowText()
    set number
augroup END
" }}}

" Cpp {{{
augroup ft_cpp
    au!
    au FileType cpp setlocal foldmethod=syntax
    au FileType cpp call SetNormalText()
augroup END
" }}}

" Java {{{
augroup ft_java
    au!
    au FileType java setlocal foldmethod=marker
    au FileType java setlocal foldmarker={,}
    au FileType java call SetNormalText()
augroup END
" }}}

" Javascript {{{
augroup ft_javascript
    au!
    au FileType javascript setlocal foldmethod=marker
    au FileType javascript setlocal foldmarker={,}
    au FileType javascript call SetNormalText()
augroup END
" }}}

" Python {{{
augroup ft_python
    au!
    au FileType python setlocal foldmethod=indent
    au Filetype python setlocal foldnestmax=2
    au FileType python call SetNormalText()
    au FileType python set shiftwidth=2
    au FileType python set softtabstop=2
augroup END
" }}}

" Vim {{{
augroup ft_vim
    au!
    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
augroup END
" }}}

" LaTeX {{{
augroup ft_latex
    au!
    au FileType tex call TexAU()
    au FileType tex let g:Tex_DefaultTargetFormat="pdf"
augroup END
" }}}

" Org stuff {{{
augroup ft_org
    au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
    au BufEnter *.org            call org#SetOrgFileType()
    let g:org_command_for_emacsclient = 'emacsclient'

    let g:org_capture_file = '/mnt/data/Dropbox/org/captures.org'
    command! OrgCapture :call org#CaptureBuffer()
    command! OrgCaptureFile :call org#OpenCaptureFile()

    let g:org_agenda_select_dirs = ["/mnt/data/Dropbox/org/"]
    let g:org_agenda_files = split(glob("/mnt/data/Dropbox/org/*.org"),"\n")
    let g:org_agenda_window_position = 'right'

    nnoremap <leader>c :OrgCapture<cr>
    nnoremap <leader>o :OrgCaptureFile<cr>
    au BufEnter *.org :1SpeedDatingFormat %Y-%m-%d %a
    "This is rather buggy...
    "let g:org_mobile_directory = ["/mnt/data/Dropbox/org/mobile"]
    "let g:org_mobile_files = ["/mnt/data/Dropbox/main.org"]
    "let g:org_mobile_inbox_for_pull = ["/mnt/data/Dropbox/org/mobile/from-mobile.org"]
augroup END

" }}}

" My own remappings ----------------------------------------{{{
" TeX {{{

function! TexAU()
  iabbrev <buffer> `P \Phi
  inoremap <buffer> / $$<lt>++><esc>4hi
  inoremap <buffer> ? _
  inoremap <buffer> > :
  inoremap <buffer> < ;
  inoremap <buffer> ' ^
  inoremap <buffer> ; &
  inoremap <buffer> : %
  inoremap <buffer> [ {}<lt>++><esc>4hi
  inoremap <buffer> ] }
  inoremap <buffer> { []<lt>++><esc>4hi
  inoremap <buffer> } ]
  inoremap <buffer> ( ()<lt>++><esc>4hi
  inoremap <buffer> _ /
  inoremap <buffer> & '
  inoremap <buffer> ^ >
  inoremap <buffer> % <
  inoremap <buffer> $ ?
  inoremap <buffer> <c-s-=> &=
  inoremap <buffer> <c-j> <esc><c-j>

  " Taglist toggle
  nnoremap <silent> <F8> :TlistToggle<CR>
  set foldmethod=indent
  set shiftwidth=4
  set softtabstop=4
endfunction

function! SetNormalText()
  set colorcolumn=78
  set textwidth=78
endfunction

function! SetNarrowText()
  set colorcolumn=72
  set textwidth=72
endfunction

function! HighlightWhitespace()
  " Space highlighting at EOL
  highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+$/
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()
endfunction

function! EmacsTab()

  " Change tab behavior to emacs-like indentation
  set cinkeys=0{,0},0),0#,!<Tab>,;,:,o,O,e,!
  set cinoptions={1s,>2s,e-1s,^-1s,n-1s,:1s,p5,i4,(0,u0,W1s
  set indentkeys=0{,0},0),0#,!<Tab>,;,:,o,O,e,!,=end,=else,=cat,=fina,=END,0\
  nnoremap <Tab> i<Tab><Esc>^

endfunction

" }}}
" }}}
" }}}
