return require("packer").startup(function()
    use("wbthomason/packer.nvim")
    use("nvim-telescope/telescope.nvim")

    -- Colorscheme section
    use("gruvbox-community/gruvbox")
    use("folke/tokyonight.nvim")

    -- Treesitter
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
end)
