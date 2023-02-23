return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- remove nvim-navic: LSP "breadcrumb"
    table.remove(opts.sections.lualine_c, 4)
  end,
}
