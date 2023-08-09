local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end
    -- local rc = client.resolved_capabilities
    -- if client.name == 'pylsp' then
    -- rc.rename = false
    -- rc.completion = false
    -- rc.format = false
    -- end

    -- if client.name == 'pyright' then
    -- rc.hover = false
    -- rc.definition = false
    -- rc.signature_help = false
    -- rc.format = false
    -- rc.completion = false
        -- rc.references = false
    -- end

    lsp.default_keymaps({ buffer = bufnr })
    -- vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    vim.keymap.set("n", "<leader>ff", function()
        vim.lsp.buf.format { async = true }
    end)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
    vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references)
    vim.keymap.set("n", "<leader>vh", vim.lsp.buf.hover)
    vim.keymap.set("n", "<leader>im", vim.lsp.buf.implementation)
    vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)

    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

require('lspconfig').pyright.setup({
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                autoImportCompletions = false,
            },
        },
        linting = { pylintEnabled = false }
    },
})

-- require('lspconfig').pyright.setup({
--     on_init = function(client)
--         client.server_capabilities.references = nil
--     end,
-- })
-- lsp.skip_server_setup({'pyright'})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    -- ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
    window = {
        documentation = cmp.config.window.bordered()
    }
})

lsp.setup()

--[[
lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
]]
--
