local Remap = require('shirvonen.keymap')
local nnoremap = Remap.nnoremap
local tele = require('telescope.builtin')

nnoremap('<C-p>', function() tele.git_files({ show_untracked = true }) end)
nnoremap('<C-g>', tele.live_grep)
nnoremap('<C-b>', tele.buffers)

-- open files in .dotfiles repo
nnoremap('<leader>df', function() tele.git_files({ cwd = '~/.dotfiles' }) end)

-- Keybinds list
nnoremap('<leader>dk', function() tele.keymaps() end)

-- git commands
nnoremap('<leader>gst', tele.git_status)
nnoremap('<leader>glog', tele.git_commits)
nnoremap('<leader>gb', tele.git_bcommits)
