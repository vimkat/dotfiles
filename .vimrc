"
" .vimrc
" Nils Weber | me@nilsweb.de | @nilsweb
"


" --- VIM-Plug --- "
call plug#begin()                                                             " Start Plug
Plug 'chriskempson/base16-vim'                                                " Base16 color schemes
Plug 'scrooloose/nerdtree'                                                    " NERDTree file viewer
Plug 'ctrlpvim/ctrlp.vim'                                                     " FuzzyFinder
Plug 'vim-airline/vim-airline'                                                " VIM status line customization
Plug 'vim-airline/vim-airline-themes'                                         " Themes for vim-airline
Plug 'tpope/vim-fugitive'                                                     " GIT wrapper
call plug#end()                                                               " End Plug


" --- Visual settings --- "
color base16-onedark                                                          " Use Base16's One Dark color theme.
syntax on                                                                     " Use syntax highlighting.
set cursorline                                                                " Highlight the current line.
set showmatch                                                                 " Hightlight matching [{()}]
set incsearch                                                                 " Search as characters are entered.
set hlsearch                                                                  " Hightlight search matches.
set number relativenumber                                                     " Show line numbers (absolute and relative).


" --- Indentation settings --- "
set smartindent                                                               " Automaticall indent text content-aware.
set shiftwidth=2                                                              " Number of spaces when indenting using >> or << (or when automatical indenting is used).
set tabstop=2                                                                 " Number of visual spaces per tab (for files with <tab> characters).
set softtabstop=2                                                             " Number of spaces when hitting the <tab> key in insert mode.
set expandtab                                                                 " Use spaces instead of <tab>s


" --- System settings --- "
set noswapfile                                                                " Don't use a vim swap file.
set clipboard=unnamed                                                         " Use system clipboard.
set ttimeoutlen=10                                                            " Remove delay when leaving insert mode


" --- Keyboard Settings --- "
map <C-n> :NERDTreeToggle<CR>                                                 " Toggle NERDTree with Ctrl+N


" --- Airline --- "
let g:airline_theme = 'base16'                                                " Use base16 theme
let g:airline_powerline_fonts = 1                                             " Enable Powerline symbols
let g:airline#extensions#branch#enabled = 1                                   " Enable branch showing
let g:airline_section_x = ''                                                  " Clear section X (filetype)
let g:airline_section_y = ''                                                  " Clear section Y (encoding)
set noshowmode                                                                " Remove default mode indicator
