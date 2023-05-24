vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "Red", linehl = "NONE", numhl = "NONE", culhl = "NONE" })
vim.fn.sign_define("DapBreakpointCondition", {
    text = "",
    texthl = "Yellow",
    linehl = "NONE",
    numhl = "NONE",
    culhl = "NONE"
})
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "White", linehl = "NONE", numhl = "NONE", culhl = "NONE" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "Blue", linehl = "NONE", numhl = "NONE", culhl = "NONE" })
vim.fn.sign_define("DapBreakpointRejected", {
    text = "",
    texthl = "Grey",
    linehl = "NONE",
    numhl = "NONE",
    culhl = "NONE"
})

require("dapui").setup({
    icons = { expanded = "", collapsed = "", current_frame = "" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<SPACE>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    -- Use this to override mappings for specific elements
    element_mappings = {
        -- Example:
        -- stacks = {
        --   open = "<CR>",
        --   expand = "o",
        -- }
    },
    -- Expand lines larger than the window
    -- Requires >= 0.7
    expand_lines = vim.fn.has("nvim-0.7") == 1,
    -- Layouts define sections of the screen to place windows.
    -- The position can be "left", "right", "top" or "bottom".
    -- The size specifies the height/width depending on position. It can be an Int
    -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
    -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
    -- Elements are the elements shown in the layout (in order).
    -- Layouts are opened in order so that earlier layouts take priority in window sizing.
    layouts = {
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                { id = "scopes", size = 0.25 },
                "breakpoints",
                "stacks",
                "watches",
            },
            size = 40, -- 40 columns
            position = "left",
        },
        {
            elements = {
                "repl",
                "console",
            },
            size = 0.25, -- 25% of total lines
            position = "bottom",
        },
    },
    controls = {
        -- Requires Neovim nightly (or 0.8 when released)
        enabled = true,
        -- Display controls in this element
        element = "repl",
        icons = {
            pause = "",
            play = "",
            step_into = "",
            step_over = "",
            step_out = "",
            step_back = "",
            run_last = "",
            terminate = "",
        },
    },
    floating = {
        max_height = nil,  -- These can be integers or a float between 0 and 1.
        max_width = nil,   -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil, -- Can be integer or nil.
        max_value_lines = 100, -- Can be integer or nil.
    }
})

local dap = require('dap')
dap.listeners.after['event_initialized']['dap'] = function()
    require('dapui').open()
end
dap.listeners.after['event_terminated']['dap'] = function()
    require('dapui').close()
end

dap.adapters.javascript = {
    type = 'server',
    host = '127.0.0.1',
    port = '$port',
    executable = {
        command = vim.loop.os_homedir() .. '/.local/share/nvim/mason/packages/js-debug-adapter/js-debug-adapter',
        args = { '9999' }
    }
}
dap.configurations.javascript = {
    {
        type = "javascript",
        name = "Launch command in Debug Mode",
        request = "launch",
        program = '${file}',
        sourceMaps = true,
        protocol = 'inspector',
        port = function()
            return vim.ui.input({ prompt = 'Port: ' }, function(input)
                return input
            end)
        end
    },
    {
        type = "javascript",
        name = "Attach command in Debug Mode",
        request = "attach",
        program = '${file}',
        sourceMaps = true,
        protocol = 'inspector',
        port = function()
            return vim.ui.input({ prompt = 'Port: ' }, function(input)
                return input
            end)
        end
    },
}

dap.adapters.typescript = {
    type = 'executable',
    command = "node",
    args = { vim.loop.os_homedir() .. '/.local/share/nvim/mason/bin/chrome-debug-adapter' },
}
dap.configurations.typescript = {
    {
        type = 'typescript',
        request = 'attach',
        name = 'Attach to TypeScript server',
        sourceMaps = true,
        trace = true,
        protocol = 'inspector',
        host = 'localhost',
        port = 9222,
        -- webRoot = "${workspaceFolder}",
    },
}

dap.adapters.go = {
    type = 'server',
    port = "${port}",
    executable = {
        command = vim.loop.os_homedir() .. '/.local/share/nvim/mason/bin/dlv',
        args = { 'dap', '-l', '127.0.0.1:${port}' },
    },
}
dap.configurations.go = {
    {
        type = "go",
        name = "Launch the Application in Debug Mode",
        request = "launch",
        program = "${workspaceFolder}",
        logLevel = "DEBUG",
    },
    {
        type = "go",
        name = "Start this test file in Debug Mode", -- configuration for debugging test files
        request = "launch",
        mode = "test",
        program = "${file}"
    },
    -- works with go.mod packages and sub packages
    {
        type = "go",
        name = "Start all test files under the same directory",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}"
    }
}

-- dap.adapters.java = function(callback, config)
--     M.execute_command({ command = 'vscode.java.startDebugSession' }, function(err0, port)
--         assert(not err0, vim.inspect(err0))
--         callback({ type = 'server', host = '127.0.0.1', port = port, })
--     end)
-- end
dap.adapters.java = {
    type = "executable",
    -- type = "server",
    command = "java",
    args = {
        "-jar",
        vim.loop.os_homedir() .. "/.local/manual/com.microsoft.java.debug.plugin-0.44.0.jar",
        "--language-server"
    },
    env = {
        ["JAVA_HOME"] = "/usr/local/opt/openjdk@17"
    },
    cwd = "${workspaceFolder}",
    -- port = port,
}
dap.configurations.java = {
    {
        type = 'java',
        name = 'Attach debug mode to the running server',
        request = 'attach',
        hostName = '127.0.0.1',
        port = 5005,
    },
    {
        type = 'java',
        name = 'Debug Test (JUnit4)',
        request = 'launch',
        hostName = '127.0.0.1',
        port = 5005,
    },
    {
        type = 'java',
        name = 'Debug Test (JUnit5)',
        request = 'attach',
        hostName = '127.0.0.1',
        port = 5005,
    },
    -- {
    --     type = "java-debug-adapter",
    --     name = "Launch the Application in Debug Mode",
    --     request = "launch",
    --     program = "${workspaceFolder}",
    --     logLevel = "DEBUG",
    -- },
    -- {
    --     type = "java-debug-adapter",
    --     name = "Start this test file in Debug Mode", -- configuration for debugging test files
    --     request = "launch",
    --     mode = "test",
    --     program = "${file}"
    -- },
}
