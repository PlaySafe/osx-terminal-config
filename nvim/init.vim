filetype off                              " Helps force plugins to load correctly when it is turned back on below
filetype plugin on                        " For plugins to load correctly
filetype indent on
syntax on                                 " Turn on syntax highlighting


""" Load plugins here (pathogen or bundle)
    call plug#begin()

        """ Main plugin for working
        Plug 'scrooloose/nerdtree'           " Display folder in tree structure
        "Plug 'valloric/youcompleteme'       " Code completion engine
        "Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }  "Specific plugin for golang file (.go)
        "Plug 'neoclide/coc-java'             " Intellisense for Java
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'neovim/nvim-lspconfig'
        Plug 'hrsh7th/nvim-cmp'
        Plug 'hrsh7th/cmp-nvim-lsp'
        "Plug 'saadparwaiz1/cmp_luasnip'

        """ File searching Plugins
        Plug 'nvim-lua/plenary.nvim'         " Mandatory plugin for telescope (Required by Telescope & Harpoon)
        Plug 'nvim-telescope/telescope.nvim' " Fuzzy Search File
        Plug 'nvim-lua/popup.nvim'           " Required by Harpoon
        Plug 'ThePrimeagen/harpoon'          " Shortcut to specific file and line

        """ Cosmetic
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Language Syntax Highlight
        Plug 'nvim-treesitter/nvim-treesitter-context'               " Sticky the function name at the top when scroll
        Plug 'flazz/vim-colorschemes'        " Color highlight theme
        Plug 'vim-airline/vim-airline'       " Status line at the bottom
        Plug 'ryanoasis/vim-devicons'        " Display the icon (should be loaded at last)
    call plug#end()


""" Plugin Config
    let mapleader=" "                         " Leader is a comma
    let NERDTreeMapActivateNode='<space>'
    let NERDTreeShowHidden=1
    let NERDTreeAutoDeleteBuffer=1
    let NERDTreeQuitOnOpen=1
    let NERDTreeMinimalUI=1
    let NERDTreeDirArrows=1

""" Syntax highlighting
    let g:go_highlight_fields=1
    let g:go_highlight_functions=1
    let g:go_highlight_function_calls=1
    let g:go_highlight_extra_types=1
    let g:go_highlight_operators=1
    let g:completion_matching_strategy_list=['exact', 'substring', 'fuzzy']


    " Auto formatting and importing
    let g:go_fmt_autosave=1
    let g:go_fmt_command="goimports"


    " Status line types/signatures
    let g:go_auto_type_info=1
    let g:go_doc_popup_window=1


""" Highlight
    hi Search ctermbg=DarkGrey
    hi Search ctermfg=Blue
    hi SpellCap ctermfg=235 guifg=grey70
    hi SpellBad ctermfg=235 guifg=grey70


""" Color scheme (terminal)
    colorscheme Monokai


""" Set Style """
    set nocompatible                          " Set compatible with Vim only
    set autoindent                            " Enable automatic indentation
    set smartindent
    set modelines=0                           " Security Config : Disabled the modeline


""" UI CONFIGURATION
    set number relativenumber                 " Show line numbers
    set ruler                                 " Show file stats
    set showcmd                               " Show command in bottom bar
    set cursorline                            " Highlight current line
    set wildmenu                              " Visual autocomplete for command menu
    set showmatch                             " Highlight matching [{()}]
    set visualbell                            " Blink cursor on error instead of beeping (grr)
    set encoding=utf-8
    set nowrap
    set textwidth=120
    set formatoptions=tcqrn1
    set guifont=Font_Awesome_6_Brands:h11


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
    set scrolloff=3                           " The number of lines display above and below the cursor
    set backspace=indent,eol,start            " The behavior of pressing the backspace key


" OTHERS
    set hidden                                " Allow hidden buffers
    set ttyfast                               " Speed up scrolling in Vim
    set laststatus=2                          " Status bar
    set incsearch                             " Search as characters are entered
    set hlsearch                              " Highlight matches the search
    set ignorecase
    set smartcase
    set spell
    set spelllang=en_us
    set autoread
    set history=200
    set path+=**


""" Visualize tabs and newlines
    set listchars=tab:▸\ ,eol:↲,space:·,trail:·



""" Key Mapping
    " TAB / REVERSE TAB
    "noremap <Tab> >>
    "nnoremap <S-Tab> <<

    " SEARCHING
    nnoremap / /\v
    vnoremap / /\v
    nnoremap ? ?\v
    vnoremap ? ?\v
    nnoremap <silent> <ESC> :nohl<CR>
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

    " PROJECT STRUCTURE
    nnoremap <silent> <leader>. <cmd>NERDTreeToggle<CR>
    nnoremap <silent> <leader>v <cmd>NERDTreeFind<CR>

    " OTHERS
    nnoremap <silent> oo O<ESC>j

    " LSP Config
    nnoremap <leader>vd <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap <leader>vi <cmd>lua vim.lsp.buf.implementation()<CR>
    nnoremap <leader>vsh <cmd>lua vim.lsp.buf.signature_help()<CR>
    nnoremap <leader>vrr <cmd>lua vim.lsp.buf.references()<CR>
    nnoremap <leader>vrn <cmd>lua vim.lsp.buf.rename()<CR>
    nnoremap <leader>vh <cmd>lua vim.lsp.buf.hover()<CR>
    nnoremap <leader>vca <cmd>lua vim.lsp.buf.code_action()<CR>
    nnoremap <leader>vsd <cmd>lua vim.lsp.diagnostic.show_line_diagnostic()<CR>
    nnoremap <leader>vn <cmd>lua vim.lsp.buf.goto_next()<CR>


""" Specific Command

    " Golang
    autocmd BufWritePre * :%s/\s\+$//e
    autocmd FileType go nmap <leader>b <cmd>GoDef<CR>
    autocmd FileType go nmap <S-R> <cmd>GoRename<CR>
    autocmd FileType go source $HOME/.local/share/nvim/snippet/go/go.nvim

    " Java
    autocmd Filetype java source $HOME/.local/share/nvim/snippet/java/java.nvim
