local ok, prettier = pcall(require, 'prettier')
if not ok then
    return
end

prettier.setup({
    bin = 'prettierd',
    filetypes = {
        "css",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "markdown",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "yaml",
    }
})
