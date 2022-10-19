vim.g.shirvonen_colorscheme = "tokyonight-moon"

local function Color()
    vim.g.tokyonight_transparent = false
    vim.g.tokyonight_transparent_sidebar = false
    vim.opt.background = "dark"

    vim.cmd("colorscheme " .. vim.g.shirvonen_colorscheme)
end

Color()
return Color
