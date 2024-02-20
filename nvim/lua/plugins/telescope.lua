return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    "aaronhallaert/advanced-git-search.nvim",
  },
  keys = {
    { "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
  },
}
