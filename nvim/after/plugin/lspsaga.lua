local Remap = require("shirvonen.keymap")
local nnoremap = Remap.nnoremap

local status, saga = pcall(require, 'lspsaga')
if not status then return end

saga.setup({
    lightbulb = {
        enable = true,
        enable_in_insert = false
    },
    symbol_in_winbar = {
        enable = false
    },
    code_action = {
        num_shortcut = false
    },
    diagnostic = {
        jump_num_shortcut = false
    },
    ui = {
        border = 'single'
    }
})

nnoremap('K', '<cmd>Lspsaga hover_doc<cr>')
nnoremap('gd', '<cmd>Lspsaga lsp_finder<cr>')
nnoremap('gp', '<cmd>Lspsaga peek_definition<cr>')
nnoremap('gr', '<cmd>Lspsaga rename<cr>')
nnoremap('<C-j>', '<cmd>Lspsaga diagnostic_jump_next<cr>')
nnoremap('<C-k>', '<cmd>Lspsaga diagnostic_jump_prev<cr>')
nnoremap('[d', '<cmd>Lspsaga diagnostic_jump_next<cr>')
nnoremap(']d', '<cmd>Lspsaga diagnostic_jump_prev<cr>')
nnoremap('gx', '<cmd>Lspsaga code_action<cr>')
