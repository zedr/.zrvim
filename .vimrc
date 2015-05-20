""" Drop legacy support
set nocompatible
set ttyfast

""" No Swap File
set noswapfile

"" Backspace
set backspace=2

""" Set the Leader
let mapleader=","

""" History
set history=1000

""" Encoding
set encoding=utf-8
set showmode
set showcmd

map <Leader>gd ?^{<cr>kf:ll

""" Try recognizing dos, unix, and mac line endings.
set ffs=unix,dos,mac

""" Filetypes
filetype plugin on
filetype plugin indent on

""" Syntax highlighting
syntax on
filetype on
au BufNewFile,BufRead *.asm set filetype=asmone
au BufNewFile,BufRead *.s set filetype=asmone
au BufNewFile,BufRead *.vcl set filetype=vcl
au BufRead,BufNewFile *.kt  set filetype=kotlin
au BufRead,BufNewFile *.jet set filetype=kotlin
au BufRead,BufNewFile *.sls set filetype=yaml
au BufRead,BufNewFile *.rs set filetype=rust
au BufRead,BufNewFile *.toml set filetype=toml
au BufRead,BufNewFile *.html set filetype=html
au BufRead,BufNewFile *.js set filetype=javascript
au BufRead,BufNewFile *.md set filetype=mkd
au Syntax kotlin source ~/.vim/syntax/kotlin.vim

""" Line numbers and ruler
set number
set ruler                  

""" Eyecandy
set t_Co=256
colorscheme zenburn
set background=dark

""" Incremental search
set incsearch
set ignorecase
set smartcase
set hlsearch

""" Avoid displaying "Press Enter..."
set shortmess=aT

""" Set char to disable highlighting
nmap \q :nohlsearch<CR>

""" Code folding
" au FileType javascript call JavaScriptFold()

""" Max line length
"set textwidth=79

""" Tabs and spaces
set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent

""" Conserve sanity
cmap W w
cmap Q q

" Vertical buffers
nnoremap <leader>v <C-w>v<C-w>l 
nnoremap <leader>o <C-w>n<C-w>l 
nnoremap <leader>w <C-w>c 
nnoremap <leader>, <C-w>w

" Reselect visual block after in/dedent so we can in/dedent more
vnoremap < <gv
vnoremap > >gv

""" Easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-Up> <c-w>k
nnoremap <c-Down> <c-w>j
nnoremap <c-Left> <c-w>h
nnoremap <c-Right> <c-w>l

""" Unite support
nnoremap <leader>p :Unite file_rec/async<cr>
nnoremap <space>/ :Unite grep:.<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>

""" Disable Help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

""" Set backup directories
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

""" Python
let g:pep8_map='<leader>8'

""" Toggle colored right border after 79 chars
set colorcolumn=79
let s:color_column_old = 0

""" Colored column
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

set tags+=tags,~/.vim/tags

""" Esformatter
" Will run esformatter after pressing <leader> followed by the 'e' and 's'
" keys
nnoremap <silent> <leader>es :Esformatter<CR>
vnoremap <silent> <leader>es :EsformatterVisual<CR>

" Only enable Emmet for HTML/CSS
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")


" Switch between absolute and relative line numbers
function! NumberToggle()
    if &relativenumber
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

nnoremap <C-l> :call NumberToggle()<cr>

" Paste/No-paste
function! PasteToggle()
    if &paste
        set nopaste
    else
        set paste
    endif
endfunc

nnoremap <C-p> :call PasteToggle()<cr>

"" Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

""" Save all and quit
nnoremap <leader>q :qa<cr>
nnoremap <leader>Q :wqa!<cr>
