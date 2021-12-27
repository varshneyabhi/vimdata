call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'vim-scripts/indentpython.vim'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'fisadev/vim-isort'
Plug 'frazrepo/vim-rainbow'
Plug 'cespare/vim-toml'
Plug 'ekalinin/Dockerfile.vim'
Plug 'pearofducks/ansible-vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"colorscheme nord
colorscheme onedark
let g:python3_host_prog = '/usr/bin/python3'
se incsearch
let python_highlight_all=1
syntax enable
se nu
set background=dark
set laststatus=2
set splitbelow
set splitright
set noshowmode
set autoindent
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
set smartindent
set smartcase
set incsearch
set smarttab

"autocmd BufWritePre *.py execute ':Isort'
"autocmd BufWritePre *.py execute ':Black'
autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 expandtab

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
set noshowmode

filetype plugin on
set omnifunc=syntaxcomplete#Complete
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

silent! nmap <F2> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>

let g:rainbow_active = 1
nnoremap < gT
nnoremap > gt

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

:nnoremap GR :grep '\b<cword>\b'<CR>
:nnoremap <leader>fz :Files<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

let g:syntastic_yaml_checkers = ['yamllint']
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

let g:jedi#show_call_signatures = "2"
