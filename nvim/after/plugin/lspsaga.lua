local Remap = require("shirvonen.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local status, saga = pcall(require, 'lspsaga')
if not status then return end

saga.init_lsp_saga {
    server_filetype_map = {}
}

nnoremap('K', '<cmd>Lspsaga hover_doc<cr>')
nnoremap('gd', '<cmd>Lspsaga lsp_finder<cr>')
nnoremap('gp', '<cmd>Lspsaga peek_definition<cr>')
nnoremap('gr', '<cmd>Lspsaga rename<cr>')
nnoremap('<C-j>', '<cmd>Lspsaga diagnostic_jump_next<cr>')
inoremap('<C-k>', '<cmd>Lspsaga signature_help<cr>')
nnoremap('[d', '<cmd>Lspsaga diagnostic_jump_next<cr>')
nnoremap(']d', '<cmd>Lspsaga diagnostic_jump_prev<cr>')
nnoremap('gx', '<cmd>Lspsaga code_action<cr>')
