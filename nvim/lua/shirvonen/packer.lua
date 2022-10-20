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
    use({ "akinsho/nvim-bufferline.lua" })

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
    use { 'glepnir/lspsaga.nvim' }

    -- Typescript
    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')

    -- PHP
    use('stephpy/vim-php-cs-fixer')

    -- Editorconfig
    use('gpanders/editorconfig.nvim')

    -- Autocomplete
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')

    -- snip
    use('L3MON4D3/LuaSnip')
    use('saadparwaiz1/cmp_luasnip')

    -- git
    use('lewis6991/gitsigns.nvim')

end)
