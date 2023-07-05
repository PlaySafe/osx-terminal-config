local cmp = require('cmp')
local kind_icons = {
    Class = "ﴯ",
    Color = "",
    Constant = "",
    Constructor = "",
    Enum = "",
    EnumMember = "",
    Event = "",
    Field = "",
    File = "",
    Folder = "",
    Function = "",
    Interface = "",
    Keyword = "",
    Method = "",
    Module = "",
    Operator = "",
    Property = "ﰠ",
    Reference = "",
    Snippet = "",
    Struct = "",
    Text = "",
    TypeParameter = "",
    Unit = "",
    Value = "",
    Variable = "",
}

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    formatting = {
        format = function(entry, vim_item)
            -- Kind icons
            -- Concatinate the icons with name of the item-kind
            vim_item.kind = string.format("%s %s %s", kind_icons[vim_item.kind], vim_item.kind, vim_item.menu)
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                spell = "[Spellings]",
                zsh = "[Zsh]",
                buffer = "[Buffer]",
                ultisnips = "[Snip]",
                treesitter = "[Treesitter]",
                calc = "[Calculator]",
                nvim_lua = "[Lua]",
                path = "[Path]",
                nvim_lsp_signature_help = "[Signature]",
                cmdline = "[Vim Command]"
            })[entry.source.name]
            return vim_item
        end,
    },
    preselect = cmp.PreselectMode.None,
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<Tab>'] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                    return
                end
                fallback()
            end
            , { 'i', 'c' }),
        ['<S-Tab>'] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                    return
                end
                fallback()
            end
            , { 'i', 'c' }),
    }),
    sources = cmp.config.sources(
        {
            { name = 'nvim_lsp' },
            { name = 'ultisnips' }, -- For ultisnips users.
        },
        {
            { name = 'buffer' },
        }
    )
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
