"-- [VIM-PLUG Package Manager] ------------------------------------------------
" Usage
" :PlugInstall      - installs plugins
" :PlugStatus       - check status of plugins
" :PlugUpdate       - update plugins
call plug#begin()
Plug 'preservim/NERDTREE'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'haishanh/night-owl.vim'
Plug 'vim-airline/vim-airline'
call plug#end() 

"-- [VUNDLE Package Manager] --------------------------------------------------
" Usage
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" :PluginList       - lists configured plugins
" :PluginUpdate     - update plugins;
set nocompatible
filetype off              
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'alvan/vim-closetag'
Plugin 'ryanoasis/vim-devicons'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Yggdroot/indentLine'
Plugin 'dense-analysis/ale'
Plugin 'Valloric/YouCompleteMe'
Plugin 'VundleVim/Vundle.vim'
call vundle#end()

"-- [General Settings] -------------------------------------------------------

" Line numbers on/off
set number

" Insert 4 spaces on pressing tab
set expandtab

" Show existing tab with 4 spaces width
set tabstop=4

" Move cursor 4 spaces when typing tab
set softtabstop=4

" When indenting with '>', use 4 spaces width
set shiftwidth=4

" Set default vertical splits to the right
set splitright

" Map 'jj' to <Esc> in insert mode
imap jj <Esc>

" Set search highlighting (e.g. normal '/' or visual '*')
set hlsearch

" Allow using the mouse (avaialble with xterm)
set mouse=a

" Double escape turns off highlights of previous search
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Map Ctrl+r in visual mode to put replacement text at highlights
vnoremap <C-r> "hy:%s///g<left><left>

" Map <F5> to preview markdown files with chromium markdown preview
noremap <F5> :!chromium "%"<CR>

" Set print options to black and white
set printoptions+=syntax:n

" Map home key to create a black/white .pdf hardcopy
map <Home> :hardcopy > code_copy.pdf<CR>

" Start vim with a bottom terminal
set termwinsize=10x100
set splitbelow
autocmd VimEnter * terminal

"-- [NERDTREE] ----------------------------------------------------------------

" Run NERDTree when vim starts
autocmd VimEnter * NERDTree

" Close NERDTree when vim quits
autocmd VimLeave * NERDTreeClose

" Map <Leader>r to refresh NERDTree anywhere
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>

" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" Close vim if the only window open is NERDTREE
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Set default NERDTREE width
let g:NERDTreeWinSize=25

" Toggle NERDTREE with hotkey [Ctrl+n]
map <C-n> :NERDTreeToggle<CR>

" Creating tabs will generate a new NERDTree buffer
autocmd BufWinEnter * NERDTreeMirror

"-- [COLOR THEMES] ----------------------------------------------------------

" Enable 24bit true color
if (has("termguicolors"))
    set termguicolors
endif

syntax enable
" Nightfly Theme
"colorscheme nightfly
"let g:indentLine_setColors = 0

" Night owl Theme
colorscheme night-owl
"-- [YOUCOMPLETEME] ---------------------------------------------------------

" Enable support for C like language
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py"

" Map YouCompleteMe FixIt to F9 key
map <F9> :YcmCompleter FixIt<CR>

" Set a filetype whitelist for YCM
let g:ycm_filetype_whitelist = { "c":1, "cpp":1, "python":1, "javascript":1, 
                                \"html":1, "css":1,  "sh":1, "bash":1, 
                                \"markdown":1 }

"-- [ALE] ------------------------------------------------------------------

" Enable ALE linters for certain filetypes
let g:ale_linters = { 'c':'all', 'cpp':'all', 'python':'all', 'javascript':'all',
                     \'html':'all', 'css':'all', 'sh':'all', 'awk':'all',
                     \'markdown':'all' }

" Enable ALE parsing Makefile
let g:ale_c_parse_makefile = 1
let g:ale_cpp_parse_makefile = 1

"-- [INDENTLINE] ------------------------------------------------------------

" Change indent character
let g:indentLine_char = '▏'

"-- [VIM-DEVICONS] ----------------------------------------------------------

" Set encoding to UTF-8 to show glyphs
set encoding=utf8

" Set vim font to a nerd font
set guifont=Ubuntu\ Nerd\ Font\ 11

" Set font for vim-airline
let g:airline_powerline_fonts = 1

"-- [vim-cpp-enhanced-highlight] --------------------------------------------

" Highlight class scope
let g:cpp_class_scope_highlight = 1

" Highlight member variables
let g:cpp_member_variable_highlight = 1

" Highlight class names in declarations
let g:cpp_class_decl_highlight = 1

" Highlight POSIX functions
let g:cpp_posix_standard = 1

" Highlight template functions
let g:cpp_experimental_template_highlight = 1

"-- [vim-closetag] ----------------------------------------------------------

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

"----------------------------------------------------------------------------

