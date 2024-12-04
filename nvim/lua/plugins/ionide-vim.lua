return {
  {
    "ionide/Ionide-vim",
    -- ft = { "fs", "fsx" },
    init = function()
      vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>FsiEvalBuffer<cr>", { noremap = true, silent = true })
    end,
  },
}
