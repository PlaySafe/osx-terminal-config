require("nvim-lsp-installer").setup {}
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
lspconfig['gopls'].setup { flags = lsp_flags, }
lspconfig['html'].setup { flags = lsp_flags, }
lspconfig['jdtls'].setup { flags = lsp_flags, }
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
