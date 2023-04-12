require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        }
    }
})
require("mason-lspconfig").setup {
    ensure_installed = {
    },
}

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<leader>i', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>=', vim.lsp.buf.format, bufopts)
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd({ "BufWritePre" }, {
            group = vim.api.nvim_create_augroup('AUTO_FORMAT_CODE', {}),
            pattern = '*',
            callback = function()
                vim.lsp.buf.format()
            end
        })
    end
    if (client.name == 'jdtls') then
        require('jdtls').setup_dap({ hotcodereplace = 'auto' })
    end
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 100,
}

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local defaultLspSetup = {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
}
local lspconfig = require('lspconfig')
-- lspconfig['ansiblels'].setup = defaultLspSetup
-- lspconfig['bashls'].setup = defaultLspSetup
-- lspconfig['cmake'].setup = defaultLspSetup
-- lspconfig['cssls'].setup = defaultLspSetup
-- lspconfig['cssmodules_ls'].setup = defaultLspSetup
-- lspconfig['cucumber_language_server'].setup = defaultLspSetup
-- lspconfig['dockerls'].setup = defaultLspSetup
lspconfig['golangci_lint_ls'].setup = defaultLspSetup
lspconfig['gopls'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
}
-- lspconfig['groovyls'].setup = defaultLspSetup
-- lspconfig['html'].setup = defaultLspSetup
lspconfig['jdtls'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
        bundles = {
            vim.fn.glob(
                "$HOME/.m2/repository/com/microsoft/java/com.microsoft.java.debug.plugin/0.44.0/com.microsoft.java.debug.plugin-0.44.0.jar")
        }
    },
    settings = {
        ["codeLens.enable"] = true,
        ["java.autobuild.enabled"] = true,
        ["java.completion.enabled"] = true,
        ["java.configuration.maven.globalSettings"] = vim.fs.normalize("$HOME/.m2/settings.xml"),
        ["java.configuration.maven.userSettings"] = vim.fs.normalize("$HOME/.m2/settings.xml"),
        ["java.format.settings.url"] = vim.fs.normalize("$HOME/.config/nvim/format/java_format.xml"),
        ["java.home"] = vim.fs.normalize("$JAVA_HOME"),
        ["java.implementationsCodeLens.enabled"] = true,
        ["java.jdt.ls.java.home"] = vim.fs.normalize("$JAVA_HOME"),
        ["java.maven.downloadSources"] = true,
        ["java.maven.updateSnapshots"] = true,
        ["java.progressReports.enabled"] = false,
        ["java.referenceCodeLens.enabled"] = true,
        ["java.saveActions.organizeImports"] = true,
        ["java.server.launchMode"] = "Standard",
        ["java.signatureHelp.description.enabled"] = true,
        ["java.signatureHelp.enabled"] = true,
        ["java.symbols.includeSourceMethodDeclarations"] = true,
        ["java.import.enabled"] = true,
        ["java.rename.enabled"] = true,
        ["java.contentProvider.preferred"] = 'fernflower',
        ["java.source.organizeImports.starThreshold"] = 9999,
        ["java.source.organizeImports.staticStarThreshold"] = 9999,
    },
}
-- lspconfig['jsonls'].setup = defaultLspSetup
lspconfig['marksman'].setup {}
-- lspconfig['pyright'].setup = defaultLspSetup
-- lspconfig['rome'].setup = defaultLspSetup
-- lspconfig['sqls'].setup = defaultLspSetup
lspconfig['lua_ls'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    },
}
-- lspconfig['terraformls'].setup = defaultLspSetup
lspconfig['tsserver'].setup {}

-- lspconfig['vimls'].setup = defaultLspSetup
-- lspconfig['yamlls'].setup {
--     flags = lsp_flags,
--     on_attach = on_attach,
--     capabilities = capabilities,
--     cmd = {
--         "yaml-language-server",
--         "--stdio"
--     },
--     settings = {
--         redhat = {
--             telemetry = {
--                 enabled = false
--             }
--         },
--         yaml = {
--             schemas = {
--                 ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
--             }
--         }
--     },
--     filetypes = {
--         "yaml",
--         "yaml.docker-compose",
--     }
-- }
