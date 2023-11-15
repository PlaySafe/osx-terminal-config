local function orientation()
    if vim.fn.winwidth(0) > 100 then
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
            width = 0.99,
            height = 0.99,
            preview_cutoff = 20,
            prompt_position = "bottom",
        },
        horizontal = {
            height = 0.99,
            preview_cutoff = 80,
            prompt_position = "top",
            width = 0.99,
        }
    }
}

local actions = require('telescope.actions')
local fb_actions = require "telescope".extensions.file_browser.actions
local telescope = require('telescope')
telescope.setup {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        prompt_prefix = "🔍 ",
        selection_caret = "👉",
        path_display = {
            shorten = {
                len = 2,
                exclude = { -2, -1 }
            }
        },
        dynamic_preview_title = true,
        preview = {
            treesitter = false,
        },
        sorting_strategy = "ascending",
        multi_icon = "🎯",
        color_devicons = true,
        mappings = {
            i = {
                ["<F1>"] = actions.which_key,
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
                ["<C-o>"] = actions.open_qflist,
                ["<C-f>"] = actions.preview_scrolling_down,
                ["<C-b>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_left,
                ["<C-l>"] = actions.preview_scrolling_right,
                ["<TAB>"] = actions.toggle_selection + actions.move_selection_next,
                ["<DEL>"] = actions.toggle_selection + actions.move_selection_next,
                ["<S-TAB>"] = actions.toggle_selection + actions.move_selection_previous,
                ["<S-Right>"] = fb_actions.change_cwd,
                ["<S-Left>"] = fb_actions.goto_parent_dir,
            },
            n = {
                ["<F1>"] = actions.which_key,
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
                ["<C-o>"] = actions.open_qflist,
                ["<C-f>"] = actions.preview_scrolling_down,
                ["<C-b>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_left,
                ["<C-l>"] = actions.preview_scrolling_right,
                ["<TAB>"] = actions.toggle_selection + actions.move_selection_next,
                ["<DEL>"] = actions.toggle_selection + actions.move_selection_next,
                ["<S-TAB>"] = actions.toggle_selection + actions.move_selection_previous,
                ["<S-Right>"] = fb_actions.change_cwd,
                ["<S-Left>"] = fb_actions.goto_parent_dir,
            }
        },
        file_ignore_patterns = {
            'node_modules/',
            'target/',
            '.git/',
            '.idea',
            '.settings',
            '.project',
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
        media_files = default_config,
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
            hijack_netrw = false, -- disables netrw and use telescope-file-browser in its place
            hidden = true,
            no_ignore = true,
            dir_icon = "📁",
            dir_icon_hl = "",
            -- depth = 3,
        },
        media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = { "png", "jpg", "pdf", "webm", "mp4" },
            -- find command (defaults to `fd`)
            find_cmd = "rg",
        },
    },

}
telescope.load_extension("file_browser")
telescope.load_extension("dap")
telescope.load_extension("media_files")
