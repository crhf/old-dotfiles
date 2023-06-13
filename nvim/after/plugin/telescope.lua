require("telescope").setup {
    pickers = {
        find_files = {
            mappings = {
                i = {
                    ["<C-l>"] = "close",
                    ["<Esc>"] = false,
                    ["<C-c>"] = false
                },
            },
        },
        grep_string = {
            mappings = {
                i = {
                    ["<C-l>"] = "close",
                    ["<Esc>"] = false,
                    ["<C-c>"] = false
                }
            }
        }
    },
}
local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files({ no_ignore = true })
end)
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    -- builtin.grep_string({ search = vim.fn.input("Grep > ") });
    builtin.grep_string();
end)
