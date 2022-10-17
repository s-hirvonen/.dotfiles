vim.g.shirvonen_colorscheme = "tokyonight"

function Color()
    vim.g.tokyonight_transparent = true
    vim.g.tokyonight_transparent_sidebar = true
    vim.opt.background = "dark"

    vim.cmd("colorscheme " .. vim.g.shirvonen_colorscheme)
end
Color()
