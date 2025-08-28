"======================================== Platform Settings ====================================

set nocompatible    "more than vi, VIMproved
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set runtimepath^=~/Dropbox/Tools/Vim/.vim
set directory^=~/

if has('unix')
    set guifont=LigConsolata\ 12
    " set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
elseif has('win32') || has('win64')
" if has('win32') || has('win64')
    set guifont=Envy_Code_R_for_Powerline:h10,Droid_Sans_Mono_Slashed_for_Pow:h10,Consolas:h10

    " Maximize window on startup
    " au GUIEnter * simalt ~x
endif

set guifontwide=NSimsun:h12

"======================================== Global Settings ======================================

"CURSOR
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

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
colorscheme default

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
" set columns=120     " Not compatible with i3wm
" set lines=50        " Not compatible with i3wm
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
set nofoldenable    " all text is unfolded at start


"======================================== Vim Environment ======================================

" Change Leader from \ to ,
let mapleader=','

let g:xml_syntax_folding = 1

set foldmethod=syntax

set foldlevel=0
" set foldlevelstart=100


" FileTypes
au BufRead,BufNewFile *.aspx,*.asmx,*.ascx,*.master set filetype=aspnetcs
au BufRead,BufNewFile *.aliases set filetype=sh
au FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2

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
map <leader>s <esc>:w<CR>

" Spelling
nmap <silent> <leader>S :set spell!<CR>
nmap <silent> <leader>Z z=1<CR>

" FileTypes and Syntax Highlighting
map <leader>fc :set ft=css<CR>
map <leader>fh :set ft=html<CR>
map <leader>fj :set ft=javascript<CR>
map <leader>fp :set ft=php<CR>
map <leader>fx :set ft=xml<CR>

" map <leader>sm :set syntax=mustache<CR>

" Folding
map <leader>z :set foldmethod=indent<CR>
noremap <Space> za
noremap <S-Space> zMzv
nmap t zfat<CR>

" Vim Quick Edit
nmap <silent> <leader>v :e ~/.dotfiles/vim/.vimrc<CR>
nmap <silent> <leader>V :source ~/.dotfiles/vim/.vimrc<CR>

" Maximize Wndow
nmap <leader>` <ESC>:simalt ~x<CR><C-W>=
" Restore Wndow
nmap <leader>~ <ESC>:simalt ~r<CR><C-W>=

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
nnoremap <A-k> <C-a>
nnoremap <A-j> <C-x>

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
map <leader>d "*d
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
" nmap <leader>s :SyntasticCheck<CR>

" CtrlP
cmap <C-L> <C-F>
cmap <C-H> <C-B>

" TComment
" nmap <C-_> <C-_><C-_>
" vmap <C-_> <C-_>b

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
nnoremap <leader>l :execute "!" . substitute(expand('~'), '\\', '/', 'g') . '/.vim/bundle/less.js-windows/lessc --clean-css "%" "%:r.css"'<CR>

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
" let NERDTreeWinPos=1

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
        :execute ":Silent " . substitute(expand('~'), '\\', '/', 'g') . '/.vim/bundle/less.js-windows/lessc --clean-css "%" "%:r.css"'
    elseif (&ft=='scss')
        :execute ':Silent node-sass --output-style compact "%" "%:r.css"'
    else
        :silent !node manifest
    endif
endfunction

function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgvl

" MACROS

" Paste external clipboard between tags, and trim trailing spaces.

let @t=':let @*=substitute(@*,''\n$'','''',''g'')vit"*Pvit:s/\%V\s\+</</e:nohls'

" Trim trailing spaces between quotes
let @s='vi":s/\%V\s\+"/"/e:nohls'

" Paste yanked text between quotes
let @v='vi"p'
" Paste external clipboard between quotes, and trim trailing spaces.
let @p='vi""*P@s'
" Remove \n chars from multi-line clip paste. Manipulate betweeen | chars first, then paste between quotes.
let @w='o|"*PI|v/|:%jV:s/|//gDbb@v@sddbbyi"'

" OLD: Paste external clipboard between quotes, and trim trailing spaces.
" let @p='vi""*Pvi":s/\%V\s\+"/"/e\:nohls\'


" Paste external clipboard containing numbers between quotes, and trim everything except digits. \%V matches only inside visual selection
let @n='vi""*Pvi":s/\%V[^0-9]//g:nohls'

" Text Elements - paste script text into xml data. Start above line and jump to text before executing
let @x='0mtD``jj0bbbvi]p`tj'

" Menu Titles - paste rows of titles or other xml tag information.
" Search for tag to replace (note line number), navigate to first row of new text, and jump to line number before executing
let @m='``0Djmt``0nwwvitp$n`t``'
"let @m='0mtD``0nwwvitpnn`tj' "Old way

" Super Char - supercase till end of word (needs to have double quotes to function)
let @u='i<sup>\eea</sup>\e'

" Perception String - fix perception connection for new version
let @k='gg:silent!/php/Fqct"perception5/session.php'

" JSON Topic Titles - pastes list of titles from clipboard, adds quotes/commas to lines of section. Removes whitespace. (Place cursor inside topic block)
let @j='vi]x"*Pvi]:g/^$/dvi]I"vi]:s/\s*$/\",/f,xj=%:nohls'

" JSON Image and Audio entries for Fast Track - pastes list of absolute paths from clipboard, removes all except filename, adds quotes/commas to lines of section. (Place cursor inside images or audio block)
let @f='vi]x"*Pvi]T\xvi]:s/\..*//vi]I"vi]:s/$/\",/f,xj0=%:nohls'
