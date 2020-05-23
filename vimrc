"-- [VIM-PLUG Package Manager] ------------------------------------------------

" :PlugInstall
call plug#begin()
Plug 'preservim/NERDTREE'
Plug 'haishanh/night-owl.vim'
Plug 'vim-airline/vim-airline'
call plug#end()


"-- [VUNDLE Package Manager] --------------------------------------------------

" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
set nocompatible
filetype off              
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'ryanoasis/vim-devicons'
Plugin 'Yggdroot/indentLine'
Plugin 'dense-analysis/ale'
Plugin 'Valloric/YouCompleteMe'
Plugin 'VundleVim/Vundle.vim'
call vundle#end()


"-- [General Settings] -------------------------------------------------------

" Line numbers on/off
set number

" Show existing tab with 4 spaces width
set tabstop=4

" When indenting with '>', use 4 spaces width
set shiftwidth=4

" On pressing tab, insert 4 spaces
set expandtab

" Set default vertical splits to the right
set splitright

" Map <Leader(\)>r to refresh NERDTree anywhere
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>

" Map 'jj' to <Esc> in insert mode
imap jj <Esc>

" [C/Cpp/py] Block comment in visual mode with Ctrl+c
autocmd FileType c vmap <S-c> :s/^/\/\//<Enter> 
autocmd FileType cpp vmap <S-c> :s/^/\/\//<Enter>
autocmd FileType python vmap <S-c> :s/^/\#<Enter>

" [C/Cpp/py] Block comment in visual mode with Ctrl+x
autocmd FileType c vmap <S-x> :s/^\/\///<Enter>
autocmd FileType cpp vmap <S-x> :s/^\/\///<Enter>
autocmd FileType python vmap <S-x> :s/^#//<Enter>

" Set search highlighting (e.g. normal '/' or visual '*')
set hlsearch

" Double escape turns off highlights of previous search
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Map Ctrl+r in visual mode to put replacement text at highhlights
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Map <F5> to preview markdown files with chromium
noremap <F5> :!chromium "%"<CR>

" Map HOME key to create a terminal in the current file dir
map <Home> :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>


"-- [NERDTREE] ----------------------------------------------------------------

"   Run NERDTree when vim starts
autocmd VimEnter * NERDTree

"   Close NERDTree when vim quits
autocmd VimLeave * NERDTreeClose

"   Close vim if the only window open is NERDTREE
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"   Set default NERDTREE width
:let g:NERDTreeWinSize=30

"   Toggle NERDTREE with hotkey [Ctrl+n]
map <C-n> :NERDTreeToggle<CR>

"   Creating tabs will generate a new NERDTree buffer
autocmd BufWinEnter * NERDTreeMirror


"-- [COLOR THEMES] ----------------------------------------------------------

"   Enable 24bit true color
if (has("termguicolors"))
      set termguicolors
endif

"   Nightowl theme
syntax enable
colorscheme night-owl


"-- [YOUCOMPLETEME] ---------------------------------------------------------

"   Enable support for C like language
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py"

"  Map YouCompleteMe FixIt to F9 key
map <F9> :YcmCompleter FixIt<CR>

"  Set a filetype whitelist for YCM
let g:ycm_filetype_whitelist = { "c":1, "cpp":1, "python":1, "javascript":1,
                               \ "html":1, "css":1,  "sh":1, "bash":1 }


"-- [ALE] ------------------------------------------------------------------

"   Enable ALE linters for certain filetypes
let g:ale_linters = { 'c':'all', 'cpp':'all', 'javascript':'all' }

"   Enable ALE parsing Makefile
let g:ale_c_parse_makefile = 1
let g:ale_cpp_parse_makefile = 1


"-- [INDENTLINE] ------------------------------------------------------------

"   Change indent character
let g:indentLine_char = '▏'


"-- [VIM-DEVICONS] ----------------------------------------------------------

"  Set encoding to UTF-8 to show glyphs
set encoding=utf8

" Set vim font to a nerd font
set guifont=Ubuntu\ Nerd\ Font\ 11

" Set font for vim-airline
let g:airline_powerline_fonts = 1

"----------------------------------------------------------------------------
