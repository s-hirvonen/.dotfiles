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
    nnoremap('<leader>dr', '<cmd>Telescope lsp_references<cr>')
    inoremap('<C-j>', vim.lsp.buf.signature_help)
end

-- null-ls
local null_ls = require('null-ls')
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.hover.printenv
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        bufnr = bufnr,
                        filter = function(cl)
                          return cl.name == "null-ls"
                        end
                    })
                end,
            })
        end
    end,
})


-- signature help
-- require('lsp_signature').setup({
--     bind = false,
--     hint_enable = false,
--     floating_window = false,
-- })

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function()
    keymap()
end

nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" }
}

nvim_lsp.eslint.setup {}

nvim_lsp.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            }
        }
    }
}

nvim_lsp.phpactor.setup {}

vim.g["fsharp#fsautocomplete_command"] = { 'fsautocomplete' }

require('ionide').setup {
    autostart = true,
    on_attach = function()
        vim.api.nvim_command [[augroup Codelens]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufEnter <buffer> lua vim.lsp.codelens.refresh()]]
        vim.api.nvim_command [[autocmd BufreadPost <buffer> lua vim.lsp.codelens.refresh()]]
        vim.api.nvim_command [[autocmd TextChanged <buffer> lua vim.lsp.codelens.refresh()]]
        vim.api.nvim_command [[augroup END]]
        nnoremap('<leader>run', '<cmd>FsiEvalBuffer<cr>')
    end
}
