return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    -- Colorscheme section
    use("gruvbox-community/gruvbox")
    use("folke/tokyonight.nvim")

    -- Statusline
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    })

    -- Treesitter
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })

    -- Telescope
    use('nvim-lua/plenary.nvim')
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- LSP
    use { 'neovim/nvim-lspconfig' }

    -- Prettier
    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')

    -- Editorconfig
    use('gpanders/editorconfig.nvim')
end)
