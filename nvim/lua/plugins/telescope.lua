local function orientation()
    if vim.fn.winwidth(0) > 120 then
        return 'horizontal'
    else
        return 'vertical'
    end
end

local default_config = {
    hidden = true,
    layout_strategy = orientation(),
    layout_config = {
        vertical = {
            width = 0.9,
            height = 0.9,
            preview_cutoff = 40,
            prompt_position = "bottom",
        },
        horizontal = {
            height = 0.9,
            preview_cutoff = 120,
            prompt_position = "top",
            width = 0.9
        }
    }
}

require('telescope').setup {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        prompt_prefix = " 🔍 ",
        selection_caret = "  ",
        path_display = {
            shorten = {
                len = 2,
                exclude = {-2, -1}
            }
        },
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key"
            }
        },
        file_ignore_patterns = {
            'node_modules/',
            'target/',
            '.git/',
            '.idea',
            '.settings',
        }
    },
    pickers = {
        autocommands = default_config,
        buffers = default_config,
        builtin = default_config,
        colorscheme = default_config,
        command_history = default_config,
        commands = default_config,
        current_buffer_fuzzy_find = default_config,
        current_buffer_tags = default_config,
        diagnostics = default_config,
        fd = default_config,
        filetypes = default_config,
        find_files = default_config,
        file_browser = default_config,
        git_bcommits = default_config,
        git_branches = default_config,
        git_commits = default_config,
        git_files = default_config,
        git_stash = default_config,
        git_status = default_config,
        grep_string = default_config,
        help_tags = default_config,
        highlights = default_config,
        jumplist = default_config,
        keymaps = default_config,
        live_grep = default_config,
        loclist = default_config,
        lsp_definitions = default_config,
        lsp_document_symbols = default_config,
        lsp_dynamic_workspace_symbols = default_config,
        lsp_implementations = default_config,
        lsp_incoming_calls = default_config,
        lsp_outgoing_calls = default_config,
        lsp_references = default_config,
        lsp_type_definitions = default_config,
        lsp_workspace_symbols = default_config,
        man_pages = default_config,
        marks = default_config,
        oldfiles = default_config,
        pickers = default_config,
        quickfix = default_config,
        quickfixhistory = default_config,
        registers = default_config,
        reloader = default_config,
        resume = default_config,
        search_history = default_config,
        speel_suggest = default_config,
        symbols = default_config,
        tags = default_config,
        tagstack = default_config,
        treesitter = default_config,
        vim_options = default_config,
    },
    extensions = {
        file_browser = {
            theme = "ivy",
            hijack_netrw = false,  -- disables netrw and use telescope-file-browser in its place
            hidden = true,
        },
    }
}
require("telescope").load_extension "file_browser";
