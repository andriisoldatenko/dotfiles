packadd minpac
call minpac#init()

call minpac#add('tpope/vim-unimpaired')
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('mileszs/ack.vim')
call minpac#add('lifepillar/vim-solarized8')
call minpac#add('elzr/vim-json')
call minpac#add('fatih/vim-go')
call minpac#add('Yggdroot/indentLine')
call minpac#add('inkarkat/vim-ReplaceWithRegister')
call minpac#add('christoomey/vim-sort-motion')
call minpac#add('bkad/CamelCaseMotion')
call minpac#add('vim-python/python-syntax')
call minpac#add('terryma/vim-expand-region')
call minpac#add('SirVer/ultisnips')
call minpac#add('rust-lang/rust.vim')

call minpac#add('tpope/vim-abolish')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-dispatch')
call minpac#add('tpope/vim-eunuch')
call minpac#add('tpope/vim-fugitive')
call minpac#add('junegunn/gv.vim')

call minpac#add('tpope/vim-jdaddy')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-rhubarb')
call minpac#add('tpope/vim-scriptease')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-vinegar')
call minpac#add('tpope/vim-speeddating')

call minpac#add('airblade/vim-gitgutter')
call minpac#add('ruanyl/vim-gh-line')

call minpac#add('junegunn/vim-peekaboo')
call minpac#add('jeffkreeftmeijer/vim-numbertoggle')
call minpac#add('dense-analysis/ale')
call minpac#add('b4b4r07/vim-sqlfmt')
call minpac#add('preservim/nerdtree')
call minpac#add('Xuyuanp/nerdtree-git-plugin')
call minpac#add('ryanoasis/vim-devicons')
call minpac#add('machakann/vim-highlightedyank')
call minpac#add('vim-scripts/argtextobj.vim')
call minpac#add('michaeljsmith/vim-indent-object')
call minpac#add('kana/vim-textobj-user')
call minpac#add('beloglazov/vim-textobj-quotes')

call minpac#add('honza/vim-snippets')
call minpac#add('mbbill/undotree')
call minpac#add('AndrewRadev/deleft.vim')
call minpac#add('AndrewRadev/whitespaste.vim')
call minpac#add('tmhedberg/SimpylFold')
call minpac#add('shime/vim-livedown')
call minpac#add('towolf/vim-helm')
call minpac#add('AndrewRadev/sideways.vim')
call minpac#add('AndrewRadev/splitjoin.vim')
call minpac#add('lervag/file-line')
call minpac#add('sickill/vim-pasta')
call minpac#add('tell-k/vim-autoflake')
call minpac#add('simeji/winresizer')
call minpac#add('szw/vim-maximizer')

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""
set nocompatible                " Enables us Vim specific features
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection

set ttyfast                     " Indicate fast terminal conn for faster redraw

if !has('nvim')
  set ttymouse=xterm2 " Indicate terminal type for mouse codes
  set ttyscroll=3     " Indicate terminal type for mouse codes
endif

if exists('&inccommand')
  set inccommand=split
endif

set laststatus=2                " Show status line always
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set autoindent                  " Enabile Autoindent
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set mouse=a
set hlsearch                    " Highlight found searches
set noerrorbells                " No beeps
set number                      " Show line numbers
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
set hidden                      " Buffer should still exist if window is closed
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set pumheight=10                " Completion window max size
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
" set cursorline                  " Highlight cursor
set lazyredraw                  " Wait to redraw
set history=1000
set scrolloff=5

" only macOS
set dictionary+=/usr/share/dict/words
set thesaurus+=~/.vim/thesaurus/english.txt

" Spell checking: on for prose only, custom words saved via zg
set spelllang=en
set spellfile=~/.vim/spell/en.utf-8.add
autocmd FileType markdown,text,gitcommit setlocal spell
autocmd FileType markdown,text,gitcommit setlocal complete+=k

" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
set clipboard^=unnamedplus

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo//
endif

" Colorscheme
" Enable 24-bit true color in the terminal
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Set dark background and apply Solarized
syntax enable
set background=dark
colorscheme solarized8

autocmd FileType markdown set background=light
let g:solarized_statusline = "flat"

" Markdown colorscheme
" ["darkblue", "morning", "shine", "evening"]
" autocmd FileType markdown morning

""""""""""""""""""""""""""
"""""""" STATUSLINE """"""
""""""""""""""""""""""""""

let s:modes = {
      \ 'n': 'NORMAL', 
      \ 'i': 'INSERT', 
      \ 'R': 'REPLACE', 
      \ 'v': 'VISUAL', 
      \ 'V': 'V-LINE', 
      \ "\<C-v>": 'V-BLOCK',
      \ 'c': 'COMMAND',
      \ 's': 'SELECT', 
      \ 'S': 'S-LINE', 
      \ "\<C-s>": 'S-BLOCK', 
      \ 't': 'TERMINAL'
      \}

let s:prev_mode = ""
function! StatusLineMode()
  let cur_mode = get(s:modes, mode(), '')

  " do not update higlight if the mode is the same
  if cur_mode == s:prev_mode
    return cur_mode
  endif

  if cur_mode == "NORMAL"
    exe 'hi! StatusLine ctermfg=236'
    exe 'hi! myModeColor cterm=bold ctermbg=148 ctermfg=22'
  elseif cur_mode == "INSERT"
    exe 'hi! myModeColor cterm=bold ctermbg=23 ctermfg=231'
  elseif cur_mode == "VISUAL" || cur_mode == "V-LINE" || cur_mode == "V_BLOCK"
    exe 'hi! StatusLine ctermfg=236'
    exe 'hi! myModeColor cterm=bold ctermbg=208 ctermfg=88'
  endif

  let s:prev_mode = cur_mode
  return cur_mode
endfunction

function! StatusLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! StatusLinePercent()
  return (100 * line('.') / line('$')) . '%'
endfunction

function! StatusLineLeftInfo()
 let branch = FugitiveHead()
 let filename = '' != expand('%:t') ? expand('%:t') : '[No Name]'
 if branch !=# ''
   return printf("%s | %s", branch, filename)
 endif
 return filename
endfunction

exe 'hi! myInfoColor ctermbg=240 ctermfg=252'

" start building our statusline
set statusline=

" mode with custom colors
set statusline+=%#myModeColor#
set statusline+=%{StatusLineMode()}               
set statusline+=%*

" left information bar (after mode)
set statusline+=%#myInfoColor#
set statusline+=\ %{StatusLineLeftInfo()}
set statusline+=\ %*

" go command status (requires vim-go)
set statusline+=%#myInfoColor#
set statusline+=%{exists('*go#statusline#Show')?go#statusline#Show():''}
set statusline+=%*

" right section seperator
set statusline+=%=

" filetype, percentage, line number and column number
set statusline+=%#myInfoColor#
set statusline+=\ %{StatusLineFiletype()}\ %{StatusLinePercent()}\ %l:%v

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=\ %{GitStatus()}

set statusline+=\ %*

" Clever Tab
function! s:CleverTab() abort
  if pumvisible()
    return "\<C-p>"                      " menu open: next match
  endif
  let col = col('.') - 1
  if !col || getline('.')[col - 1] =~ '\s'
    return "\<Tab>"                      " line start / after space: real tab
  endif
  if getline('.')[:col - 1] =~ '/\f*$'
    return "\<C-x>\<C-f>"                " looks like a path: file completion
  endif
  return "\<C-p>"                        " otherwise: keyword completion
endfunction



"===================== MAPPINGS ======================
" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
let mapleader = ","

" edit / reload vimrc
nnoremap <leader>ev :edit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>:echo "vimrc reloaded"<CR>

" Ack
" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>
" Search word under cursor (whole word, like *)
nnoremap <Leader>* :Ack! -w <C-r><C-w><CR>
" Expand :Ack -> :Ack! (don't jump to first result); only on the : command line
cnoreabbrev <expr> Ack (getcmdtype() ==# ':' && getcmdline() ==# 'Ack') ? 'Ack!' : 'Ack'

" ==================== Search ====================
" Keep matches centered and unfold them
nnoremap n  nzzzv
nnoremap N  Nzzzv
nnoremap *  *zzzv
nnoremap #  #zzzv
nnoremap g* g*zzzv
nnoremap g# g#zzzv
nnoremap <silent> <esc><esc> :silent! nohlsearch<CR>

" Substitute the word under the cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" Move by display lines; J/K jump 5 lines
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

" Window navigation (in addition to <C-h/j/k/l>)
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l

" ==================== Editing ====================
" Move lines up/down (normal-mode <C-j>/<C-k> are window navigation)
inoremap <C-j> <Esc>:m .+1<CR>==gi
" inoremap <C-k> <Esc>:m .-2<CR>==gi
xnoremap <C-j> :m '>+1<CR>gv=gv
" xnoremap <C-k> :m '<-2<CR>gv=gv

" Undo break points while typing
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

" Yank to end of line, like D and C
nnoremap Y y$

" Pretty-print JSON buffer
nnoremap =j :%!python3 -m json.tool<CR>

nnoremap <C-p> :<C-u>FZF<CR>
" to not conflict with tmux remap
inoremap <C-x>f <C-x><C-f>
imap <C-x><C-p> <plug>(fzf-complete-path)

" map clever tab
inoremap <expr> <Tab>   <SID>CleverTab()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-n>" : "\<S-Tab>"

" Disable arrow keys in insert mode
inoremap <Up>    <Nop>
inoremap <Down>  <Nop>
inoremap <Left>  <Nop>
inoremap <Right> <Nop>

" Disable arrow keys in normal, visual, operator-pending mode
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

" Markdown
let g:markdown_folding = 1

" ==================== ripgrep ====================
" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case -g "!vendor"'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1
let g:ack_apply_lmappings = 1

" Highlight the search term in buffers (sets @/ and turns on hlsearch)
let g:ackhighlight = 1

" Open the quickfix/location list after :make, :grep, :vimgrep etc. when it has
" entries; close it when it's empty
augroup AutoQuickfix
  autocmd!
  autocmd QuickFixCmdPost [^l]* nested cwindow
  autocmd QuickFixCmdPost l*    nested lwindow
augroup END

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Run searches through vim-dispatch instead of :grep. Terminal Vim's :grep
" shells out and swaps screens, which makes the window blink.
let g:ack_use_dispatch = 1

" fzf + rg: :Rg comes from fzf.vim; :F searches everything incl. hidden/ignored
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '
command! -bang -nargs=* F call fzf#vim#grep(g:rg_command . shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
nnoremap <F8> :Rg<CR>

" ==================== NerdTree ====================
" For toggling
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'htmlcov', 'node_modules', '.idea', '.git']

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" 
" ==================== GitGutter ====================
set updatetime=250
let g:gitgutter_max_signs = 500
" No mapping
let g:gitgutter_map_keys = 0
" Colors
let g:gitgutter_highlight_linenrs = 1
let g:gitgutter_use_colorscheme = 1
highlight clear SignColumn
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4
highlight GitGutterAddLineNr ctermfg=7 ctermbg=2

" Jump between hunks
nmap <Leader>gn <Plug>(GitGutterNextHunk)  " git next
nmap <Leader>gp <Plug>(GitGutterPrevHunk)  " git previous

" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>(GitGutterStageHunk)  " git add (chunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)   " git undo (chunk)
nmap <Leader>gp <Plug>(GitGutterPreviewHunk)

" launch/kill the Livedown server
nmap gm :LivedownToggle<CR>

" Better split switching
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l


nnoremap <leader>a :cclose<CR>

" ==================== vim-go ====================
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = 'gopls'
let g:go_debug_windows = {
      \ 'vars':  'leftabove 35vnew',
      \ 'stack': 'botright 10new',
\ }

let g:go_test_prepend_name = 1
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 0
let g:go_auto_sameids = 0

let g:go_null_module_warning = 0
let g:go_echo_command_info = 1

let g:go_autodetect_gopath = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_enabled = ['vet', 'golint']
let g:go_metalinter_command = 'golangci-lint' 

let g:go_def_mode='gopls'
let g:go_info_mode = 'gopls'
let g:go_rename_command='gopls'
let g:go_gopls_gofumpt=v:true
let g:go_imports_mode = 'gopls'
let g:go_gopls_complete_unimported = 1
let g:go_implements_mode='gopls'
let g:go_diagnostics_enabled = 1
let g:go_doc_popup_window = 1
let g:go_imports_autosave = 1

let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 0
let g:go_highlight_format_strings = 0
let g:go_highlight_fields = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_gocode_propose_source = 1

let g:go_modifytags_transform = 'camelcase'
let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']



" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction


augroup go
  autocmd!

  autocmd FileType go nmap <buffer> <C-g> :GoDecls<cr>
  autocmd FileType go imap <buffer> <C-g> <esc>:<C-u>GoDecls<cr>

  autocmd FileType go nmap <buffer> <silent> <Leader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <buffer> <silent> <Leader>s <Plug>(go-def-split)
  autocmd FileType go nmap <buffer> <silent> <Leader>d <Plug>(go-def-tab)

  autocmd FileType go nmap <buffer> <silent> <Leader>x <Plug>(go-doc-vertical)

  autocmd FileType go nmap <buffer> <silent> <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <buffer> <silent> <Leader>l <Plug>(go-metalinter)

  autocmd FileType go nmap <buffer> <silent> <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <buffer> <silent> <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <buffer> <silent> <leader>r  <Plug>(go-run)
  autocmd FileType go nmap <buffer> <silent> <leader>e  <Plug>(go-install)

  autocmd FileType go nmap <buffer> <silent> <Leader>c <Plug>(go-coverage-toggle)

  " I like these more!
  autocmd Filetype go command! -buffer -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -buffer -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -buffer -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -buffer -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" ==================== indentLine ====================
let g:indentLine_char_list = ['┊']

" ==================== CamelCaseMotion ====================
let g:camelcasemotion_key = '\'

" ==================== python-syntax ====================
let g:python_highlight_all = 1

" ==================== vim-expand-region ====================
" + expands visual selection, _ shrinks it
let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'ip'  :0,
      \ }

" ==================== UltiSnips ====================
" <Tab> = completion, insert <C-j> = move line, so expand with <C-l>
let g:UltiSnipsExpandTrigger = "<c-l>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
let g:UltiSnipsEditSplit = "vertical"

" ==================== rust.vim ====================
" run :RustFmt on save
let g:rustfmt_autosave = 1
