" Scroll only one line for mouse wheel events to get smooth scrolling on touch screens
map <ScrollWheelUp> <C-Y>
imap <ScrollWheelUp> <C-X><C-Y>
map <ScrollWheelDown> <C-E>
imap <ScrollWheelDown> <C-X><C-E>

" As of version 8, vim enables the mouse by default - but only if no ~/.vimrc
" is found. Enable that unconditionally for Termux as it's useful with touch:
set mouse=a

" sensible.vim - Defaults everyone can agree on
" Maintainer:   Tim Pope <http://tpo.pe/>
" Version:      1.1

set nocompatible
let g:loaded_sensible = 1

filetype plugin indent on
syntax enable

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

set ttimeout
set ttimeoutlen=100

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set laststatus=2
set ruler
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

set autoread

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>


"my own changes don't edit above or you'll be. doomed

"spell check
map <F6> :setlocal spell! spelllang=en_uk<CR>
map <F5> :setlocal spell! spelllang=nl<CR>

"file finding
set path+=**

"numbers on the side
set number
set relativenumber
set so=10

filetype plugin on
set nocompatible
syntax on

"navigation with guides
inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Space> <Esc>/<++><Enter>"_c4l
map <Space><Space> <Esc>/<++><Enter>"_c4l
inoremap ;gui <++>

"""LaTeX
let g:tex_flavor = "latex"

"template
autocmd FileType tex inoremap ;te \documentclass{article}<enter>\usepackage{graphicx}<enter><enter>\title{<++>}<enter>\author{Yunus Kaya}<enter>\date{<++>}<enter><enter>\begin{document}<enter>\maketitle<enter><++><enter><enter>\end{document}

"compile 
autocmd FileType tex inoremap ;cm <esc>:w<enter>:!pdflatex %<enter>

"section
autocmd FileType tex inoremap ;se \section{<++>}

autocmd FileType tex inoremap ;sse \subsection{<++>}

autocmd FileType tex inoremap ;ssse \subsubsection{<++>}

"images
autocmd FileType tex inoremap ;ig \includegraphics[<++>]{<++>}

autocmd FileType tex inoremap ;fig \begin{figure}[h]<enter>\icludegraphics[<++>]{<++>}<enter>\caption{<++>}<enter>\endfigure

"labeling and referencing
autocmd FileType tex inoremap ;la \label{<++>}

autocmd FileType tex inoremap ;re \ref{<++>}

"tables
autocmd FileType tex inoremap ;ta \begin{tabular}{<++>}<enter><enter>\caption{<++>}<enter>\end{tabular}

autocmd FileType tex inoremap ;hl \hline

"centering
autocmd FileType tex inoremap ;ce \begin{center}<enter><++><enter>\end{center}

"caption
autocmd FileType tex inoremap ;ca \caption{<++>}

"begin & end
autocmd FileType tex inoremap ;beg \begin{<++>}

autocmd FileType tex inoremap ;en \end{<++>}

"item
autocmd FileType tex inoremap ;it \item{<++>
"beamer
autocmd Filetype tex inoremap ;bte \documentclass{beamer}<enter>\usepackage{graphicx}<enter>\usetheme{beavor}<enter><enter>\title{<++>}<enter>\author{Yunus Kaya}<enter>\date{<++>}<enter><enter>\begin{document}<enter>\maketitle<enter><++><enter><enter>\end{document}

autocmd FileType tex inoremap ;fr \begin{frame}<enter>\frametitle{<++>}<enter><enter>\end{frame}

autocmd FileType tex inoremap ;ps \pause
