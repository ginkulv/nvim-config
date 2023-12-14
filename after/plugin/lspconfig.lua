local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, {
        {name = 'buffer' },
    })
})

local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
    vim.keymap.set('n', '<leader>ld', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', '<leader>le', vim.diagnostic.setqflist, opts)
    vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>lu', '<cmd>Telescope lsp_references<CR>', opts)
end

local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.lua_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lspconfig.rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lspconfig.pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lspconfig.elixirls.setup {
    cmd = { "C:\\Users\\geenk\\elixir-ls\\language_server.bat" },
    capabilities = capabilities,
    on_attach = on_attach,
}
