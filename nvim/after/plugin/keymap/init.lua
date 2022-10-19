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

inoremap("jj", "<esc>")
