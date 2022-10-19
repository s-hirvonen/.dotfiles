local Color = require("shirvonen.colors")
local Remap = require("shirvonen.keymap")
local nnoremap = Remap.nnoremap

require('bufferline').setup {
    options = {
        separator_style = 'slant',
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
    },
}

nnoremap('<tab>', '<cmd>BufferLineCycleNext<cr>')
nnoremap('<S-tab>', '<cmd>BufferLineCyclePrev<cr>')

Color()
