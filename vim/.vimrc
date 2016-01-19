"======================================== Platform Settings ====================================

set nocompatible    "more than vi, VIMproved
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set runtimepath^=~/Dropbox/Tools/Vim/.vim
set directory^=~/

if has('unix')
    " set guifont=Consolas\ 10
    " set guifont=Envy\ Code\ R\ for\ Powerline\ 10
else "has('win32') || has('win64')
    set guifont=Consolas:h10
    set guifont=Envy_Code_R:h10
    set guifont=Envy_Code_R_for_Powerline:h10
    set guifont=Droid_Sans_Mono_Slashed_for_Pow:h10

    " Maximize window on startup
    au GUIEnter * simalt ~x

endif

set guifontwide=NSimsun:h12

"======================================== Vundle Settings ========================================

filetype off        "filetypes will be first handled by Vundle/Git repos

" https://github.com/gmarik/Vundle.vim " Required for Windows (https://github.com/gmarik/vundle/wiki/Vundle-for-Windows) " * Git and Curl (http://code.google.com/p/msysgit/) " * HTTPS_PROXY is set on a corporate Windows machine filetype off " Point Vundle to ~, same as $USERPROFILE and $HOME in Windows
set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin('~/.vim/bundle')
call vundle#begin()

" Vundle managed by Vundle itself 'https://github.com/gmarik/vundle.git'
Plugin 'gmarik/Vundle.vim'

"GIT REPOS
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdtree'
Plugin 'tmhedberg/matchit'
Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/syntastic'

" Plugin 'majutsushi/tagbar'
" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'Shougo/neocomplete.vim'
" Plugin 'fidian/hexmode'

"Git
Plugin 'tpope/vim-fugitive'

"Handlebars
Plugin 'mustache/vim-mustache-handlebars'

"Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" GoLang
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'jstemmer/gotags'

" SnipMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" UltiSnips
" Plugin 'sirver/ultisnips'

" Snippets
Plugin 'honza/vim-snippets'

" Syntax
Plugin 'elzr/vim-json'
Plugin 'jeroenbourgois/vim-actionscript'
Plugin 'vim-scripts/aspnetcs'
Plugin 'groenewege/vim-less'

" Colors
Plugin 'chankaward/vim-railscasts-theme'
Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'

" Tools
Plugin 'duncansmart/less.js-windows'

" Plugin 'powerline/fonts'

call vundle#end()

"======================================== Global Settings ======================================

"FILE
filetype plugin indent on
set nobackup    " do not create a backup file
set noundofile  " do not create an undo file
set hidden      " allow editing new buffers while unsaved changes remain

"Always set fileformats to unix
set fileformats=unix,dos
" set fileformats=unix

if has('multi_byte')
  if &termencoding == ''
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bombvim-railscasts-theme
  set fileencodings=ucs-bom,utf-8,latin1
endif

"COLORS

function! ForceColors()
    highlight Search guifg=black guibg=yellowgreen gui=bold
    highlight LineNr guibg=#111111
    highlight Normal guibg=#000000
    highlight CursorLine guibg=#101010
endfunction

function! ColorScheme(colorscheme)
    execute "colorscheme " . a:colorscheme
    call ForceColors()
    :AirlineRefresh
endfunction

set background=dark
colorscheme gruvbox
"autocmd FileType json call ColorScheme("railscasts")

" Custom Colors
" call ForceColors()

" highlight Directory guifg=#A6E22E gui=bold

"SEARCH
set hlsearch    " highlight all search results
set ignorecase  " ignore search case
set smartcase   " case sensitive search if upper case found

"GUI
set guioptions-=T
set splitbelow
set splitright
set equalalways
set laststatus=2
set columns=120
set lines=56
set cursorline
set visualbell
set shortmess=aoOtT   " Short Messages
" set cmdheight=2     " Two line height command line, one line looks better
set fillchars+=vert:\
set nrformats-=octal  " Dot not assume a number is octal when ++ or --
" set relativenumber  " Line numbers relative to current line
set textwidth=0       " Do not auto insert line breaks
set formatoptions-=t  " Do not insert line breaks at

"TABS
set smarttab        " insert spaces instead of tabs
set expandtab       " uses the correct number of spaces
set smartindent     " automatically indents based on language
set shiftround      " round indent to a multiple of shiftwidth
set autoindent      " uses the indent from the previous line
set tabstop=4       " how many spaces an actual tab shows
set softtabstop=4   " how many spaces a tab uses in insert mode
set shiftwidth=4    " how many spaces a tab uses when shifting << >>


"======================================== Vim Environment ======================================

" Change Leader from \ to ,
let mapleader=','

let g:xml_syntax_folding = 1

" FileTypes
au BufRead,BufNewFile *.aspx,*.asmx,*.ascx,*.master set filetype=aspnetcs

"au GUIEnter * simalt ~x         " maximize window on startup

" Execute commands silently
command! -nargs=1 Silent
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'

"======================================== Key Mappings =========================================

" Do commands quicker without hitting Shift
noremap ; :

"====== BUFFERS ======
map <leader>bb :buffers<CR>
map <C-h> :bprevious<CR>
map <C-l> :bnext<CR>
map <leader>bh :bprevious<CR>
map <leader>bl :bnext<CR>
map <leader>bd :bdelete<CR>
map <leader>bv :vert sb N<CR>

"====== SEARCH ======
" Clear Search Highlight
map <silent> <leader>/ :nohlsearch<CR>


"====== REPLACE ======
" Replace current selection with new
vnoremap <leader>r "sy:%s/<C-r>s//g<left><left>

" Add new lines after match
map <leader>n :s/<[^>]*>/\r&\r/g
"map <leader>n :s/<[^>]*>/\r&\r/g


"====== FILE ======
" Use utf-16 encoding
map <Bslash>e :e ++enc=utf-16le<CR>

" Replace ^M characters
map <leader>m :e ++ff=dos<CR>
map <Bslash>m :%s/\r/\r/g<CR>

map <leader>u :set fileformat=unix<CR>
map <leader>8 :set fileencoding=utf-8<CR>

" Edit in HEX
"map <leader>x :%!xxd<CR>
map <leader>x :Hexmode<CR>

" Alternative charaters not supported by current font
nmap <Leader>a :set guifont=Envy_Code_R_for_Powerline:h10<CR>
nmap <Leader>A :set guifont=Envy_Code_R_for_Powerline:h12<CR>


function! ToggleLanguage(language)
    if exists("b:language") && (a:language == b:language)
        :let b:language = "English"
    else
        :let b:language = a:language
    endif

    if b:language == "Arabic"
        :set rightleft
        :set guifont=Courier_New:h12
    else
        :set norightleft
        :set guifont=Envy_Code_R_for_Powerline:h10
    endif

    :echom "Setting " . b:language
endfunction

nmap <Bslash>a :call ToggleLanguage("Arabic")<CR>

" Generates the appropriate output based on FileType
nmap <leader>g :call Generate()<CR>

" Save File
map <C-A-s> <esc>:browse :w<CR>

" Spelling
nmap <silent> <leader>S :set spell!<CR>
nmap <silent> <leader>Z z=1<CR>

" FileTypes and Syntax Highlighting
map <leader>fc :set ft=css<CR>
map <leader>fh :set ft=html<CR>
map <leader>fx :set ft=xml<CR>
map <leader>fp :set ft=php<CR>

map <leader>sm :set syntax=mustache<CR>

" Folding
map <leader>z :set foldmethod=syntax<CR>
noremap <Space> za
noremap <S-Space> zMzv

" Vim Quick Edit
nmap <silent> <leader>v :e ~/.dotfiles/vim/.vimrc<CR>
nmap <silent> <leader>V :source ~/.dotfiles/vim/.vimrc<CR>

" Maximize Wndow
nmap <leader>` :simalt ~x<CR>

"Toggle Text Wrap
nmap <leader>w :set wrap!<CR>

" Markdown Headers
map <leader>- <0yypv$r-
map <leader>= <0yypv$r=

" Arrow keys move lines
"no <down> ddp
"no <up> ddP

" Move up and down based on display lines
nmap j gj
nmap k gk

" Makes it easier to increment and decrement
nnoremap <C-k> <C-a>
nnoremap <C-j> <C-x>

"Center line in window upon search and jumps
" nmap n nzz
" nmap N Nzz
nmap G Gzz
nmap } }zz
nmap { {zz

" Insert between quotes and parentheses
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i

" Clipboard Copy Paste
map <leader>y "*y
map <leader>yy "*yy
noremap <leader>p "*p
map <leader>GY gg"*yG''

" Append Copy and Paste into Clipboard
map <leader>Y "Yyy:let @*=@y<CR>
map <silent> <leader>P "*p:let @y=@_<CR>

" Paste without copying visual selection
vmap p "_dP

"====== Plugin Mappings ======

" Syntastic
nmap <leader>s :SyntasticCheck<CR>

" CtrlP
cmap <C-L> <C-F>
cmap <C-H> <C-B>

" TComment
nmap <leader>c <C-_><C-_>
vmap <leader>c <C-_>b

" NERDTree
map <F12> :NERDTreeToggle<CR>B<CR>
map <F11> :TlistToggle<CR>

" Tabular
vmap <leader>t :Tabularize /
nmap <leader>t :Tabularize /

" Go
" au FileType go nmap <leader>g  :!go run %<CR><CR>
" au FileType go nmap <leader>r <Plug>(go-run)
" au FileType go nmap <leader>b <Plug>(go-build)
" au FileType go nmap <leader>t <Plug>(go-test)
" au FileType go nmap <leader>o <Plug>(go-coverage)

" Output css for less files - :t(no path) :r(no extension)
"!lessc --clean-css % %:r.css<CR>
"nnoremap <leader>l :execute ':silent !' . expand('~') . '/Dropbox/Tools/Vim/.vim/bundle/less.js-windows/lessc --clean-css % %:r.css'<CR>
nnoremap <leader>l :execute "!" . substitute(expand('~'), '\', '/', '') . '/Dropbox/Tools/Vim/.vim/bundle/less.js-windows/lessc --clean-css "%" "%:r.css"'<CR>

"======================================== Experimental ========================================
set number "line numbers
set cindent "clever indenting

set ofu=syntaxcomplete#Complete
imap <C-SPACE> <C-x><C-o>


"======================================== Plugin Settings ======================================

" Syntastic
" let g:syntastic_javascript_checkers = ['jshint']

"Taglist
"let Tlist_Use_Horiz_Window = 1 "Sets window to split horizontally
"let Tlist_Use_Right_Window = 1 "Sets window to split vertically and to the right
"ActionScript
let tlist_actionscript_settings = 'actionscript;c:class;f:method;p:property;v:variable'

"NERDTree
let NERDTreeWinPos=1

"Tagbar
let g:tagbar_ctags_bin = 'C:\Ctags5.8\ctags.exe'

"vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

"Ruby on Rails
let g:rails_default_database='mysql'
let g:rails_dbext=1

"Airline
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"CtrlP
" - use hjkl for navigation
let g:ctrlp_prompt_mappings = {
    \ 'ToggleType(1)':        ['<C-l>', '<C-up>'],
    \ 'ToggleType(-1)':       ['<C-h>', '<C-down>'],
    \ 'PrtCurLeft()':         ['<left>', '<C-^>'],
    \ 'PrtCurRight()':        ['<right>'],
\ }

" Markdown Vim Mode (disable folding)
let g:vim_markdown_folding_disabled=1

"Vim JSON
let g:vim_json_syntax_conceal = 0

"======================================== Work Automation ======================================

" Generate the appropriate file
function! Generate()
    "Just manifest for now, but will add more later on FileType condition
    ":silent !node manifest & pause
    if (&ft=='less')
        :execute ":Silent " . substitute(expand('~'), '\', '/', '') . '/Dropbox/Tools/Vim/.vim/bundle/less.js-windows/lessc --clean-css "%" "%:r.css"'
    else
        :silent !node manifest
    endif
endfunction


" MACROS

" Text Elements - paste script text into xml data. Start above line and jump to text before executing
let @t='0mtD``jj0bbbvi]p`tj'

" Menu Titles - paste rows of titles or other xml tag information.
" Search for tag to replace (note line number), navigate to first row of new text, and jump to line number before executing
let @m='``0Djmt``0nwwvitp$n`t``'
"let @m='0mtD``0nwwvitpnn`tj' "Old way

" Super Char - supercase till end of word (needs to have double quotes to function)
let @s="i<sup>\eea</sup>\e"

" Perception String - fix perception connection for new version
let @p='gg:silent!/php/dllFqct"perception5/session.php'

" JSON Topic Titles - add quotes and commas for each line till end of section
let @j=''
