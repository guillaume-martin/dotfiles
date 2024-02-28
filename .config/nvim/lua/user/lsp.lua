require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls" }
})

local on_attach = function (_, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
end

require("lspconfig").lua_ls.setup {
    on_attach = on_attach
}

require("lspconfig").pyright.setup {
    on_attach = on_attach
}

require("lspconfig").bashls.setup {
    on_attach = on_attach
}

require("lspconfig").docker_compose_language_service.setup {
    on_attach = on_attach
}

require("lspconfig").dockerls.setup {
    on_attach = on_attach
}

require("lspconfig").html.setup {
    on_attach = on_attach
}

require("lspconfig").jsonls.setup {
    on_attach = on_attach
}


require("lspconfig").sqlls.setup {
    on_attach = on_attach
}

require("lspconfig").terraformls.setup {
    on_attach = on_attach
}

-- require("lspconfig").xmlformatter.setup {
--     on_attach = on_attach
-- }

require("lspconfig").yamlls.setup {
    on_attach = on_attach
}

require("lspconfig").marksman.setup {
    on_attach = on_attach
}
