" pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

colorscheme xoria256

set fileencoding=utf-8

set undolevels=100

syntax on

set smarttab
set smartindent
set autoindent
set backspace=indent,eol,start

set magic
set number
set cursorline
set ruler

" switch between buffers without saving
set hidden

set path=.,/usr/include,/usr/local/include

set visualbell
set hlsearch

set nowrap linebreak nolist

set nojoinspaces " only one space when joinning
set showmatch matchtime=3 " matching bracket
set matchpairs+=<:>
set showfulltag virtualedit=block
set splitbelow splitright
set incsearch noignorecase
set shortmess+=I showcmd

" backups & history
set nobackup
set nowritebackup
set noswapfile
set history=1000

" when changing (c command) put $
" on word boundary and keep it visible
set cpoptions+=$

" wild menu helping when tabing through matches
set wildmenu

" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8

" setting indent and tab expanding depending on file type
filetype indent on
filetype plugin on

" no automatic text wrapping for most formats
set fo-=t

" global textwidth
set textwidth=78

" turn off mark multiple and lean after it
vmap <silent> <C-m> :call MarkMultipleClean()<CR>

" spell checking
nmap <silent> <leader>s :set spell!<CR>

" highlighting search matches
nmap <silent> <leader>h :set hlsearch!<CR>

" show invisibles
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" Unimpaired text bubbling
nmap <C-k> [e
nmap <C-j> ]e
vmap <C-k> [egv
vmap <C-j> ]egv

" Gundo - visualizing redo/undo changes
nmap <leader>g :GundoToggle<CR>

" binding for editing vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>

" change to directory of opened file
nmap <silent> <leader>cd :lcd %:h<CR>

" toggle color column
function! ColorColumnToggle()
  if (&colorcolumn == '+1')
    set colorcolumn=
  else
    set colorcolumn=+1
  endif
endfunc
nmap <silent> <leader>cc :call ColorColumnToggle()<CR>

" change behaviour of c-n c-p to more common-sense in command line
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" view yanking/pasting (number specified by count, defaults to 1)
" use in normal mode:
" zy <some folding> 5zy zp
noremap <silent> zy :<C-u>exe ":mkview ".v:count1<CR>
noremap <silent> zp :<C-u>exe ":loadview ".v:count1<CR>

" toggle relative/normal line numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
nmap <leader>n :call NumberToggle()<CR>

" switch paste/nopaste mode
nmap <leader>p :set paste!<CR>:set paste?<CR>

" writing to protected file using :Sw
function! SudoWrite()
  w !sudo dd of=%
  e!
endfunction
command! -nargs=0 Sw call SudoWrite()

" %% will expand to current dir in command mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:p:h').'/' : '%%'

" File Manager options
let g:netrw_liststyle=3 " Use tree-mode as default view
let g:netrw_browse_split=4 " Open file in previous buffer
let g:netrw_preview=1 " preview window shown in a vertically split

if has("autocmd")
  " jump to last know position in the file
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

  au FileType c            setl cindent   tw=79
  au FileType cpp          setl cindent   tw=79
  au FileType java         setl ai ts=4 sw=4 sts=4   expandtab cindent
  au FileType perl         setl ai ts=4 sw=4 sts=4   expandtab cindent
  au FileType python       setl ai ts=4 sw=4 sts=4   expandtab
  au FileType ruby         setl ai ts=2 sw=2 sts=2   expandtab
  au FileType awk          setl ai ts=4 sw=4 sts=4 noexpandtab
  au FileType html         setl ai ts=4 sw=4 sts=4   expandtab
  au FileType sh,zsh       setl ai ts=4 sw=4 sts=4 noexpandtab
  au FileType vim          setl ai ts=2 sw=2 sts=2   expandtab
  au FileType xml          setl ai ts=4 sw=4 sts=4 noexpandtab
  au FileType css,scss     setl ai ts=4 sw=4 sts=4   expandtab
  au FileType make         setl ai ts=4 sw=4 sts=4 noexpandtab
  au FileType eruby        setl ai ts=4 sw=4 sts=4   expandtab
  au FileType javascript   setl ai ts=4 sw=4 sts=4   expandtab
  au FileType coffee       setl ai ts=2 sw=2 sts=2   expandtab
  au FileType tex,plaintex setl ai ts=2 sw=2 sts=2 noexpandtab fo+=t

  au FileType markdown     setl tw=77 fo+=t
  au FileType gitcommit    setl tw=72 fo+=t
  
  " autoreload vimrc
  au BufWritePost .vimrc source $MYVIMRC
  au BufWritePost _vimrc source $MYVIMRC

  augroup filetypedetect
    au BufRead,BufNewFile *mutt-* setl filetype=mail tw=72 fo+=t
  augroup END

  augroup gzip
    " Remove all gzip autocommands
    au!

    " Enable editing of gzipped files
    au BufReadPre,FileReadPre     *.gz setl bin
    au BufReadPost,FileReadPost   *.gz let ch_save = &ch|setl ch=2
    au BufReadPost,FileReadPost   *.gz '[,']!gunzip
    au BufReadPost,FileReadPost   *.gz setl nobin
    au BufReadPost,FileReadPost   *.gz let &ch = ch_save|unlet ch_save
    au BufReadPost,FileReadPost   *.gz execute ":doautocmd BufReadPost " . expand("%:r")
    au BufWritePost,FileWritePost *.gz !mv <afile> <afile>:r
    au BufWritePost,FileWritePost *.gz !gzip <afile>:r
    au FileAppendPre              *.gz !gunzip <afile>
    au FileAppendPre              *.gz !mv <afile>:r <afile>
    au FileAppendPost             *.gz !mv <afile> <afile>:r
    au FileAppendPost             *.gz !gzip <afile>:r
  augroup END
endif

" minimizing GUI
if has('gui_running')
  set guioptions-=T  " remove toolbar
  set guioptions-=m  " remove menubar
  set guioptions-=r  " remove right-hand scroll bar
  set guioptions-=L  " remove right-hand scroll bar
  set guioptions-=e  " text tabs
  set gfn=Droid\ Sans\ Mono\ Dotted\ 8
endif


" eclim java
nmap <leader>ji :JavaImport<CR>
nmap <leader>jI :JavaImportMissing<CR>
nmap <leader>jr :Java<CR>
nmap <leader>jd :JavaDocSearch<CR>
nmap <leader>eo :ProjectOpen<CR>
