vim.api.nvim_command [[augroup FormatPHP]]
vim.api.nvim_command [[autocmd!]]
vim.api.nvim_command [[autocmd BufWritePost *.php :silent! !php-cs-fixer fix %:p]]
vim.api.nvim_command [[augroup END]]
