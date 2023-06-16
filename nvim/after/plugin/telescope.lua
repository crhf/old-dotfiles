local mappings = {
    i = {
        ["<C-l>"] = "close",
        ["<Esc>"] = false,
        ["<C-c>"] = false,
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<C-p>"] = false,
        ["<C-n>"] = false,
    },
}
require("telescope").setup {
    pickers = {
        find_files = {
            mappings = mappings,
        },
        grep_string = {
            mappings = mappings,
        },
        live_grep = {
            mappings = mappings,
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
    builtin.live_grep();
end)
