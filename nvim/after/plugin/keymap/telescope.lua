local Remap = require("shirvonen.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<C-p>", function()
    require('telescope.builtin').git_files()
end)
nnoremap("<C-g>", function()
    require('telescope.builtin').live_grep()
end)
nnoremap("<C-b>", function()
    require('telescope.builtin').buffers()
end)
