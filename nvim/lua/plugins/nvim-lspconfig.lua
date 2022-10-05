require("nvim-lsp-installer").setup {
    ensure_installed = { "jdtls@1.11.0-202205051421" },
    automatic_installation = { exclude = { "jdtls" } },
    ui = {
        icons = {
            server_installed = "",
            server_pending = "",
            server_uninstalled = "",
        }
    }
}

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
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
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
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
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 100,
}

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local dap = require('dap')
local lspconfig = require('lspconfig')
lspconfig['ansiblels'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig['bashls'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig['cmake'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig['cssls'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig['cssmodules_ls'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig['cucumber_language_server'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig['dockerls'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig['golangci_lint_ls'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
}

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

lspconfig['groovyls'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig['html'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig['jdtls'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
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
    },
}
dap["adapters"]["java"] = function(callback)
    callback({
        type = "server",
        host = "127.0.0.1",
        port = "1044",
    })
end
dap["configurations"]["java"] = {
    {
        type = "java",
        request = "attach",
        name = "Debug (Attach) - Remote",
        hostName = "127.0.0.1",
        port = "5005",
    },
}
vim.fn.sign_define("DapBreakpoint",          {text="", texthl="Red",    linehl="NONE", numhl="NONE", culhl="NONE"})
vim.fn.sign_define("DapBreakpointCondition", {text="", texthl="Yellow", linehl="NONE", numhl="NONE", culhl="NONE"})
vim.fn.sign_define("DapLogPoint",            {text="", texthl="White",  linehl="NONE", numhl="NONE", culhl="NONE"})
vim.fn.sign_define("DapStopped",             {text="", texthl="Blue",   linehl="NONE", numhl="NONE", culhl="NONE"})
vim.fn.sign_define("DapBreakpointRejected",  {text="", texthl="Grey",   linehl="NONE", numhl="NONE", culhl="NONE"})


lspconfig['jsonls'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig['pyright'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig['rome'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig['sqlls'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig['sqls'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig['sumneko_lua'].setup {
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

lspconfig['tsserver'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig['vimls'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig['yamlls'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
        "yaml-language-server",
        "--stdio"
    },
    settings = {
        redhat = {
            telemetry = {
                enabled = false
            }
        },
        yaml = {
            schemas = {
                ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
            }
        }
    },
    filetypes = {
        "yaml",
        "yaml.docker-compose",
    }
}

lspconfig['zk'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    capabilities = capabilities,
}
