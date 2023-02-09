local Remap = require("shirvonen.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap("<leader>ex", "<cmd>Ex<cr>")
nnoremap("<leader>w", "<cmd>w<cr>")
nnoremap("<leader>so", "<cmd>source %<cr>")
nnoremap("<leader> ", "<C-^>")

nnoremap("J", "mzJ`z")
nnoremap("<C-e>", "3<C-e>")
nnoremap("<C-y>", "3<C-y>")

nnoremap("<C-h>", "<C-w><C-h>")
nnoremap("<C-j>", "<C-w><C-j>")
nnoremap("<C-k>", "<C-w><C-k>")
nnoremap("<C-l>", "<C-w><C-l>")

inoremap("jj", "<esc>")

-- <space>y to copy to system clipboard
vnoremap("<leader>y", "\"+y")
nnoremap("<leader>y", "\"+y")
