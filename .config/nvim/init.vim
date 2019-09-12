"
" .vimrc
" Nils Weber | me@nilsweb.de | @nilsweb
"

set nocompatible                                                              " Disable VI compatibility to use awesome VIM features.


" --- VIM-Plug --- "
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()                                                             " Start Plug
" Visual/Style features
Plug 'dracula/vim', { 'as': 'dracula' }                                       " Dracula color scheme
Plug 'vim-airline/vim-airline'                                                " VIM status line customization
Plug 'vim-airline/vim-airline-themes'                                         " Themes for vim-airline

" Utility features
Plug 'scrooloose/nerdtree'                                                    " NERDTree file viewer
Plug 'ctrlpvim/ctrlp.vim'                                                     " FuzzyFinder
Plug 'tpope/vim-fugitive'                                                     " GIT wrapper
Plug 'christoomey/vim-tmux-navigator'                                         " Navigate tmux and vim panes more easily

" Editing features
Plug 'easymotion/vim-easymotion'                                              " VIM EasyMotion
Plug 'justinmk/vim-sneak'                                                     " VIM Sneak
Plug 'tpope/vim-surround'                                                     " Support for editing surrounding text objects

" IDE-like features
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}            " LSP client
Plug 'dense-analysis/ale'                                                     " Linting engine

" Language-specific features
Plug 'sheerun/vim-polyglot'                                                   " Language support for almost everything
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }                            " Awesome Golang support and tooling
call plug#end()                                                               " End Plug


" --- Visual settings --- "
color dracula                                                                 " Use Dracula color theme.
syntax on                                                                     " Use syntax highlighting.
set termguicolors                                                             " Make colors look good.
set cursorline                                                                " Highlight the current line.
set showmatch                                                                 " Hightlight matching [{()}]
set incsearch                                                                 " Search as characters are entered.
set hlsearch                                                                  " Hightlight search matches.
set ignorecase                                                                " Ignore case when searching.
set number relativenumber                                                     " Show line numbers (absolute and relative).
set list listchars=tab:»\ ,trail:·,nbsp:·                                     " Show extra whitespace.
set splitright                                                                " Always split to the right and bottom.
set textwidth=80
set colorcolumn=80


" --- Scrolling --- "
" Scroll before the last line is reached.
set scrolloff=8
set sidescrolloff=15
set sidescroll=1


" --- Indentation settings --- "
set smartindent                                                               " Automaticall indent text content-aware.
set shiftwidth=2                                                              " Number of spaces when indenting using >> or << (or when automatical indenting is used).
set tabstop=2                                                                 " Number of visual spaces per tab (for files with <tab> characters).
set softtabstop=2                                                             " Number of spaces when hitting the <tab> key in insert mode.
set expandtab                                                                 " Use spaces instead of <tab>s.


" --- System settings --- "
set autowrite                                                                 " Automatically save before executing commands.
set autoread                                                                  " Reload changes that happened outside of VIM automatically.
au FocusGained,BufEnter * :silent! !                                          " Trigger autoread when changing buffers or focusing VIM.
set noswapfile                                                                " Don't use a vim swap file.
set clipboard=unnamed                                                         " Use system clipboard.
set ttimeoutlen=10                                                            " Remove delay when leaving insert mode.
set mouse=a                                                                   " Enable mouse support (yeah... I know...).


" --- Keyboard Settings --- "
let mapleader=' '                                                             " Set <leader> key to <SPACE>.
set pastetoggle=<F12>                                                         " Activate PATSE mode with <F12>.

" Leader Key
map <LEADER> :NERDTreeToggle<CR>

" Quickly close windows
nnoremap <leader>x :x<cr>
nnoremap <leader>X :q!<cr>

" Zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" resize panes
nnoremap <silent> <Right> :vertical resize -5<cr>
nnoremap <silent> <Left> :vertical resize +5<cr>
nnoremap <silent> <Up> :resize -5<cr>
nnoremap <silent> <Down> :resize +5<cr>

" Switch between the last two files
nnoremap <leader><leader> <c-^>


" Normal Mode
nnoremap j gj
nnoremap k gk
nmap <F2> <Plug>(coc-rename)

" Insert Mode
inoremap jk <ESC>
inoremap kj <ESC>
inoremap <C-s> <ESC>:wq<CR>a

" Commands
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall


" --- Airline --- "
let g:airline_theme = 'dracula'                                               " Use base16 theme.
let g:airline_powerline_fonts = 1                                             " Enable Powerline symbols.
let g:airline#extensions#branch#enabled = 1                                   " Enable branch showing.
let g:airline_section_x = ''                                                  " Clear section X (filetype).
let g:airline_section_y = ''                                                  " Clear section Y (encoding).
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
set noshowmode                                                                " Remove default mode indicator.


" --- CoC --- "
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Completion with C-Space
inoremap <silent><expr> <c-space> coc#refresh()

" Keys for GOTO-commands
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" --- ALE --- "
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'javascript': ['eslint'],
\}
let g:ale_sign_error = '🚨'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1


" ===== AUTOCOMMANDS ===== "
augroup vimrcEx
  " Automatically wrap at 100 characters and spell check markdown files.
  autocmd FileType markdown setlocal spell
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Automatically wrap at 100 characters and spell check git commit messages.
  autocmd FileType gitcommit setlocal textwidth=80
  autocmd FileType gitcommit setlocal spell
augroup END


" ===== Language Settings ===== "

" --- Golang --- "
let g:go_fmt_command = "goimports"                                            " Have vim-go automatically import and format on save
let g:go_def_mapping_enabled = 0                                              " Let CoC handle :GoDef (gd)

