require 'lspconfig'.pylsp.setup {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { 'E501', 'W503' },
                    maxLineLength = 88
                }
            }
        }
    }
}
