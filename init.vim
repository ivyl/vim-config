runtime plugins.vim

set background=dark
colorscheme solarized

syntax on

filetype indent on
filetype plugin on


set listchars=tab:▸\ ,eol:¬

set number relativenumber
set cursorline
set ruler
set scrolloff=8
set shortmess+=I
set showcmd
set visualbell
set showfulltag
set tags^=./.git/tags;
set splitbelow splitright

set lazyredraw

set virtualedit=block

" when changing (c command) put $ on word boundary and keep it visible
set cpoptions+=$

set hidden " switch between buffers without saving

set magic " easier regexps

" search incrementally, with highlighting and preview
set hlsearch
set incsearch
set ignorecase smartcase

set showmatch matchtime=3 " matching bracket
set matchpairs+=<:>

set smartindent

set formatoptions-=t " no automatic text wrapping
set textwidth=80
set nojoinspaces " only one space when joining
set nowrap linebreak

" preview :s
set inccommand=nosplit

" easier tabbing through alternative in command mode
set wildignore+=*.pyc
set wildignore+=*.o

" do not write swap files, what is lot is lost
set nobackup nowritebackup noswapfile

runtime mappings.vim
runtime filetypes.vim

if has("autocmd")
  " enter will work in command edit mode as intended, since by default it's
  " mapped to :nohl
  au CmdwinEnter * noremap <buffer><CR> <CR>

  " resize splits to equal size when resizing window
  au VimResized * :wincmd =

  " jump to last know position in the file
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

  " set relativenumber by default everywhere
  au BufRead * set relativenumber
  au BufRead * set concealcursor=c

  " never conceal
  au WinEnter * set conceallevel=0

  " tailing white space highlight
  au WinEnter * match ColorColumn /\M\s\+$/
  match ColorColumn /\M\s\+$/
endif
