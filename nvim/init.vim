filetype off                              " Helps force plugins to load correctly when it is turned back on below
filetype plugin on                        " For plugins to load correctly
filetype indent on
syntax on                                 " Turn on syntax highlighting


""" Load plugins here (pathogen or bundle)
    call plug#begin()

        """ Main plugin for working
        Plug 'scrooloose/nerdtree'                                   " Display folder in tree structure
        Plug 'neovim/nvim-lspconfig'                                 " LSP for languages
        Plug 'williamboman/nvim-lsp-installer'                       " Provide LSP command, easy to install
        Plug 'hrsh7th/nvim-cmp'                                      " Intellisense
        Plug 'hrsh7th/cmp-nvim-lsp'
        Plug 'hrsh7th/cmp-buffer'
        Plug 'hrsh7th/cmp-path'
        Plug 'hrsh7th/cmp-cmdline'
        Plug 'hrsh7th/cmp-vsnip'
        " Plug 'hrsh7th/vim-vsnip'
        Plug 'tpope/vim-commentary'                                  " Normal mode commenting (gcc & gc)

        """ File searching Plugins
        Plug 'nvim-lua/plenary.nvim'                                 " Telescope & Harpoon prerequisite
        Plug 'nvim-telescope/telescope.nvim'                         " Fuzzy Search File
        Plug 'nvim-lua/popup.nvim'                                   " Harpoon prerequisite
        Plug 'ThePrimeagen/harpoon'                                  " Shortcut to specific file and line

        """ Cosmetic
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Language Syntax Highlight
        Plug 'nvim-treesitter/nvim-treesitter-context'               " Sticky the function name at the top when scroll
        Plug 'flazz/vim-colorschemes'                                " Color highlight theme
        Plug 'vim-airline/vim-airline'                               " Status line at the bottom
        Plug 'ryanoasis/vim-devicons'                                " Display the icon (should be loaded at last)

    call plug#end()

   :luafile $HOME/.config/nvim/lua/plugins/nvim-treesitter.lua
   :luafile $HOME/.config/nvim/lua/plugins/nvim-lspconfig.lua
   :luafile $HOME/.config/nvim/lua/plugins/cmp.lua

    " Plugin Config
    let mapleader=" "                         " Leader is a comma
    let NERDTreeMapActivateNode='<space>'
    let NERDTreeShowHidden=1
    let NERDTreeAutoDeleteBuffer=1
    let NERDTreeQuitOnOpen=1
    let NERDTreeMinimalUI=1
    let NERDTreeDirArrows=1


""" Color scheme (terminal)
    colorscheme gruvbox


""" Set Style """
    set nocompatible                          " Set compatible with Vim only
    set autoindent                            " Enable automatic indentation
    set smartindent
    set modelines=0                           " Security Config : Disabled the modeline


""" UI CONFIGURATION
    set number relativenumber                 " Show line numbers
    set ruler                                 " Show file stats
    set showcmd                               " Show command in bottom bar
    set wildmode=longest,list,full
    set wildmenu                              " Visual autocomplete for command menu
    set showmatch                             " Highlight matching [{()}]
    set noerrorbells
    set encoding=utf-8
    set nowrap
    set formatoptions=tcqrn1
    set nohlsearch
    " set cmdheight=2
    set signcolumn=yes                        " Leave front space for error, +, - sign
    set colorcolumn=120                       " Show the vertical line of nth column
    set completeopt=menu,menuone,noselect


""" SPACES & TABS CONFIGURATION
    set tabstop=4                             " number of visual spaces per TAB
    set softtabstop=0                         " Remove all spaces that comes from pressing a tab button
    set expandtab                             " Replace Tab with whitespace
    set shiftwidth=4
    set noshiftround
    set smarttab
    set showmode                              " Last line


""" FOLDING
    set foldenable                            " Enable Folding
    set foldlevelstart=15                     " Open most fold by default
    set foldnestmax=20                        " Maximum nested fold
    set foldmethod=indent                     " Fold based on indent level


""" CURSOR MOTION
    set scrolloff=8                           " The number of lines display above and below the cursor
    set backspace=indent,eol,start            " The behavior of pressing the backspace key


" OTHERS
    set hidden                                " Allow hidden buffers
    set ttyfast                               " Speed up scrolling in Vim
    set laststatus=2                          " Status bar
    set incsearch                             " Search as characters are entered
    set hlsearch                              " Highlight matches the search
    set ignorecase
    set noswapfile
    set nobackup
    set undodir=$HOME/.local/share/nvim/undodir
    set undofile
    set updatetime=50
    set spell
    set spelllang=en_us
    set autoread
    set history=200
    set path+=**


""" Visualize tabs and newlines
    set listchars=tab:▸\ ,eol:↲,space:·,trail:·


""" Key Mapping
    " TAB / REVERSE TAB

    " temporary disable due to CTRL-I and TAB produces exactly the same signal
    " I need to use CTRL-I and CTRL-O to jump between files
    " nnoremap <c-i> <Tab>
    " nnoremap <Tab> >>
    " nnoremap <S-Tab> <<
    nnoremap <leader><Tab> gt
    nnoremap <leader><S-Tab> gT

    " SEARCHING
    nnoremap <silent> <ESC> :noh<CR>
    nnoremap <silent> <leader>ps <cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for >")})<CR>
    nnoremap <silent> <leader>ff <cmd>Telescope find_files prompt_prefix=🔍<CR>
    nnoremap <silent> <leader>fg <cmd>Telescope live_grep prompt_prefix=🔍<CR>
    nnoremap <silent> <leader>fb <cmd>Telescope buffers prompt_prefix=🔍<CR>
    nnoremap <silent> <leader>fh <cmd>Telescope help_tags prompt_prefix=🔍<CR>
    nnoremap <silent> <leader>t <cmd>lua require("harpoon.mark").add_file()<CR>
    nnoremap <silent> <leader>e <cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>
    nnoremap <silent> <leader>r <cmd>lua require("harpoon.ui").nav_next()<CR>
    nnoremap <silent> <leader>w <cmd>lua require("harpoon.ui").nav_prev()<CR>

    " VISUALIZE TABS AND NEWLINES
    nnoremap <silent> <F12> <cmd>set list!<CR>
    inoremap <silent> <F12> <cmd>set list!<CR>
    vnoremap <silent> <F12> <cmd>set list!<CR>
    nnoremap <silent> <c-h> <c-w>h
    nnoremap <silent> <c-j> <c-w>j
    nnoremap <silent> <c-k> <c-w>k
    nnoremap <silent> <c-l> <c-w>l

    " PROJECT STRUCTURE
    nnoremap <silent> <leader>. <cmd>NERDTreeToggle<CR>
    nnoremap <silent> <leader>, <cmd>NERDTreeFind<CR>

    " OTHERS
    nnoremap <silent> <leader>o O<ESC>j
    vnoremap J :m '>+1<CR>V                " Line swap forward
    vnoremap K :m '<-2<CR>V                " Swap backward

    " LSP Config
    nnoremap <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap <leader>gi <cmd>lua vim.lsp.buf.implementation()<CR>
    nnoremap <leader>gsh <cmd>lua vim.lsp.buf.signature_help()<CR>
    nnoremap <leader>grr <cmd>lua vim.lsp.buf.references()<CR>
    nnoremap <leader>grn <cmd>lua vim.lsp.buf.rename()<CR>
    nnoremap <leader>gh <cmd>lua vim.lsp.buf.hover()<CR>
    nnoremap <leader>gca <cmd>lua vim.lsp.buf.code_action()<CR>
    nnoremap <leader>gsd <cmd>lua vim.lsp.diagnostic.show_line_diagnostic()<CR>
    nnoremap <leader>gn <cmd>lua vim.lsp.buf.goto_next()<CR>


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
        autocmd BufWritePre * :call TrimWhiteSpace()
    augroup END

    " Golang
    augroup FORMAT_GOLANG_CODE
        " Delete all previous listener (of this group) to prevent the repetitive execution
        " then execute the goimports command
        autocmd!
        autocmd BufWritePre *.go : :%!goimports
    augroup END

    " Java
