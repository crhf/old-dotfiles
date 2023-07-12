vim.keymap.set("n", "<leader>1", require('dap').restart)
vim.keymap.set("n", "<leader>2", require('dap').terminate)
vim.keymap.set("n", "<leader>5", require('dap').continue)
vim.keymap.set("n", "<leader>7", require('dap').step_into)
vim.keymap.set("n", "<leader>8", require('dap').step_over)
vim.keymap.set("n", "<leader>9", require('dap').run_to_cursor)
vim.keymap.set("n", "<leader>0", require('dap').step_out)

vim.keymap.set("n", "<leader>fk", require('dap').up)
vim.keymap.set("n", "<leader>fj", require('dap').down)

vim.keymap.set("n", "<leader>b", require('dap').toggle_breakpoint)
vim.keymap.set("n", "<leader>B", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")

vim.keymap.set('n', '<Leader>lp',
    function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', require('dap').repl.open)
vim.keymap.set('n', '<Leader>dl', require('dap').run_last)

-- require('dap').defaults.fallback.terminal_win_cmd = 'terminal'
