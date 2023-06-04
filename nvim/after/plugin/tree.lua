local api = require('nvim-tree.api')
vim.keymap.set('n', '<leader>t', function() api.tree.toggle({focus=false}) end)
vim.keymap.set("n", "<leader>pv", function () api.tree.focus() end)
