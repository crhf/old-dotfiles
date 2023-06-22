require('dap-python').setup('/home/crhf/.virtualenvs/debugpy/bin/python3')

vim.keymap.set("n", "<leader>dn", require('dap-python').test_method)
vim.keymap.set("n", "<leader>df", require('dap-python').test_class)
vim.keymap.set("v", "<leader>ds", require('dap-python').debug_selection)


local is_windows = function()
    return vim.loop.os_uname().sysname:find("Windows", 1, true) and true
end

local function get_module_path()
    if is_windows() then
        return vim.fn.expand('%:.:r:gs?\\?.?')
    else
        return vim.fn.expand('%:.:r:gs?/?.?')
    end
end

table.insert(require('dap').configurations.python, {
    type = 'python',
    request = 'launch',
    name = 'Launch module',
    module = get_module_path,
    -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
})
