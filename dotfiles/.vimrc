" CONFIGURATION
syntax on
set history=700
set number
set background=dark
set t_Co=256
colorscheme lucius

" Highlight the current line
set cursorline

" A buffer can be hidden
set hidden

" Use Unix as the standard file type
set ffs=unix
set encoding=utf8

" Live reload file when edited from outside
set autoread

" Fix backspace key
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" Activate the mouse
set mouse=a

" Turn off backup and swap
set nobackup
set nowb
set noswapfile

try
    set undodir=~/.vim/undo
    set undofile
catch
endtry

" Set red line
set cc=80,100

" Use spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

autocmd FileType html,css,js,ruby,yaml :setlocal sw=2 ts=2

set ai " Auto indent
set si " Smart indent
set wrap " Wrap lines

" Linebreak on 500 characters
set lbr
set tw=500

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Delete trailing white space on save
func! DeleteTrailingWS()
    if exists('b:noDeleteTraillingWS')
        return
    endif
    %s/\s\+$//ge
endfunc
autocmd BufWritePre * :call DeleteTrailingWS()

augroup mail_netiquette
    autocmd!
    autocmd FileType mail let b:noDeleteTraillingWS=1
    autocmd FileType mail setlocal cc=72 tw=70 list
augroup END

" Specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
" Remember info about open buffers on close
set viminfo^=%

" Always show the status line
set laststatus=2

" Change invisible character when :set list
set listchars=eol:¬

" Add highlighting for function definition in C++
function! EnhanceCppSyntax()
  syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
  hi def link cppFuncDef Special
endfunction
autocmd Syntax cpp call EnhanceCppSyntax()

" =======================================
" Mapping
" =======================================

" Map <space> to search
nmap <space> /

" Switch buffer
nmap <S-Tab> :bnext<cr>

" Opens a new tab with the current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Indent/Unindent in visual mode
vmap <Tab> >
vmap <S-Tab> <
