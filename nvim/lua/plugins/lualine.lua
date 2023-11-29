return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- remove clock
    table.remove(opts.sections.lualine_z, 1)
  end,
}
