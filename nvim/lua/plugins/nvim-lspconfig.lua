require("nvim-lsp-installer").setup {
    ensure_installed = { "jdtls@1.11.0-202205051421" },
    automatic_installation = { exclude = { "jdtls" } }
}
local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 100,
}
local lspconfig = require('lspconfig')
lspconfig['ansiblels'].setup { flags = lsp_flags, }
lspconfig['bashls'].setup { flags = lsp_flags, }
lspconfig['cmake'].setup { flags = lsp_flags, }
lspconfig['cssls'].setup { flags = lsp_flags, }
lspconfig['cssmodules_ls'].setup { flags = lsp_flags, }
lspconfig['cucumber_language_server'].setup { flags = lsp_flags, }
lspconfig['dockerls'].setup { flags = lsp_flags, }
lspconfig['golangci_lint_ls'].setup { flags = lsp_flags, }
lspconfig['gopls'].setup {
    flags = lsp_flags,
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
lspconfig['html'].setup { flags = lsp_flags, }
lspconfig['jdtls'].setup {
    flags = lsp_flags,
    cmd = {
        "java.implementationsCodeLens.enabled=true",
        "java.jdt.ls.java.home=$JAVA_HOME",
        "java.signatureHelp.enabled=true",
        "java.signatureHelp.description.enabled=true",
        "java.configuration.maven.globalSettings=$HOME/.m2/settings.xml",
        "java.configuration.maven.userSettings=$HOME/.m2/settings.xml",
        "java.home=$JAVA_HOME",
        "java.import.maven.offline.enabled=true",
        "java.maven.downloadSources=true",
        "java.maven.updateSnapshots=true",
        "java.saveActions.organizeImports=true",
        "java.symbols.includeSourceMethodDeclarations=true",
    },
}
lspconfig['jsonls'].setup { flags = lsp_flags, }
lspconfig['pyright'].setup { flags = lsp_flags, }
lspconfig['remark_ls'].setup { flags = lsp_flags, }
lspconfig['rome'].setup { flags = lsp_flags, }
lspconfig['sqlls'].setup { flags = lsp_flags, }
lspconfig['sqls'].setup { flags = lsp_flags, }
lspconfig['sumneko_lua'].setup { flags = lsp_flags, }
lspconfig['tsserver'].setup { flags = lsp_flags, }
lspconfig['vimls'].setup { flags = lsp_flags, }
lspconfig['yamlls'].setup { flags = lsp_flags, }
lspconfig['zk'].setup { flags = lsp_flags, }
