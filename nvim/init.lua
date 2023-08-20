vim.g.mapleader = " "

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.bo.syntax = 'on'

vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Main plugin for working
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'

    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'majutsushi/tagbar'
    use 'jiangmiao/auto-pairs'
    use 'kshenoy/vim-signature'
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'flazz/vim-colorschemes'
    use 'vim-airline/vim-airline'
    use 'ryanoasis/vim-devicons'
    use 'tpope/vim-fugitive'

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'ThePrimeagen/harpoon', requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' } }
    use { 'honza/vim-snippets', requires = { 'SirVer/ultisnips' } }
    use { 'mfussenegger/nvim-jdtls', requires = { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } } }
    use { 'nvim-telescope/telescope-file-browser.nvim', requires = { 'nvim-telescope/telescope.nvim' } }
    use { 'nvim-telescope/telescope-dap.nvim', requires = { 'nvim-telescope/telescope.nvim' } }
    use { 'nvim-telescope/telescope-media-files.nvim', requires = { 'nvim-telescope/telescope.nvim',
        'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' } }
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

vim.cmd [[colorscheme gruvbox]]
require('plugins.nvim-treesitter')
require('plugins.nvim-lspconfig')
require('plugins.nvim-dap')
require('plugins.cmp')
require('plugins.telescope')

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0

--Plugin Config
vim.g.UltiSnipsExpandTrigger = "<C-j>"
vim.g.UltiSnipsJumpForwardTrigger = "<C-j>"
vim.g.UltiSnipsJumpBackwardTrigger = "<C-k>"
vim.g.UltiSnipsEditSplit = "vertical"
vim.g.airline_section_c = "%F"

-- Set Style
vim.g.nocompatible = true
vim.g.vitualedit = "all"
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.modelines = 0


-- UI CONFIGURATION
vim.o.number = true
vim.o.relativenumber = true
vim.o.ruler = true     --Show file stats
vim.o.showcmd = true   --Show command in bottom bar
vim.o.wildmode = 'longest:list:full'
vim.o.wildmenu = true  --Visual autocomplete for command menu
vim.o.showmatch = true --Highlight matching [{()}]
vim.o.encoding = 'utf-8'
vim.o.wrap = false
vim.o.formatoptions = tcqrn1
vim.o.hlsearch = true
vim.o.cmdheight = 1
vim.o.signcolumn = 'yes' --Leave front space for error, +, - sign
vim.o.colorcolumn = 120  --Show the vertical line of nth column
vim.o.completeopt = 'menu,menuone,noselect'


-- SPACES & TABS CONFIGURATION
vim.opt.tabstop = 4      --number of visual spaces per TAB
vim.opt.softtabstop = 0  --Remove all spaces that comes from pressing a tab button
vim.opt.expandtab = true --Replace Tab with whitespace
vim.opt.shiftwidth = 4
vim.opt.shiftround = false
vim.opt.smarttab = true
vim.opt.showmode = true --Last line


-- FOLDING
vim.opt.foldenable = true     --enable folding
vim.opt.foldlevelstart = 15   --Open most fold by default
vim.opt.foldnestmax = 20      --Maximum nested fold
vim.opt.foldmethod = 'indent' --Fold based on indent level


-- CURSOR MOTION
vim.opt.scrolloff = 8                            --The number of lines display above and below the cursor
vim.opt.backspace = { 'indent', 'eol', 'start' } --The behavior of pressing the backspace key
vim.opt.cursorline = true                        --Display horizontal line of current line
vim.opt.cursorcolumn = true                      --Display vertical line of current line



--OTHERS
vim.opt.hidden = true    --Allow hidden buffers
vim.opt.ttyfast = true   --Speed up scrolling in Vim
vim.opt.laststatus = 2   --Status bar
vim.opt.incsearch = true --Search as characters are entered
vim.opt.hlsearch = true  --Highlight matches the search
vim.opt.ignorecase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.local/share/nvim/undodir'
vim.opt.undofile = true
vim.opt.undolevels = 50
vim.opt.updatetime = 500
vim.opt.spell = true --Enable spell checking
vim.opt.spelllang =
'en_us'              --Specify the languages want to be checked (comma separate)
vim.opt.autoread = true
vim.opt.history = 200
vim.opt.path = vim.opt.path + '**'
vim.opt.clipboard = vim.opt.clipboard ^ { 'unnamed', 'unnamedplus' }



-- Visualize tabs and newlines
vim.opt.listchars = { tab = '▸ ', eol = '↲', space = '·', trail = '·' }


-- Key Mapping
--Vim Tab
vim.keymap.set('n', '<leader><Tab>', 'gt')
vim.keymap.set('n', '<leader><S-Tab>', 'gT')

local noremap = { noremap = true, silent = true };
--SEARCHING
vim.keymap.set('n', '<ESC>', [[<cmd>noh<CR>]], noremap)
vim.keymap.set('n', '<leader>/', [[<cmd>Telescope file_browser<CR>]], noremap)
vim.keymap.set('n', '<leader>.', [[<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>]], noremap)
vim.keymap.set('n', '<leader>,', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], noremap)
vim.keymap.set('n', '<leader>\'', [[<cmd>Telescope media_files<CR>]], noremap)
vim.keymap.set('n', '<leader>F', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], noremap)
vim.keymap.set('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], noremap)
vim.keymap.set('n', '<leader>?', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], noremap)
vim.keymap.set('n', '<leader>m', [[<cmd>lua require('telescope.builtin').marks()<CR>]], noremap)
vim.keymap.set('n', '<leader>j', [[<cmd>lua require('telescope.builtin').jumplist()<CR>]], noremap)
vim.keymap.set('n', '<leader>R', [[<cmd>lua require('telescope.builtin').registers()<CR>]], noremap)
vim.keymap.set('n', '<leader>;', [[<cmd>lua require('telescope.builtin').commands()<CR>]], noremap)
vim.keymap.set('n', '<leader>t', [[<cmd>lua require("harpoon.mark").add_file()<CR>]], noremap)
vim.keymap.set('n', '<leader>e', [[<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>]], noremap)

--VISUALIZE TABS AND NEWLINES
vim.keymap.set('n', '<F12>', [[<cmd>set list!<CR>]], noremap)
vim.keymap.set('i', '<F12>', [[<cmd>set list!<CR>]], noremap)
vim.keymap.set('n', '<leader><Up>', '[[<cmd>resize -10<CR>]]', noremap)
vim.keymap.set('n', '<leader><Down>', '[[<cmd>resize +10<CR>]]', noremap)
vim.keymap.set('n', '<leader><Left>', '[[<cmd>vertical resize -10<CR>]]', noremap)
vim.keymap.set('n', '<leader><Right>', '[[<cmd>vertical resize +10<CR>]]', noremap)

--PROJECT STRUCTURE
vim.keymap.set('n', '<leader>+', '<cmd>foldopen<CR>', noremap)
vim.keymap.set('n', '<leader>-', '<cmd>foldclose<CR>', noremap)
vim.keymap.set('n', '<F1>', '<cmd>TagbarToggle<CR>', noremap)

--OTHERS
vim.keymap.set('n', '<leader>o', 'O<ESC>j', noremap)
vim.keymap.set('n', '<leader>w', [[<cmd>w <CR> bd<CR>]], noremap)
vim.keymap.set('n', '<C-j>', '<C-w>j', noremap)
vim.keymap.set('n', '<C-h>', '<C-w>h', noremap)
vim.keymap.set('n', '<C-k>', '<C-w>k', noremap)
vim.keymap.set('n', '<C-l>', '<C-w>l', noremap)

--DAP (Debug Adapter Protocol)
vim.keymap.set('n', '<leader>dD', [[<cmd>lua require('dap').clear_breakpoints()<CR>]], noremap)
vim.keymap.set('n', '<leader>db', [[<cmd>lua require('dap').toggle_breakpoint()<CR>]], noremap)
vim.keymap.set('n', '<leader>dc', [[<cmd>lua require('dap').set_breakpoint(vim.fn.input("Condition: "))]], noremap)
vim.keymap.set('n', '<leader>dI',
    [[<cmd>lua require('dap').ui.variables.hover(function() return vim.fn.expand("<cexpr>") end)]], noremap)
vim.keymap.set('n', '<leader>di', [[<cmd>lua require('dap').step_into()<CR>]], noremap)
vim.keymap.set('n', '<leader>do', [[<cmd>lua require('dap').step_over()<CR>]], noremap)

vim.keymap.set('n', '<leader>d/', [[<cmd>lua require('dap').repl.toggle()<CR>]], noremap)
vim.keymap.set('n', '<leader>d^', [[<cmd>lua require('dap').repl.run_first()<CR>]], noremap)
vim.keymap.set('n', '<leader>d$', [[<cmd>lua require('dap').repl.run_last()<CR>]], noremap)
vim.keymap.set('n', '<leader>dn', [[<cmd>lua require('dap').continue()<CR>]], noremap)
vim.keymap.set("n", "<leader>dx", [[<cmd>lua require('dap').disconnect(); require('dap').close()<CR>]], noremap)

vim.keymap.set('n', '<leader>dv', [[<cmd>lua require('telescope').extensions.dap.variables()<CR>]], noremap)
vim.keymap.set('n', '<leader>dB', [[<cmd>lua require('telescope').extensions.dap.list_breakpoints()<CR>]], noremap)
vim.keymap.set('n', '<leader>d?', [[<cmd>lua require('telescope').extensions.dap.configurations()<CR>]], noremap)
vim.keymap.set('n', '<leader>d:', [[<cmd>lua require('telescope').extensions.dap.commands()<CR>]], noremap)
vim.keymap.set('n', '<leader>df', [[<cmd>lua require('telescope').extensions.dap.frames()<CR>]], noremap)


-- Specific Command
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = vim.api.nvim_create_augroup('TRIM_WHITE_SPACE_ON_SAVE', {}),
    pattern = '*',
    command = [[%s/\s\+$//e]],
})
