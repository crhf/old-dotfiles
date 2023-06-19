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
        },
        current_buffer_fuzzy_find = {
            mappings = mappings,
        },
        lsp_references = {
            mappings = mappings,
        },
        lsp_document_symbols = {
            mappings = mappings,
        },
        lsp_dynamic_workspace_symbols = {
            mappings = mappings,
        },
        help_tags = {
            mappings = mappings,
        },
        oldfiles = {
            mappings = mappings,
        },
    },
}
local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files({ no_ignore = true })
end)
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    -- builtin.grep_string({ search = vim.fn.input("Grep > ") });
    builtin.live_grep();
end)
vim.keymap.set('n', '<leader>/', function()
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
