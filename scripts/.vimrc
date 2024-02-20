filetype off                                                         " Helps force plugins to load correctly when it is turned back on below
filetype plugin on                                                   " For plugins to load correctly
filetype indent on
syntax on                                                            " Turn on syntax highlighting


let mapleader=" "                                                " Leader is a space

""" Set Style """
    set nocompatible                                                 " Set compatible with Vim only
    set autoindent                                                   " Enable automatic indentation
    set smartindent
    set modelines=0                                                  " Security Config : Disabled the modeline


""" UI CONFIGURATION
    set number relativenumber                                        " Show line numbers
    set ruler                                                        " Show file stats
    set showcmd                                                      " Show command in bottom bar
    set wildmode=longest,list,full
    set wildmenu                                                     " Visual autocomplete for command menu
    set showmatch                                                    " Highlight matching [{()}]
    set noerrorbells
    set encoding=utf-8
    set nowrap
    set formatoptions=tcqrn1
    set nohlsearch
    set cmdheight=1
    set signcolumn=yes                                               " Leave front space for error, +, - sign
    set colorcolumn=120                                              " Show the vertical line of nth column
    set completeopt=menu,menuone,noselect


""" SPACES & TABS CONFIGURATION
    set tabstop=4                                                    " number of visual spaces per TAB
    set softtabstop=0                                                " Remove all spaces that comes from pressing a tab button
    set expandtab                                                    " Replace Tab with whitespace
    set shiftwidth=4
    set noshiftround
    set smarttab
    set showmode                                                     " Last line


""" FOLDING
    set foldenable                                                   " Enable Folding
    set foldlevelstart=15                                            " Open most fold by default
    set foldnestmax=20                                               " Maximum nested fold
    set foldmethod=indent                                            " Fold based on indent level


""" CURSOR MOTION
    set scrolloff=8                                                  " The number of lines display above and below the cursor
    set backspace=indent,eol,start                                   " The behavior of pressing the backspace key
    set cursorline                                                   " Display horizontal line of current line


" OTHERS
    set hidden                                                       " Allow hidden buffers
    set ttyfast                                                      " Speed up scrolling in Vim
    set laststatus=2                                                 " Status bar
    set incsearch                                                    " Search as characters are entered
    set hlsearch                                                     " Highlight matches the search
    set ignorecase
    set noswapfile
    set nobackup
    set undodir=$HOME/.local/share/nvim/undodir
    set undofile
    set updatetime=50
    set spell                                                        " Enable spell checking
    set spelllang=en_us                                              " Specify the languages want to be checked (comma separate)
    set autoread
    set history=200
    set path+=**
    set clipboard^=unnamed,unnamedplus


""" Visualize tabs and newlines
    set listchars=tab:▸\ ,eol:↲,space:·,trail:·


""" Key Mapping
    " SEARCHING
    nnoremap <silent> <ESC> :noh<CR>

    " VISUALIZE TABS AND NEWLINES
    noremap <silent> <F12> <cmd>set list!<CR>
    inoremap <silent> <F12> <cmd>set list!<CR>
    nnoremap <silent> <leader><Right> <cmd>vertical resize +10<CR>
    nnoremap <silent> <leader><Left> <cmd>vertical resize -10<CR>
    nnoremap <silent> <leader><Up> <cmd>resize -10<CR>
    nnoremap <silent> <leader><Down> <cmd>resize +10<CR>

    " PROJECT STRUCTURE
    nnoremap <silent> <leader>+ <cmd>foldopen<CR>
    nnoremap <silent> <leader>- <cmd>foldclose<CR>
    nnoremap <silent> <F1> <cmd>TagbarToggle<CR>

    " OTHERS
    nnoremap <silent> <leader>o O<ESC>j


""" Specific Command

    " List of functions
    fun! TrimWhiteSpace()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
    endfun

    " Apply all files
    augroup TRIM_WHITE_SPACE_ON_SAVE
        " Delete all previous listener (of this group) to prevent the repetitive execution
        " then register a new BufWritePre
        autocmd!
        autocmd BufWritePre * silent :call TrimWhiteSpace()
    augroup END

    " Config files
    autocmd BufReadPost,BufNewFile * set cursorcolumn
