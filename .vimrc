execute pathogen#infect()
call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

if has('nvim')
    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    "let g:deoplete#enable_at_startup = 1
    "se mouse=a
else
    se hls!
endif
call plug#end()

nnoremap ;l :set cscopequickfix=s-,c-,d-,i-,t-,e-<CR>
nnoremap ;k :set cscopequickfix=<CR>

se incsearch 
syntax enable
se nu
set background=dark
"se cursorline
let g:solarized_termcolors=16
let g:solarized_termtrans = 1
let g:solarized_visibility="high"
colorscheme gruvbox
"let g:airline_theme='solarized'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>vg :vsplit \| YcmCompleter GoTo<CR>
nnoremap <leader>sg :split \| YcmCompleter GoTo<CR>

silent! call airline#extensions#whitespace#disable()

set laststatus=2
set splitbelow
set splitright
set noshowmode
let Tlist_Use_Right_Window = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let NERDTreeIgnore = ['\.pyc$', '\.gcno$', '\.gcda$', '\.o', '\.a', '\.obj', '\.d']

"let g:ctrlp_cmd='CtrlPMixed'
let g:ctrlp_cmd='CtrlP :pwd'
let g:ctrlp_match_window = 'min:4,max:20,results=100'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_custom_ignore = {
    \ 'dir':  'build$\|docs',
    \ 'file': '\.so$'
  \ }

"#######fzf################
nnoremap <C-j> :Files<CR>
nnoremap <C-k> :BLines<CR>

"au BufNewFile,BufRead *.c,*.h,*.cpp,*.py *.lua
"    \ set autoindent |
"    \ set smartindent |
"    \ set smartcase |
"    \ set incsearch |
"    \ set smarttab |
"    \ set expandtab |
"    \ set tabstop=2 |
"    \ set shiftwidth=2
"

set autoindent |
set smartindent |
set smartcase |
set incsearch |
set smarttab |
set expandtab |
set tabstop=4 |
set shiftwidth=4
"
"au BufNewFile,BufRead *.py
"   \ set tabstop=4 |
"    \ set softtabstop=4 |
"    \ set shiftwidth=4 |
"    \ set expandtab |
"    \ set autoindent |
"    \ set fileformat=unix

source ~/script/src/cscope_maps.vim
set wildignore+=*.so,*.swp,*.zip,*.o,*.d,*.obj,*test*,*.gcno.*gcda 
set wildignore+=.**/test/**

nmap <silent> <F2> :NERDTreeToggle <CR>
nmap <silent> <F3> :NERDTreeFind <CR>
"nmap <silent> <F4> :TlistToggle <CR>

nnoremap sn :cn<CR>
nnoremap sb :cp<CR>

command FUNC :execute 'vimgrep "^void\|^imsgw\|^U\|^S\|^trx|^bts"gj '.expand('%') | copen

autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR
"setlocal foldmethod=indent
filetype plugin indent on


"se path=./**/*
"cs add /home/abhishek/pcu/PCUM_MCL/cscope.out
"
let g:tagbar_autofocus = 1                         
nnoremap <F4> :TagbarToggle<CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

if executable('./node_modules/.bin/eslint')
    autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
endif

nnoremap < gT
nnoremap > gt
nnoremap sa :tabclose<CR>
autocmd QuickFixCmdPost *grep* cwindow

let g:asyncrun_open = 6
let g:asyncrun_bell = 1
nnoremap <F7> :call asyncrun#quickfix_toggle(6)<cr>

noremap <silent> <F9> :AsyncRun g++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
"noremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
noremap <silent> <F5> :AsyncRun ./l2remote make ut <cr>
"let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs'] 
"noremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>
"noremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" air-line
let g:airline_powerline_fonts = 1
:nnoremap GR :grep '\b<cword>\b'<CR>


if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

set complete=.,b,u,]
set completeopt=longest,menuone
set tags=./tags,tags;
nnoremap <C-u> :CtrlPTag<cr>

"let g:indentLine_char = '┆'
let g:indentLine_char = '│'

let g:clang_library_path='/usr/lib/llvm-6.0/lib/libclang.so.1'

let Tlist_WinWidth = 40
let Tlist_File_Fold_Auto_Close = 1
let tlist_cpp_settings = 'c++;n:namespace;v:variable;d:macro;t:typedef;c:class;g:enum;s:struct;u:union;f:function;m:member;p:prototype'

"set csprg=gtags-cscope

command!  FindInBuffers :execute ":cex [] | bufdo vimgrepadd /" . expand('<cword>') . "/g %" | cw
" execute a command and show its output in a split window
command! -nargs=* -complete=shellcmd Run execute "new | r! <args>"

set rtp+=~/.fzf

highlight Pmenu guibg=brown
highlight PmenuSel ctermbg=black guibg=black

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType jsx setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

set diffopt+=iwhite
if &diff
    "colorscheme industry
endif

"nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

" OmniCppComplete
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_MayCompleteDot = 1 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview
"

let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0

if has('nvim')
    nmap <unique> <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <unique> <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <unique> <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <unique> <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <unique> <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <unique> <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <unique> <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <unique> <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>
    nmap <unique> <C-Space><C-Space>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <unique> <C-Space><C-Space>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <unique> <C-Space><C-Space>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <unique> <C-Space><C-Space>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <unique> <C-Space><C-Space>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <unique> <C-Space><C-Space>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <unique> <C-Space><C-Space>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <unique> <C-Space><C-Space>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
    nmap <unique> <C-Space>] :execute "vertical ptag " . expand("<cword>")<CR>
else
    nnoremap <C-@>] :execute "vertical ptag " . expand("<cword>")<CR>
endif

nnoremap <F6> :cs kill 0<CR>:AsyncRun ./cs<CR>
nnoremap <F8> :cs add ./cscope.out<CR>
