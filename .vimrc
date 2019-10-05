" use vundle plugin bundler
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required
Plugin 'JuliaEditorSupport/julia-vim'
"Plugin 'panozzaj/vim-autocorrect'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to  auto-approve removal
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line


" remap capslock to esc on vim enter, and remap
" xmodmap package
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" mein Zeug
" leader ändern
let mapleader=" "

" set tab width
set shiftwidth=2
set tabstop=2

" utf-8 + links nummern
set encoding=utf-8
set number relativenumber

" highlight suche
" * unter einem wort sucht andere vorkommen
set hlsearch
" unhighlight mit CTRL-L
nnoremap <silent> <C-l> :nohl<CR><C-l>


" codeklammern falten
" öffnen: zo, schließen: zc, toggle: za, alle öffnen zR, ...
:syn region myFold start="\#IF" end="\#ENDIF" transparent fold
:syn sync fromstart
:setlocal foldmethod=syntax
" fold color
:hi Folded ctermfg=0
:hi Folded ctermbg=7

" tabs und newline anzeigen
map <leader>l :set list!<CR>:set listchars=eol:¬,tab:▸\<CR>

" zeilen umbrechen am wortende
set tw=0 wrap linebreak

" autocompletion
set wildmode=longest,list,full

" autocorrect englisch
"autocmd filetype *.tex call AutoCorrect()

" omnicompletion ( sehen was vervollständigt wird )
filetype plugin on
set omnifunc=sytaxcomplete#Complete

" rechtschreibung
" map <leader>ü :setlocal spell! spelllang=de_de<CR>
map <leader>ü :setlocal spell! spelllang=en_gb<CR>

" splits anpassen
set splitbelow splitright

" bash posix prüfen
map <leader>s :!clear && shellcheck %<CR>

" bibo datei im split öffnen
map <leader>b :vsp<space>$BIB<CR>

" datei compilieren
map <leader>c :w! \| !compiler <c-r>%<CR><CR>

" pdf öffnen
map <leader>p :!opout <c-r>%<CR><CR>

" automatisch tex build dateien löschen, wenn texdatei geschlossen wird
autocmd VimLeave *.tex !texclear %

" syntax fixen
syntax on
autocmd BufRead,BufNewFile *.tex set filetype=tex
" autocmd BufRead,BufNewFile *.sh  set filetype=bash

" automatisch leerzeichen am ende entfernen
autocmd BufWritePre * %s/\s\+$//e

" DATEIEN SUCHEN
" fuzzy search Unterordner
set path+=**

" tab complete wie in zsh
set wildmenu

" zu Tags springen rekursiv bauen vom aktuellen VZ
command! MakeTags !ctags -R .



"""LATEX
	" Word count:
"	autocmd FileType tex map <leader>ü :w !detex \| wc -w<CR>
"	autocmd FileType tex inoremap <leader>ü <Esc>:w !detex \| wc -w<CR>
	" Code snippets
	autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
	autocmd FileType tex inoremap ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
	autocmd FileType tex inoremap ,exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
	autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
	autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
	autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
	autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
	autocmd FileType tex inoremap ,ct \textcite{}<++><Esc>T{i
	autocmd FileType tex inoremap ,cp \parencite{}<++><Esc>T{i
	autocmd FileType tex inoremap ,glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
	autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
	autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ,li <Enter>\item<Space>
	autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
	autocmd FileType tex inoremap ,ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
	autocmd FileType tex inoremap ,can \cand{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,con \const{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,v \vio{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,a \href{}{<++>}<Space><++><Esc>2T{i
	autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
	autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
	autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,bt {\blindtext}
	autocmd FileType tex inoremap ,nu $\varnothing$
	autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
	autocmd FileType tex inoremap ,rn (\ref{})<++><Esc>F}i

""".bib
	autocmd FileType bib inoremap ,a @article{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>journal<Space>=<Space>{<++>},<Enter>volume<Space>=<Space>{<++>},<Enter>pages<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
	autocmd FileType bib inoremap ,b @book{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>6kA,<Esc>i
	autocmd FileType bib inoremap ,c @incollection{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>booktitle<Space>=<Space>{<++>},<Enter>editor<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i

" vimcasts.org for more stuff
