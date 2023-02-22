-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)

vim.keymap.set("i", "jj", "<esc>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- keep cursor in the middle when PgUp
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- keep cursor in the middle when PgDn
vim.keymap.set("n", "<C-e>", "5<C-e>")
vim.keymap.set("n", "<C-y>", "5<C-y>")

vim.keymap.set("n", "<leader>y", '"+y', { noremap = true, desc = "Copy to clipboard" }) -- yank to system clipboard
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, desc = "Copy to clipboard" }) -- yank to system clipboard

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
