set encoding=utf-8              " Set default encoding to UTF-8
scriptencoding utf-8            " This file has non-ASCII chars (listchars)

" minpac is only loaded for :PackUpdate / :PackClean, not on every startup.
" Plugins live in ~/.vim/pack/minpac/start and load as normal packages.
function! s:PackInit() abort
  packadd minpac
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})  " so :PackUpdate updates it too

  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('junegunn/fzf')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('mileszs/ack.vim')
  call minpac#add('lifepillar/vim-solarized8')
  call minpac#add('fatih/vim-go')
  call minpac#add('inkarkat/vim-ReplaceWithRegister')
  call minpac#add('christoomey/vim-sort-motion')
  call minpac#add('bkad/CamelCaseMotion')
  call minpac#add('vim-python/python-syntax')
  call minpac#add('terryma/vim-expand-region')
  call minpac#add('SirVer/ultisnips')
  call minpac#add('ervandew/supertab')
  call minpac#add('godlygeek/tabular')
  call minpac#add('rust-lang/rust.vim')

  call minpac#add('tpope/vim-abolish')
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

  call minpac#add('junegunn/vim-peekaboo')
  call minpac#add('jeffkreeftmeijer/vim-numbertoggle')
  call minpac#add('b4b4r07/vim-sqlfmt')
  call minpac#add('preservim/nerdtree')
  call minpac#add('Xuyuanp/nerdtree-git-plugin')
  call minpac#add('ryanoasis/vim-devicons')
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
  call minpac#add('tell-k/vim-autoflake')
  call minpac#add('simeji/winresizer')
  call minpac#add('szw/vim-maximizer')
endfunction

command! PackUpdate call s:PackInit() | call minpac#update()
command! PackClean  call s:PackInit() | call minpac#clean()
command! PackStatus call s:PackInit() | call minpac#status()

" Built-in replacements for vim-commentary (gc) and vim-highlightedyank
packadd! comment
packadd! hlyank

""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""
filetype plugin indent on       " Enable filetype detection, plugins, indent

if !has('nvim')
  set ttymouse=sgr    " SGR mouse codes: clicks work past column 223
endif

if exists('&inccommand')
  set inccommand=split
endif

set laststatus=2                " Show status line always
set autoread                    " Automatically read changed files
set autoindent                  " Enabile Autoindent
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set mouse=a
set hlsearch                    " Highlight found searches
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
" set cursorline                  " Highlight cursor
set lazyredraw                  " Wait to redraw
set history=1000
set scrolloff=5
set shortmess+=c                " No 'match 1 of 5' messages during completion
set belloff=all                 " No beeps, ever
set maxmempattern=20000         " Big files with heavy syntax (vim-go) don't hit E363
set viminfo='1000,<50,s10,h     " Remember 1000 recent files for fzf :History

" Time out on key codes quickly (fast <Esc>), but not on mappings
set ttimeout
set ttimeoutlen=10

" only macOS
set dictionary+=/usr/share/dict/words
set thesaurus+=~/.vim/thesaurus/english.txt

" Spell checking: on for prose only, custom words saved via zg
set spelllang=en
set spellfile=~/.vim/spell/en.utf-8.add

" One group for all vimrc autocmds, cleared first so :source $MYVIMRC
" doesn't stack duplicates
augroup vimrc
  autocmd!
augroup END

autocmd vimrc FileType markdown,text,gitcommit setlocal spell complete+=k

" autoread only acts on :checktime; run it when coming back to Vim/a buffer
autocmd vimrc FocusGained,BufEnter * silent! checktime

" Indent guides without indentLine (which uses conceal and hides quotes in
" JSON / markup in Markdown). Tabs (Go) and leading spaces get a ┊.
set list
set listchars=tab:┊\ ,leadmultispace:┊\ \ \ ,trail:·,nbsp:␣

" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
" (unnamedplus is X11-only, does nothing on macOS)
set clipboard=unnamed

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo//
endif

" Vim doesn't create these; without them undofile / zg fail quietly
for s:dir in [&undodir, fnamemodify(&spellfile, ':h')]
  if !isdirectory(expand(s:dir))
    call mkdir(expand(s:dir), 'p')
  endif
endfor

" Colorscheme
" Enable 24-bit true color in the terminal
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Custom highlights. termguicolors is on, so gui* colors are what's used
" (cterm* kept for non-truecolor terminals). Re-applied on every
" :colorscheme, which otherwise wipes them. Solarized palette.
function! s:MyHighlights() abort
  hi myModeNormal  cterm=bold ctermbg=148 ctermfg=22  gui=bold guibg=#859900 guifg=#002b36
  hi myModeInsert  cterm=bold ctermbg=23  ctermfg=231 gui=bold guibg=#268bd2 guifg=#fdf6e3
  hi myModeVisual  cterm=bold ctermbg=208 ctermfg=88  gui=bold guibg=#cb4b16 guifg=#fdf6e3
  hi myModeReplace cterm=bold ctermbg=160 ctermfg=231 gui=bold guibg=#dc322f guifg=#fdf6e3
  hi myModeOther   cterm=bold ctermbg=136 ctermfg=231 gui=bold guibg=#b58900 guifg=#fdf6e3
  hi myInfoColor   ctermbg=240 ctermfg=252 guibg=#073642 guifg=#93a1a1

  hi clear SignColumn
  hi GitGutterAdd          ctermfg=2 guifg=#859900
  hi GitGutterChange       ctermfg=3 guifg=#b58900
  hi GitGutterDelete       ctermfg=1 guifg=#dc322f
  hi GitGutterChangeDelete ctermfg=4 guifg=#268bd2
  hi GitGutterAddLineNr    ctermfg=7 ctermbg=2 guifg=#eee8d5 guibg=#859900
endfunction
autocmd vimrc ColorScheme * call s:MyHighlights()

" Set dark background and apply Solarized
let g:solarized_statusline = "flat"  " must be set before :colorscheme
syntax enable
set background=dark
colorscheme solarized8

""""""""""""""""""""""""""
"""""""" STATUSLINE """"""
""""""""""""""""""""""""""

" mode() first char -> [label, highlight group]
let s:modes = {
      \ 'n':      ['NORMAL',   'myModeNormal'],
      \ 'i':      ['INSERT',   'myModeInsert'],
      \ 'R':      ['REPLACE',  'myModeReplace'],
      \ 'v':      ['VISUAL',   'myModeVisual'],
      \ 'V':      ['V-LINE',   'myModeVisual'],
      \ "\<C-v>": ['V-BLOCK',  'myModeVisual'],
      \ 'c':      ['COMMAND',  'myModeOther'],
      \ 's':      ['SELECT',   'myModeVisual'],
      \ 'S':      ['S-LINE',   'myModeVisual'],
      \ "\<C-s>": ['S-BLOCK',  'myModeVisual'],
      \ 't':      ['TERMINAL', 'myModeOther'],
      \}

" Returns statusline markup (used via %{%...%}), so the color comes from a
" highlight group per mode instead of re-running :hi on every redraw
function! StatusLineMode() abort
  let [label, group] = get(s:modes, mode()[0], ['', 'myModeOther'])
  return '%#' . group . '#' . label . '%*'
endfunction

function! StatusLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! StatusLineLeftInfo()
 let branch = FugitiveHead()
 let filename = '' != expand('%:t') ? expand('%:t') : '[No Name]'
 if branch !=# ''
   return printf("%s | %s", branch, filename)
 endif
 return filename
endfunction

" start building our statusline
set statusline=

" mode with custom colors
set statusline+=%{%StatusLineMode()%}

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
set statusline+=\ %{StatusLineFiletype()}\ %p%%\ %l:%v

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return a + m + r == 0 ? '' : printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=\ %{GitStatus()}

set statusline+=\ %*




"===================== MAPPINGS ======================
" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
let mapleader = ","

" edit / reload vimrc
" (under ,f: Go buffers map ,e ,s ,v, which made these wait timeoutlen)
nnoremap <leader>fv :edit $MYVIMRC<CR>
nnoremap <leader>fr :source $MYVIMRC<CR>:echo "vimrc reloaded"<CR>

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

" Auto-clear search highlight once the cursor leaves a match (n/N/* keep it).
" Not the built-in nohlsearch package: it clears on CursorHold, i.e. after
" updatetime=250ms. :nohlsearch inside an autocmd is undone, hence feedkeys.
function! s:AutoNohl() abort
  if !v:hlsearch || empty(@/)
    return
  endif
  " first match at/after cursor; if it isn't at the cursor, we're off a match
  try
    let on_match = searchpos(@/, 'cnW') == getpos('.')[1:2]
  catch
    let on_match = 0
  endtry
  if !on_match
    call feedkeys("\<Cmd>nohlsearch\<CR>", 'n')
  endif
endfunction
autocmd vimrc CursorMoved * call s:AutoNohl()
autocmd vimrc InsertEnter * call feedkeys("\<Cmd>nohlsearch\<CR>", 'n')

" Substitute the word under the cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" Move by display lines
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

" Window navigation (in addition to <C-h/j/k/l>)
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap gh <C-w>h
nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gl <C-w>l

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

" JSON via python's json.tool (4-space indent, keeps key order):
"   :JsonFormat  whole buffer (or a range), works in any filetype
"   gq{motion}   in json buffers, e.g. gggqG
command! -range=% JsonFormat <line1>,<line2>!python3 -m json.tool
autocmd vimrc FileType json setlocal formatprg=python3\ -m\ json.tool

nnoremap <C-p> :<C-u>FZF<CR>
" to not conflict with tmux remap
inoremap <C-x>f <C-x><C-f>
imap <C-x><C-p> <plug>(fzf-complete-path)


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

" File list for :FZF / <C-p>: rg respects .gitignore (no bin/, vendor/, coverage
" junk). Set here because the shell's FZF_DEFAULT_COMMAND isn't exported.
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --follow --glob '!.git/*'"

" fzf in a small split at the bottom instead of the centered popup
let g:fzf_layout = { 'down': '~20%' }

" :Rg with the preview hidden until you press ?; :Rg! = fullscreen, preview on top
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- ' . shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Recent files (viminfo keeps 1000) and open buffers
nnoremap <leader>fh :History<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <F8> :Rg<CR>

" ==================== NerdTree ====================
" For toggling
noremap <Leader>n :NERDTreeToggle<cr>
" Leave netrw to vim-vinegar (`-`); NERDTree only via <Leader>n
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'htmlcov', 'node_modules', '.idea', '.git']

autocmd vimrc BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" 
" ==================== GitGutter ====================
set updatetime=250
let g:gitgutter_max_signs = 500
" No mapping
let g:gitgutter_map_keys = 0
" Colors
let g:gitgutter_highlight_linenrs = 1
" Colors: see s:MyHighlights()

" No trailing comments on :map lines -- they become part of the mapping
" Jump between hunks: git next / git previous
nmap <Leader>gn <Plug>(GitGutterNextHunk)
nmap <Leader>gp <Plug>(GitGutterPrevHunk)

" Hunk staging: git add (chunk) / git undo (chunk) / preview
nmap <Leader>ga <Plug>(GitGutterStageHunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)
nmap <Leader>gP <Plug>(GitGutterPreviewHunk)

" launch/kill the Livedown server
nnoremap gm :LivedownToggle<CR>

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

let g:go_test_show_name = 1
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 0
let g:go_auto_sameids = 0

" Don't echo 'vim-go: initializing gopls' etc.; the statusline shows Go job status
let g:go_echo_command_info = 0
" Tell vim-go where Go binaries live so it skips a slow `go env GOBIN` on open
let s:go_default_bin_path = empty($GOBIN) ? expand('~/go/bin') : $GOBIN
let g:go_bin_path = s:go_default_bin_path

" Prefer project-pinned tools: if the module has bin/golangci-lint (e.g.
" dynatrace-operator's `make prerequisites`), search that bin/ first, so
" :GoMetaLinter uses the project's version. Uses findfile(), no shell-out.
function! s:GoProjectBinPath() abort
  let l:gomod = findfile('go.mod', expand('%:p:h') . ';')
  let l:bin = empty(l:gomod) ? '' : fnamemodify(l:gomod, ':p:h') . '/bin'
  let g:go_bin_path = !empty(l:bin) && executable(l:bin . '/golangci-lint')
        \ ? l:bin : s:go_default_bin_path
endfunction

let g:go_metalinter_command = 'golangci-lint'

let g:go_def_mode='gopls'
let g:go_rename_command='gopls'
let g:go_gopls_gofumpt = v:false
let g:go_imports_mode = 'gopls'
let g:go_gopls_complete_unimported = 1
let g:go_implements_mode='gopls'
" 0 = ignore gopls diagnostics. Any level > 0 makes vim-go bufload() every
" file in the workspace that has a diagnostic, synchronously, which freezes
" Vim for minutes in big repos (e.g. dynatrace-operator). Use :GoDiagnostics
" or :GoMetaLinter on demand instead.
let g:go_diagnostics_level = 0
let g:go_doc_popup_window = 1
let g:go_imports_autosave = 1

let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 0
let g:go_highlight_format_strings = 0
let g:go_highlight_fields = 1
let g:go_highlight_extra_types = 1

let g:go_addtags_transform = 'camelcase'
let g:go_fold_enable = []

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

  autocmd BufEnter *.go call s:GoProjectBinPath()

  " gofmt uses tabs; show them 4 columns wide instead of 8
  autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4

  autocmd FileType go nnoremap <buffer> <C-g> :GoDecls<cr>
  autocmd FileType go inoremap <buffer> <C-g> <esc>:<C-u>GoDecls<cr>

  autocmd FileType go nmap <buffer> <silent> <Leader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <buffer> <silent> <Leader>s <Plug>(go-def-split)
  autocmd FileType go nmap <buffer> <silent> <Leader>d <Plug>(go-def-tab)

  autocmd FileType go nmap <buffer> <silent> <Leader>x <Plug>(go-doc-vertical)

  autocmd FileType go nmap <buffer> <silent> <Leader>i <Plug>(go-doc)
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

" ==================== Completion + Snippets ====================
" <Tab> does everything (same setup as fatih/dotfiles):
"   1. UltiSnips tries to expand a snippet, or jump to the next placeholder
"   2. if there's no snippet, UltiSnips hands <Tab> to SuperTab
"   3. SuperTab picks a completion from the text before the cursor:
"        after `.` (e.g. `fmt.`) -> omni completion (vim-go/gopls in Go)
"        after `/`               -> file path completion
"        otherwise               -> keyword completion (<C-p>)
"        at line start/after whitespace -> inserts a real tab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit = "vertical"

" ==================== rust.vim ====================
" run :RustFmt on save
let g:rustfmt_autosave = 1

" ==================== Visual * / # ====================
" Search for the visually selected text
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
xnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><C-o>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><C-o>

" ==================== Go doc comment ====================
" Insert `// <word under cursor> ` above the line to start a doc comment
function! s:create_go_doc_comment()
  norm! "zyiw
  execute ":put! z"
  execute ":norm! I// \<Esc>$"
endfunction
autocmd vimrc FileType go nnoremap <buffer> <leader>ui :<C-u>call <SID>create_go_doc_comment()<CR>

" ==================== Windows (from fatih/dotfiles) ====================
" Fast save, and close all other windows
nnoremap <leader>w :w!<CR>
nnoremap <leader>o :only<CR>

" Re-equalize splits when the terminal / tmux pane is resized
autocmd vimrc VimResized * wincmd =

" Quickfix always full-width at the bottom, with wrapped lines
augroup quickfix
  autocmd!
  autocmd FileType qf wincmd J
  autocmd FileType qf setlocal wrap
augroup END

" Help in a vertical split on the right (:Help is the explicit version)
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd vimrc FileType help wincmd L

" Terminal: <Esc> enters terminal-normal mode, <C-hjkl> moves to other windows
if has('terminal')
  tnoremap <Esc> <C-w>N
  tnoremap <C-h> <C-w>h
  tnoremap <C-j> <C-w>j
  tnoremap <C-k> <C-w>k
  tnoremap <C-l> <C-w>l
endif
