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

-- Mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', 'gsh', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', 'gwa', vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set('n', 'gwr', vim.lsp.buf.remove_workspace_folder, opts)
vim.keymap.set('n', 'gwl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, opts)
vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', 'grn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', 'gca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', 'grr', vim.lsp.buf.references, opts)
vim.keymap.set('n', 'g==', vim.lsp.buf.format, opts)
vim.keymap.set('n', 'gsd', vim.lsp.diagnostic.get_line_diagnostics, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd({ "BufWritePre" }, {
            group = vim.api.nvim_create_augroup('AUTO_FORMAT_CODE', {}),
            pattern = '*',
            callback = function()
                vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
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
-- local defaultLspSetup = {
--     flags = lsp_flags,
--     on_attach = on_attach,
--     capabilities = capabilities,
-- }
local lspconfig = require('lspconfig')
-- lspconfig['ansiblels'].setup = defaultLspSetup
-- lspconfig['bashls'].setup = defaultLspSetup
-- lspconfig['cmake'].setup = defaultLspSetup
-- lspconfig['cssls'].setup = defaultLspSetup
-- lspconfig['cssmodules_ls'].setup = defaultLspSetup
-- lspconfig['cucumber_language_server'].setup = defaultLspSetup
-- lspconfig['dockerls'].setup = defaultLspSetup
lspconfig['gopls'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
                unusedparams = true,
                unusedimport = true,
                unusedwrite = true,
                unusedfuncs = true,
                undeclaredname = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
}

lspconfig['rust_analyzer'].setup {
    flags = lsp_flags,
    on_attach = on_attach,
    settings = {
        ['rust-analyzer.assist.emitMustUse']                                     = false,
        ['rust-analyzer.assist.expressionFillDefault']                           = 'todo',
        ['rust-analyzer.cachePriming.enable']                                    = true,
        ['rust-analyzer.cachePriming.numThreads']                                = 0,
        ['rust-analyzer.cargo.autoreload']                                       = true,
        ['rust-analyzer.cargo.buildScripts.enable']                              = true,
        ['rust-analyzer.cargo.buildScripts.invocationLocation']                  = 'workspace',
        ['rust-analyzer.cargo.buildScripts.invocationStrategy']                  = 'per_workspace',
        ['rust-analyzer.cargo.buildScripts.overrideCommand']                     = nil,
        ['rust-analyzer.cargo.buildScripts.useRustcWrapper']                     = true,
        ['rust-analyzer.cargo.cfgs']                                             = {},
        ['rust-analyzer.cargo.extraArgs']                                        = {},
        ['rust-analyzer.cargo.extraEnv']                                         = {},
        ['rust-analyzer.cargo.features']                                         = "all",
        ['rust-analyzer.cargo.noDefaultFeatures']                                = false,
        ['rust-analyzer.cargo.procMacro.enable']                                 = true,
        ['rust-analyzer.cargo.sysroot']                                          = 'discover',
        ['rust-analyzer.cargo.sysrootSrc']                                       = nil,
        ['rust-analyzer.cargo.target']                                           = nil,
        ['rust-analyzer.cargo.unsetTest']                                        = { "core" },
        ['rust-analyzer.cargoRunner']                                            = nil,
        ['rust-analyzer.check.allTargets']                                       = true,
        ['rust-analyzer.check.command']                                          = 'check',
        ['rust-analyzer.check.extraArgs']                                        = {},
        ['rust-analyzer.check.extraEnv']                                         = {},
        ['rust-analyzer.check.features']                                         = nil,
        ['rust-analyzer.check.invocationLocation']                               = 'workspace',
        ['rust-analyzer.check.invocationStrategy']                               = 'per_workspace',
        ['rust-analyzer.check.noDefaultFeatures']                                = false,
        ['rust-analyzer.check.overrideCommand']                                  = {},
        ['rust-analyzer.check.targets']                                          = {},
        ['rust-analyzer.checkOnSave']                                            = true,
        ['rust-analyzer.completion.autoimport.enable']                           = true,
        ['rust-analyzer.completion.autoself.enable']                             = true,
        ['rust-analyzer.completion.callable.snippets']                           = 'fill_arguments',
        ['rust-analyzer.completion.limit']                                       = nil,
        ['rust-analyzer.completion.postfix.enable']                              = true,
        ['rust-analyzer.completion.privateEditable.enable']                      = false,
        ['rust-analyzer.debug.engine']                                           = 'auto',
        ['rust-analyzer.debug.engineSettings']                                   = {},
        ['rust-analyzer.debug.openDebugPane']                                    = false,
        ['rust-analyzer.diagnostics.disabled']                                   = {},
        ['rust-analyzer.diagnostics.enable']                                     = false,
        ['rust-analyzer.diagnostics.experimental.enable']                        = false,
        ['rust-analyzer.diagnostics.previewRustcOutput']                         = false,
        ['rust-analyzer.diagnostics.remapPrefix']                                = {},
        ['rust-analyzer.diagnostics.useRustcErrorCode']                          = false,
        ['rust-analyzer.diagnostics.warningsAsHint']                             = {},
        ['rust-analyzer.diagnostics.warningsAsInfo']                             = {},
        ['rust-analyzer.discoverProjectCommand']                                 = nil,
        ['rust-analyzer.files.excludeDirs']                                      = {},
        ['rust-analyzer.files.watcher']                                          = 'client',
        ['rust-analyzer.highlightRelated.breakPoints.enable']                    = true,
        ['rust-analyzer.highlightRelated.closureCaptures.enable']                = true,
        ['rust-analyzer.highlightRelated.exitPoints.enable']                     = true,
        ['rust-analyzer.highlightRelated.references.enable']                     = true,
        ['rust-analyzer.highlightRelated.yieldPoints.enable']                    = true,
        ['rust-analyzer.hover.actions.debug.enable']                             = true,
        ['rust-analyzer.hover.actions.enable']                                   = true,
        ['rust-analyzer.hover.actions.gotoTypeDef.enable']                       = true,
        ['rust-analyzer.hover.actions.implementations.enable']                   = true,
        ['rust-analyzer.hover.actions.references.enable']                        = false,
        ['rust-analyzer.hover.actions.run.enable']                               = true,
        ['rust-analyzer.hover.documentation.enable']                             = true,
        ['rust-analyzer.hover.documentation.keywords.enable']                    = true,
        ['rust-analyzer.hover.links.enable']                                     = true,
        ['rust-analyzer.hover.memoryLayout.alignment']                           = 'hexadecimal',
        ['rust-analyzer.hover.memoryLayout.enable']                              = true,
        ['rust-analyzer.hover.memoryLayout.niches']                              = false,
        ['rust-analyzer.hover.memoryLayout.offset']                              = "hexadecimal",
        ['rust-analyzer.hover.memoryLayout.size']                                = 'both',
        ['rust-analyzer.imports.granularity.enforce']                            = true,
        ['rust-analyzer.imports.granularity.group']                              = 'item',
        ['rust-analyzer.imports.group.enable']                                   = true,
        ['rust-analyzer.imports.merge.glob']                                     = true,
        ['rust-analyzer.imports.prefer.no.std']                                  = false,
        ['rust-analyzer.imports.prefix']                                         = 'crate',
        ['rust-analyzer.inlayHints.bindingModeHints.enable']                     = true,
        ['rust-analyzer.inlayHints.chainingHints.enable']                        = true,
        ['rust-analyzer.inlayHints.closingBraceHints.enable']                    = true,
        ['rust-analyzer.inlayHints.closingBraceHints.minLines']                  = 25,
        ['rust-analyzer.inlayHints.closureCaptureHints.enable']                  = true,
        ['rust-analyzer.inlayHints.closureReturnTypeHints.enable']               = 'always',
        ['rust-analyzer.inlayHints.closureStyle']                                = 'impl_fn',
        ['rust-analyzer.inlayHints.discriminantHints.enable']                    = 'always',
        ['rust-analyzer.inlayHints.expressionAdjustmentHints.enable']            = 'never',
        ['rust-analyzer.inlayHints.expressionAdjustmentHints.hideOutsideUnsafe'] = false,
        ['rust-analyzer.inlayHints.expressionAdjustmentHints.mode']              = 'prefix',
        ['rust-analyzer.inlayHints.lifetimeElisionHints.enable']                 = 'always',
        ['rust-analyzer.inlayHints.lifetimeElisionHints.useParameterNames']      = true,
        ['rust-analyzer.inlayHints.maxLength']                                   = 25,
        ['rust-analyzer.inlayHints.parameterHints.enable']                       = true,
        ['rust-analyzer.inlayHints.reborrowHints.enable']                        = 'never',
        ['rust-analyzer.inlayHints.renderColons']                                = true,
        ['rust-analyzer.inlayHints.typeHints.enable']                            = true,
        ['rust-analyzer.inlayHints.typeHints.hideClosureInitialization']         = false,
        ['rust-analyzer.inlayHints.typeHints.hideNamedConstructor']              = false,
        ['rust-analyzer.interpret.tests']                                        = false,
        ['rust-analyzer.joinLines.joinAssignments']                              = true,
        ['rust-analyzer.joinLines.joinElseIf']                                   = true,
        ['rust-analyzer.joinLines.removeTrailingComma']                          = true,
        ['rust-analyzer.joinLines.unwrapTrivialBlock']                           = true,
        ['rust-analyzer.lens.debug.enable']                                      = true,
        ['rust-analyzer.lens.enable']                                            = true,
        ['rust-analyzer.lens.forceCustomCommands']                               = true,
        ['rust-analyzer.lens.implementations.enable']                            = true,
        ['rust-analyzer.lens.location']                                          = "above_name",
        ['rust-analyzer.lens.references.adt.enable']                             = false,
        ['rust-analyzer.lens.references.enumVariant.enable']                     = false,
        ['rust-analyzer.lens.references.method.enable']                          = false,
        ['rust-analyzer.lens.references.trait.enable']                           = false,
        ['rust-analyzer.lens.run.enable']                                        = true,
        ['rust-analyzer.linkedProjects']                                         = {},
        ['rust-analyzer.lru.capacity']                                           = nil,
        ['rust-analyzer.lru.query.capacities']                                   = {},
        ['rust-analyzer.notifications.cargoTomlNotFound']                        = true,
        ['rust-analyzer.numThreads']                                             = 2,
        ['rust-analyzer.procMacro.attributes.enable']                            = true,
        ['rust-analyzer.procMacro.enable']                                       = true,
        ['rust-analyzer.procMacro.ignored']                                      = {},
        ['rust-analyzer.procMacro.server']                                       = nil,
        ['rust-analyzer.references.excludeImports']                              = false,
        ['rust-analyzer.restartServerOnConfigChange']                            = false,
        ['rust-analyzer.runnableEnv']                                            = nil,
        ['rust-analyzer.runnables.command']                                      = nil,
        ['rust-analyzer.runnables.extraArgs']                                    = {},
        ['rust-analyzer.rustc.source']                                           = nil,
        ['rust-analyzer.rustfmt.extraArgs']                                      = {},
        ['rust-analyzer.rustfmt.overrideCommand']                                = {},
        ['rust-analyzer.rustfmt.rangeFormatting.enable']                         = false,
        ['rust-analyzer.semanticHighlighting.doc.comment.inject.enable']         = true,
        ['rust-analyzer.semanticHighlighting.nonStandardTokens']                 = true,
        ['rust-analyzer.semanticHighlighting.operator.enable']                   = true,
        ['rust-analyzer.semanticHighlighting.operator.specialization.enable']    = false,
        ['rust-analyzer.semanticHighlighting.punctuation.enable']                = false,
        ['rust-analyzer.semanticHighlighting.punctuation.separate.macro.bang']   = false,
        ['rust-analyzer.semanticHighlighting.punctuation.specialization.enable'] = false,
        ['rust-analyzer.semanticHighlighting.strings.enable']                    = true,
        -- ['rust-analyzer.server.extraEnv']                                        = nil,
        -- ['rust-analyzer.server.path']                                            = nil,
        ['rust-analyzer.showDependenciesExplorer']                               = true,
        ['rust-analyzer.showUnlinkedFileNotification']                           = true,
        ['rust-analyzer.signatureInfo.detail']                                   = "full",
        ['rust-analyzer.signatureInfo.documentation.enable']                     = true,
        ['rust-analyzer.trace.extension']                                        = false,
        ['rust-analyzer.trace.server']                                           = "off",
        ['rust-analyzer.typing.autoClosingAngleBrackets.enable']                 = false,
        ['rust-analyzer.typing.continueCommentsOnNewline']                       = true,
        ['rust-analyzer.workspace.symbol.search.kind']                           = "only_types",
        ['rust-analyzer.workspace.symbol.search.limit']                          = 128,
        ['rust-analyzer.workspace.symbol.search.scope']                          = "workspace_and_dependencies",
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
