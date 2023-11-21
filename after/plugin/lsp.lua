local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'clangd',
    'html',
    'cssls',
    'jsonls',
    'sqlls',
    'fortls',
    'jdtls',
    'marksman',
    'texlab',
    'vuels',
})


lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

end)

lsp.format_mapping('<leader>f', {
    format_opts = {
        tabSize = 4,
    },
    servers = {
        ['tsserver'] = {'javascript', 'typescript'},
        ['eslint'] = {'javascript', 'typescript', 'vue'},
        ['clangd'] = {'c', 'cpp'},
        ['html'] = {'html'},
        ['cssls'] = {'css'},
        ['jsonls'] = {'json'},
        ['sqlls'] = {'sql'},
        ['fortls'] = {'fortran'},
        ['jdtls'] = {'java'},
        ['marksman'] = {'markdown'},
        ['texlab'] = {'latex'},
        ['vuels'] = {'vue'},
    }
})

lsp.configure('clangd', {
    settings = {
        ["clangd"] = {
            -- Add any other clangd settings here
            format = {
                style = "file",
                useTabs = false,
                tabWidth = 4,
            },
        },
    },
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = true,
})
