" Pre-plugin configuration

let g:EasyMotion_leader_key = '<SPACE>'

let g:no_rust_conceal="yes"
let g:tex_conceal= ''

let g:local_vimrc = {'names':['.local.vim'],'hash_fun':'LVRHashOfFile'}

let g:indentLine_char = '¦'

let g:gruvbox_color_column='faded_red'

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib64/clang'

" Vundle

set runtimepath+=~/.config/nvim/plugs/vim-plug/
runtime plug.vim

call plug#begin("~/.config/nvim/plugs")

" let plug manage itself
Plug 'junegunn/vim-plug'

Plug 'john2x/flatui.vim'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-bundler'

Plug 'vim-ruby/vim-ruby'
Plug 'derekwyatt/vim-scala'
Plug 'kchmck/vim-coffee-script'
Plug 'nvie/vim-flake8'


Plug 'adinapoli/vim-markmultiple'
Plug 'godlygeek/tabular'

Plug 'majutsushi/tagbar'
Plug 'vim-scripts/matchit.zip'
Plug 'chreekat/vim-paren-crosshairs'
Plug 'Lokaltog/vim-easymotion'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-underscore'

Plug 'MarcWeber/vim-addon-local-vimrc'

Plug 'Yggdroot/indentLine'
Plug 'ivyl/vim-bling'

Plug 'morhetz/gruvbox'

Plug 'simnalamburt/vim-mundo'

" deoplete
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-clang'

call plug#end()
