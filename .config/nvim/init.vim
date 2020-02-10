"
" init.vim
" Nils "Kat" Weber | @vimkat
"

set nocompatible                                                               " Disable VI compatibility to use awesome VIM features.


" --- VIM-Plug --- "
" This piece of magic installs vim-plug, if it's not installed.
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" Visual/Style features
Plug 'dracula/vim', { 'as': 'dracula' }                                        " Dracula color scheme
Plug 'vim-airline/vim-airline'                                                 " VIM status line customization
Plug 'yuttie/comfortable-motion.vim'                                           " Make scrolling super smooth
Plug 'ryanoasis/vim-devicons'                                                  " Make VIM show icons for files types
Plug 'thiagoalessio/rainbow_levels.vim'                                        " Highlight indentation levels (great for seeing what goes where)
Plug 'junegunn/goyo.vim'                                                       " Zen-Mode for VIM
Plug 'junegunn/limelight.vim'                                                  " Even more Zen-Mode (highlights current section for more focus)

" Utility features
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }                         " NERDTree file viewer
Plug 'tpope/vim-fugitive'                                                      " GIT wrapper
Plug 'airblade/vim-gitgutter'                                                  " MOAR awesome Git tools (who doesn't want that, right?)
Plug 'christoomey/vim-tmux-navigator'                                          " Navigate tmux and vim panes more easily
Plug '/usr/local/opt/fzf'                                                      " Fuzzy finder binary
Plug 'junegunn/fzf.vim'                                                        " Fuzzy finder vim bindings

" Editing features
Plug 'easymotion/vim-easymotion'                                               " VIM EasyMotion
Plug 'justinmk/vim-sneak'                                                      " VIM Sneak
Plug 'tpope/vim-surround'                                                      " Support for editing surrounding text objects
Plug 'Raimondi/delimitMate'                                                    " Auto-close matching parents, quotes, etc.
Plug 'tpope/vim-commentary'                                                    " Comment out stuff based on the current language
Plug 'godlygeek/tabular'                                                       " Make things line up at your command

" IDE-like features
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }                  " Completion engine
Plug 'dense-analysis/ale'                                                      " Linting engine

" Language-specific features
Plug 'sheerun/vim-polyglot'                                                    " Language support for almost everything
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }                             " Awesome Golang support and tooling
call plug#end()                                                                " End Plug


" --- Visual settings --- "
color dracula                                                                  " Use Dracula color theme
syntax on                                                                      " Use syntax highlighting
set termguicolors                                                              " Make colors look good
set cursorline                                                                 " Highlight the current line
set showmatch                                                                  " Hightlight matching [{()}]
set incsearch                                                                  " Search as characters are entered
set hlsearch                                                                   " Hightlight search matches
set ignorecase                                                                 " Ignore case when searching
set number                                                                     " Show line numbers (absolute)
set list listchars=tab:\│\ ,trail:◉,nbsp:·                                      " Show extra whitespace
set splitright                                                                 " Always split to the right and bottom
set textwidth=80                                                               " Make VIM wrap lines at 80 chars (e.g. commits, markdown)
set colorcolumn=80                                                             " Show line at 80 chars width


" --- Scrolling --- "
set scrolloff=4                                                                " Keep as soon as there are only x lines visible (vertically)
set sidescrolloff=8                                                            " Same as scrolloff, but horizontally


" --- Indentation settings --- "
set smartindent                                                                " Automaticall indent text content-aware
set tabstop=2                                                                  " Number of visual spaces per tab (for files with <tab> characters)
set shiftwidth=0 softtabstop=0 noexpandtab                                     " Make tab indentation work as expected
set foldmethod=syntax                                                          " Use folds based on syntax
set foldlevel=1000                                                             " Don't fold by default (until I'm more comfortable with folding)


" --- System settings --- "
set autowrite                                                                  " Automatically save before executing commands
set autoread                                                                   " Reload changes that happened outside of VIM automatically
au FocusGained,BufEnter * :silent! !                                           " Trigger autoread when changing buffers or focusing VIM.
set noswapfile                                                                 " Don't use a vim swap file
set clipboard=unnamed                                                          " Use system clipboard
set ttimeoutlen=10                                                             " Remove delay when leaving insert mode (increase when things get wierd)
set mouse=a                                                                    " Enable mouse support (yeah... I know...)


" --- Keyboard Settings --- "
let mapleader=' '                                                              " Set <leader> key to <SPACE> (shown as <> in comments)
set pastetoggle=<F12>                                                          " Activate PATSE mode with <F12> (keeps Vim from interpreting things as commands when pasting)

" Quickly close windows with <>x (or <>X to discard changes)
nnoremap <leader>x :x<cr>
nnoremap <leader>X :q!<cr>

" Zoom a vim pane with <>-, <>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Resize panes using the arrow keys
nnoremap <silent> <Right> :vertical resize -5<cr>
nnoremap <silent> <Left> :vertical resize +5<cr>
nnoremap <silent> <Up> :resize -5<cr>
nnoremap <silent> <Down> :resize +5<cr>

" Switch between the last two files by tapping <> followed by backspace
nnoremap <leader><BS> <c-^>

" Toggle rainbow levels (highlighting by indentaiton)
map <leader>l :RainbowLevelsToggle<cr>

" Make j and k also move over wrapped lines
nnoremap j gj
nnoremap k gk

" Get out of insert mode using jk or kj (since that's faster)
inoremap jk <ESC>
inoremap kj <ESC>

" Common misspelled comamnds - make vim know what you wanted to type
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qa! qa!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa


" --- Airline --- "
let g:airline_theme = 'dracula'                                                " Use dracula theme for status bar
let g:airline_powerline_fonts = 1                                              " Enable Powerline symbols
let g:airline#extensions#branch#enabled = 1                                    " Show git branch
let g:airline_section_x = ''                                                   " Clear section X (filetype)
let g:airline_section_y = ''                                                   " Clear section Y (encoding)
let g:airline_left_sep = ' '                                                   " Separator char for the left side
let g:airline_right_sep = ''                                                   " Separator char for the right side
set noshowmode                                                                 " Remove default mode indicator


" --- FZF.VIM --- "
" Shortcuts for opening the fuzzy finder for common things
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>t :BTags<CR>
nnoremap <leader>T :Tags<CR>


" --- ALE --- "
let g:ale_fixers = {
	\ '*': ['remove_trailing_lines', 'trim_whitespace'],
	\ 'javascript': ['prettier', 'eslint'],
	\ 'go': ['goimports'],
\}

let g:ale_linters = {
	\ 'javascript': ['tsserver','prettier', 'eslint'],
	\ 'go': ['gopls'],
\}

let g:ale_sign_error = '🚨'
let g:ale_sign_warning = '⚠️ '
let g:ale_fix_on_save = 1
let g:ale_completion_tsserver_autoimport = 1
let g:ale_set_balloons = 1

let g:ale_completion_symbols = {
	\ 'text': '',
	\ 'method': '',
	\ 'function': '',
	\ 'constructor': '',
	\ 'field': '',
	\ 'variable': '',
	\ 'class': '',
	\ 'interface': '',
	\ 'module': '',
	\ 'property': '',
	\ 'enum': '',
	\ 'snippet': '',
	\ 'file': '',
	\ 'folder': '',
	\ 'enum member': '',
	\ 'constant': '',
	\ 'struct': '{}',
	\ 'operator': '',
	\ 'type_parameter': 'type param',
	\ '<default>': '?'
\}

nnoremap <silent> K :ALEHover<CR>
nnoremap <silent> gd :ALEGoToDefinition<CR>
nnoremap <silent> <F2> :ALERename<CR>

" --- Deoplete --- "
let g:deoplete#enable_at_startup = 1

" Use ALE as completion sources for all code
call deoplete#custom#option('sources', {
	\ '_': ['ale'],
\})

call deoplete#custom#var('around', {
	\ 'mark_above': '[↑]',
	\ 'mark_below': '[↓]',
	\ 'mark_changes': '[*]',
\})


" ===== AUTOCOMMANDS ===== "
if has('autocmd')
	augroup vimrc
		" Clear autocommands in case the .vimrc gets sourced twice
		autocmd!

		" Automatically wrap at 80 characters and spell check markdown and git
		" commits
		autocmd FileType markdown setlocal spell textwidth=80
		autocmd FileType gitcommit setlocal spell textwidth=80

	" Automatically source .vimrc on save
		autocmd BufWritePost $MYVIMRC,$MYGVIMRC nested source %

		" Enable Limelight when entering Goyo
		autocmd User GoyoEnter Limelight
		autocmd User GoyoLeave Limelight!
	augroup END
endif



" ===== Language Settings ===== "

" --- Golang --- "
let g:go_fmt_command = "goimports"                                             " Have vim-go automatically import and format on save

" Make vim-go highlight all the things
let g:go_highlight_types                 = 1
let g:go_highlight_fields                = 1
let g:go_highlight_functions             = 1
let g:go_highlight_function_parameters   = 1
let g:go_highlight_function_calls        = 1
let g:go_highlight_operators             = 1
let g:go_highlight_extra_types           = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments  = 1
