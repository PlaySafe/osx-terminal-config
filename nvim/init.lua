vim.g.mapleader = " "
vim.cmd [[colorscheme gruvbox]]
require('plugins.nvim-treesitter')
require('plugins.nvim-lspconfig')
local dap = require('plugins.nvim-dap')
require('plugins.cmp')
local telescope = require('plugins.telescope')

--vim.bo.filetype = { 'detection off', 'plugin on', 'indent on' }
--vim.bo.filetype = 'detection off'
--vim.bo.filetype = 'plugin on'
-- vim.bo.filetype = 'indent on'

vim.bo.syntax = 'on'

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

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

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'ThePrimeagen/harpoon', requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' }}
    use { 'honza/vim-snippets', requires = { 'SirVer/ultisnips' }}
    use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' }}
    use { 'nvim-telescope/telescope-file-browser.nvim', requires = { 'nvim-telescope/telescope.nvim' }}
    use { 'nvim-telescope/telescope-dap.nvim', requires ={ 'nvim-telescope/telescope.nvim' }}
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)


--Plugin Config
vim.g. UltiSnipsExpandTrigger = "<C-j>"
vim.g.UltiSnipsJumpForwardTrigger = "<C-j>"
vim.g.UltiSnipsJumpBackwardTrigger = "<C-k>"
vim.g.UltiSnipsEditSplit = "vertical"

-- Set Style
    vim.g.nocompatible = true
    vim.o.autoindent = true
    vim.o.smartindent = true
    vim.o.modelines = 0


-- UI CONFIGURATION
    vim.o.number = true
    vim.o.relativenumber = true
    vim.o.ruler = true                                             --Show file stats
    vim.o.showcmd = true                                           --Show command in bottom bar
    vim.o.wildmode = 'longest:list:full'
    vim.o.wildmenu = true                                          --Visual autocomplete for command menu
    vim.o.showmatch = true                                         --Highlight matching [{()}]
    vim.o.encoding = 'utf-8'
    vim.o.wrap = false
    vim.o.formatoptions = tcqrn1
    vim.o.hlsearch = true
    vim.o.cmdheight = 1
    vim.o.signcolumn = 'yes'                                       --Leave front space for error, +, - sign
    vim.o.colorcolumn = 120                                        --Show the vertical line of nth column
    vim.o.completeopt = 'menu,menuone,noselect'


-- SPACES & TABS CONFIGURATION
    vim.opt.tabstop = 4                                              --number of visual spaces per TAB
    vim.opt.softtabstop = 0                                          --Remove all spaces that comes from pressing a tab button
    vim.opt.expandtab = true                                         --Replace Tab with whitespace
    vim.opt.shiftwidth = 4
    vim.opt.shiftround = false
    vim.opt.smarttab = true
    vim.opt.showmode = true                                          --Last line


-- FOLDING
    vim.opt.foldenable = true                                        --enable folding
    vim.opt.foldlevelstart = 15                                      --Open most fold by default
    vim.opt.foldnestmax = 20                                         --Maximum nested fold
    vim.opt.foldmethod = 'indent'                                    --Fold based on indent level


-- CURSOR MOTION
    vim.opt.scrolloff = 8                                            --The number of lines display above and below the cursor
    vim.opt.backspace = { 'indent', 'eol', 'start' }                 --The behavior of pressing the backspace key
    vim.opt.cursorline = true                                        --Display horizontal line of current line


--OTHERS
    vim.opt.hidden = true                                            --Allow hidden buffers
    vim.opt.ttyfast = true                                           --Speed up scrolling in Vim
    vim.opt.laststatus = 2                                           --Status bar
    vim.opt.incsearch = true                                         --Search as characters are entered
    vim.opt.hlsearch = true                                          --Highlight matches the search
    vim.opt.ignorecase = true
    vim.opt.swapfile = false
    vim.opt.backup = false
    vim.opt.undodir = os.getenv('HOME') .. '/.local/share/nvim/undodir'
    vim.opt.undofile = true
    vim.opt.updatetime = 50
    vim.opt.spell = true                                             --Enable spell checking
    vim.opt.spelllang = 'en_us'                                      --Specify the languages want to be checked (comma separate)
    vim.opt.autoread = true
    vim.opt.history = 200
    vim.opt.path = vim.opt.path + '**'
    vim.opt.clipboard = vim.opt.clipboard ^ { 'unnamed', 'unnamedplus' }


-- Visualize tabs and newlines
    vim.opt.listchars = { tab='▸ ', eol='↲', space='·', trail='·' }


-- Key Mapping
    --Vim Tab
    vim.keymap.set('n', '<leader><Tab>',   'gt')
    vim.keymap.set('n', '<leader><S-Tab>', 'gT')

    --SEARCHING
    vim.keymap.set('n', '<ESC>',      '<cmd>noh<CR>',                    nil)
    vim.keymap.set('n', '<leader>.',  '<cmd>Telescope file_browser<CR>', nil)
    vim.keymap.set('n', '<leader>,',  '<cmd>Telescope find_files<CR>',   nil)
    vim.keymap.set('n', '<leader>F',  '<cmd>Telescope live_grep<CR>',    nil)
    vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>',      nil)
    vim.keymap.set('n', '<leader>?',  '<cmd>Telescope help_tags<CR>',    nil)
    vim.keymap.set('n', '<leader>m',  '<cmd>Telescope marks<CR>',        nil)
    vim.keymap.set('n', '<leader>j',  '<cmd>Telescope jumplist<CR>',     nil)
    vim.keymap.set('n', '<leader>R',  '<cmd>Telescope registers<CR>',    nil)
    vim.keymap.set('n', '<leader>t',  function() require("harpoon.mark").add_file() end, nil)
    vim.keymap.set('n', '<leader>e',  function() require("harpoon.ui").toggle_quick_menu() end, nil)
    vim.keymap.set('n', '<leader>n',  function() require("harpoon.ui").nav_next() end, nil)
    vim.keymap.set('n', '<leader>N',  function() require("harpoon.ui").nav_prev() end, nil)

    --VISUALIZE TABS AND NEWLINES
    vim.keymap.set('n', '<F12>',           '<cmd>set list!<CR>',           nil)
    vim.keymap.set('i', '<F12>',           '<cmd>set list!<CR>',           nil)
    vim.keymap.set('n', '<leader><Up>',    '<cmd>resize -10<CR>',          nil)
    vim.keymap.set('n', '<leader><Down>',  '<cmd>resize +10<CR>',          nil)
    vim.keymap.set('n', '<leader><Left>',  '<cmd>vertical resize -10<CR>', nil)
    vim.keymap.set('n', '<leader><Right>', '<cmd>vertical resize +10<CR>', nil)

    --PROJECT STRUCTURE
    vim.keymap.set('n', '<leader>+', '<cmd>foldopen<CR>',     nil)
    vim.keymap.set('n', '<leader>-', '<cmd>foldclose<CR>',    nil)
    vim.keymap.set('n', '<F1>',      '<cmd>TagbarToggle<CR>', nil)

    --OTHERS
    vim.keymap.set('n', '<leader>o', 'O<ESC>j',     nil)
    vim.keymap.set('n', '<leader>w', '<cmd>bd<CR>', nil)

    --LSP Config
    vim.keymap.set('n', '<leader>gd',  function() vim.lsp.buf.definition() end,                  nil)
    vim.keymap.set('n', '<leader>gi',  function() vim.lsp.buf.implementation() end,              nil)
    vim.keymap.set('n', '<leader>gsh', function() vim.lsp.buf.signature_help() end,              nil)
    vim.keymap.set('n', '<leader>grr', function() vim.lsp.buf.references() end,                  nil)
    vim.keymap.set('n', '<leader>grn', function() vim.lsp.buf.rename() end,                      nil)
    vim.keymap.set('n', '<leader>gh',  function() vim.lsp.buf.hover() end,                       nil)
    vim.keymap.set('n', '<leader>gca', function() vim.lsp.buf.code_action() end,                 nil)
    vim.keymap.set('n', '<leader>gsd', function() vim.lsp.diagnostic.show_line_diagnostic() end, nil)
    vim.keymap.set('n', '<leader>gn',  function() vim.lsp.buf.goto_next() end,                   nil)

    --DAP (Debug Adapter Protocol)
    vim.keymap.set('n', '<leader>dD', function() dap.clear_breakpoints() end,                                                nil)
    vim.keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end,                                                nil)
    vim.keymap.set('n', '<leader>dc', function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,             nil)
    vim.keymap.set('n', '<leader>dI', function() dap.ui.variables.hover(function() return vim.fn.expand("<cexpr>") end) end, nil)
    vim.keymap.set('n', '<leader>di', function() dap.step_into() end,                                                        nil)
    vim.keymap.set('n', '<leader>do', function() dap.step_over() end,                                                        nil)

    vim.keymap.set('n', '<leader>d/', function() dap.repl.toggle() end,                           nil)
    vim.keymap.set('n', '<leader>d^', function() dap.repl.run_first() end,                        nil)
    vim.keymap.set('n', '<leader>d$', function() dap.repl.run_last() end,                         nil)
    vim.keymap.set('n', '<leader>dn', function() dap.continue() end,                              nil)
    vim.keymap.set('n', '<leader>dv', function() telescope.extensions.dap.variables{} end,        nil)
    vim.keymap.set('n', '<leader>dB', function() telescope.extensions.dap.list_breakpoints{} end, nil)

    vim.keymap.set('n', '<leader>d?', function() telescope.extensions.dap.configurations{} end,   nil)
    vim.keymap.set('n', '<leader>d:', function() telescope.extensions.dap.commands{} end,         nil)
    vim.keymap.set('n', '<leader>df', function() telescope.extensions.dap.frames{} end,           nil)


-- Specific Command

vim.api.nvim_create_autocmd({"BufWritePre"}, {
    group = vim.api.nvim_create_augroup('TRIM_WHITE_SPACE_ON_SAVE', {}),
    pattern = '*',
    command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd({"BufWritePre"}, {
    group = vim.api.nvim_create_augroup('FORMAT_GOLANG_CODE', {}),
    pattern = '*.go',
    callback = function()
        vim.cmd [[%!gofmt]]
        vim.lsp.buf.code_action({ source = { organizeImports = true } })
    end
})

vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = 'dap-repl',
    callback = function()
        require('dap.ext.autocompl').attach()
    end
})

vim.api.nvim_create_autocmd({"BufReadPost", "BufNewFile"}, {
    pattern = '*',
    callback = function()
        vim.opt.cursorcolumn = true
    end
})
