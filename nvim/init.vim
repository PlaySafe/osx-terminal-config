filetype off                                                         " Helps force plugins to load correctly when it is turned back on below
filetype plugin on                                                   " For plugins to load correctly
filetype indent on
syntax on                                                            " Turn on syntax highlighting


""" Load plugins here (pathogen or bundle)
    call plug#begin()

        """ Main plugin for working
        Plug 'neovim/nvim-lspconfig' | Plug 'williamboman/mason.nvim' | Plug 'williamboman/mason-lspconfig.nvim' " LSP for languages
        Plug 'hrsh7th/nvim-cmp' | Plug 'hrsh7th/cmp-nvim-lsp' | Plug 'hrsh7th/cmp-buffer' | Plug 'hrsh7th/cmp-path' | Plug 'hrsh7th/cmp-cmdline' " Intellisense
        Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'          " Code snippets
        Plug 'tpope/vim-commentary'                                  " Normal mode commenting (gcc & gc)
        Plug 'mfussenegger/nvim-dap' | Plug 'rcarriga/nvim-dap-ui'   " Debug Adapter Protocol
        Plug 'tpope/vim-surround'                                    " Surrounding parenthesis, brackets, etc
        Plug 'majutsushi/tagbar'                                     " Overview structure
        Plug 'jiangmiao/auto-pairs'                                  " Auto close bracket added

        """ File searching Plugins
        Plug 'nvim-lua/plenary.nvim'                                 " Telescope & Harpoon prerequisite
        Plug 'nvim-telescope/telescope.nvim' | Plug 'nvim-telescope/telescope-file-browser.nvim' " Fuzzy Search File
        Plug 'nvim-telescope/telescope-dap.nvim'
        Plug 'nvim-lua/popup.nvim'                                   " Harpoon prerequisite
        Plug 'ThePrimeagen/harpoon'                                  " Shortcut to specific file and line
        Plug 'kshenoy/vim-signature'                                 " Show mark key in front of line

        """ Cosmetic
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Language Syntax Highlight
        Plug 'nvim-treesitter/nvim-treesitter-context'               " Sticky the function name at the top when scroll
        Plug 'flazz/vim-colorschemes'                                " Color highlight theme
        Plug 'vim-airline/vim-airline'                               " Status line at the bottom
        Plug 'ryanoasis/vim-devicons'                                " Display the icon (should be loaded at last)

        """ Others
        " Plug 'lervag/vimtex'                                         " syntax plugin for LaText files (https://castel.dev/post/lecture-notes-1/)
    call plug#end()

   :luafile $HOME/.config/nvim/lua/plugins/nvim-treesitter.lua
   :luafile $HOME/.config/nvim/lua/plugins/nvim-lspconfig.lua
   :luafile $HOME/.config/nvim/lua/plugins/nvim-dap.lua
   :luafile $HOME/.config/nvim/lua/plugins/cmp.lua
   :luafile $HOME/.config/nvim/lua/plugins/telescope.lua

    " Plugin Config
    let mapleader=" "                                                " Leader is a space
    let g:UltiSnipsExpandTrigger="<C-j>"
    let g:UltiSnipsJumpForwardTrigger="<C-j>"
    let g:UltiSnipsJumpBackwardTrigger="<C-k>"
    let g:UltiSnipsEditSplit="vertical"

""" Color scheme (terminal)
    colorscheme gruvbox


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
    " Vim Tab
    nnoremap <silent> <leader><Tab> gt
    nnoremap <silent> <leader><S-Tab> gT

    " SEARCHING
    nnoremap <silent> <ESC> :noh<CR>
    nnoremap <silent> <leader>. <cmd>Telescope file_browser<CR>
    nnoremap <silent> <leader>, <cmd>Telescope find_files<CR>
    nnoremap <silent> <leader>F <cmd>Telescope live_grep<CR>
    nnoremap <silent> <leader>fb <cmd>Telescope buffers<CR>
    nnoremap <silent> <leader>? <cmd>Telescope help_tags<CR>
    nnoremap <silent> <leader>m <cmd>Telescope marks<CR>
    nnoremap <silent> <leader>j <cmd>Telescope jumplist<CR>
    nnoremap <silent> <leader>R <cmd>Telescope registers<CR>
    nnoremap <silent> <leader>t <cmd>lua require("harpoon.mark").add_file()<CR>
    nnoremap <silent> <leader>e <cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>
    nnoremap <silent> <leader>n <cmd>lua require("harpoon.ui").nav_next()<CR>
    nnoremap <silent> <leader>N <cmd>lua require("harpoon.ui").nav_prev()<CR>

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
    nnoremap <leader>w <cmd>bd<CR>                                   " Close current buffer (Close windows)

    " LSP Config
    nnoremap <silent> <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap <silent> <leader>gi <cmd>lua vim.lsp.buf.implementation()<CR>
    nnoremap <silent> <leader>gsh <cmd>lua vim.lsp.buf.signature_help()<CR>
    nnoremap <silent> <leader>grr <cmd>lua vim.lsp.buf.references()<CR>
    nnoremap <silent> <leader>grn <cmd>lua vim.lsp.buf.rename()<CR>
    nnoremap <silent> <leader>gh <cmd>lua vim.lsp.buf.hover()<CR>
    nnoremap <silent> <leader>gca <cmd>lua vim.lsp.buf.code_action()<CR>
    nnoremap <silent> <leader>gsd <cmd>lua vim.lsp.diagnostic.show_line_diagnostic()<CR>
    nnoremap <silent> <leader>gn <cmd>lua vim.lsp.buf.goto_next()<CR>

    " DAP (Debug Adapter Protocol)
    nnoremap <silent> <leader>dD <cmd>lua require('dap').clear_breakpoints()<CR>
    nnoremap <silent> <leader>db <cmd>lua require('dap').toggle_breakpoint()<CR>
    nnoremap <silent> <leader>dc <cmd>lua require('dap').set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>
    nnoremap <silent> <leader>dI <cmd>lua require('dap.ui.variables').hover(function() return vim.fn.expand("<cexpr>") end)<CR>
    nnoremap <silent> <leader>di <cmd>lua require('dap').step_into()<CR>
    nnoremap <silent> <leader>do <cmd>lua require('dap').step_over()<CR>
    nnoremap <silent> <leader>d/ <cmd>lua require('dap').repl.toggle()<CR>
    nnoremap <silent> <leader>d^ <cmd>lua require('dap').repl.run_first()<CR>
    nnoremap <silent> <leader>d$ <cmd>lua require('dap').repl.run_last()<CR>
    nnoremap <silent> <leader>dn <cmd>lua require('dap').continue()<CR>
    nnoremap <silent> <leader>dv <cmd>lua require"telescope".extensions.dap.variables{}<CR>
    nnoremap <silent> <leader>dB <cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>
    nnoremap <silent> <leader>d? <cmd>lua require"telescope".extensions.dap.configurations{}<CR>
    nnoremap <silent> <leader>d: <cmd>lua require"telescope".extensions.dap.commands{}<CR>
    nnoremap <silent> <leader>df <cmd>lua require"telescope".extensions.dap.frames{}<CR>

    " Command execution (Run from file)
    nnoremap <leader>x ^"xY:!<space><C-r>x<CR>
    nnoremap <leader>X ^"xY:$read!<space><C-r>x<CR>
    vnoremap <leader>x "xY:!<space><C-r>x<CR>
    vnoremap <leader>X "xY:$read!<space><C-r>x<CR>


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

    " Golang
    augroup FORMAT_GOLANG_CODE
        " Delete all previous listener (of this group) to prevent the repetitive execution
        " then execute the goimports command
        " The gofmt will be triggered automatically by goimports, so we don't need to run it again
        autocmd!
        autocmd BufWritePre *.go silent :%!gofmt
        autocmd BufWritePre *.go lua vim.lsp.buf.code_action({ source = { organizeImports = true } })
    augroup END

    " Debug
    autocmd FileType dap-repl lua require('dap.ext.autocompl').attach()

    " Config files
    autocmd BufReadPost,BufNewFile * set cursorcolumn
