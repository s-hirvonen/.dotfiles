return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = "all",
      sync_install = false,
      hilight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    },
  },
}
