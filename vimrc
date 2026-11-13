packadd minpac
call minpac#init()

call minpac#add('tpope/vim-unimpaired')
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')

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
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-speeddating')

call minpac#add('airblade/vim-gitgutter')
call minpac#add('ruanyl/vim-gh-line')

call minpac#add('junegunn/vim-peekaboo')
call minpac#add('haya14busa/incsearch.vim')
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
syntax enable
set t_Co=256
let g:rehash256 = 1
set background=dark
" let g:Favcolorschemes = ["darkblue", "morning", "shine", "evening"]
" colorscheme darksolarized

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
" set statusline+=%{go#statusline#Show()}
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

"===================== MAPPINGS ======================
" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
let mapleader = ","

nnoremap <C-p> :<C-u>FZF<CR>

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

" ==================== NerdTree ====================
" For toggling
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'htmlcov', 'node_modules', '.idea', '.git']

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
