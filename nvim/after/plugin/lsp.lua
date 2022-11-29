local Remap = require("shirvonen.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

-- local protocol = require('vim.lsp.protocol')
local keymap = function()
    --     nnoremap('K', vim.lsp.buf.hover)
    --     nnoremap('gd', vim.lsp.buf.definition)
    nnoremap('gt', vim.lsp.buf.type_definition)
    nnoremap('gi', vim.lsp.buf.implementation)
    --     nnoremap('[d', vim.diagnostic.goto_next)
    --     nnoremap(']d', vim.diagnostic.goto_prev)
    nnoremap('<leader>dl', "<cmd>Telescope diagnostics<cr>")
    inoremap('<C-j>', vim.lsp.buf.signature_help)
end

local null_ls = require('null-ls')
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.hover.printenv
    }
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client)
    -- formatting
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
        vim.api.nvim_command [[augroup END]]
    end

    if client.server_capabilities.documentRangeFormattingProvider then
        vim.cmd("xnoremap <silent><buffer> <leader>f :lua vim.lsp.buf.range_formatting({})<cr>")
    end

    keymap()
end

nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    dmc = { "typescript-language-server", "--stdio" }
}

nvim_lsp.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true)
            }
        }
    }
}

nvim_lsp.phpactor.setup {}
