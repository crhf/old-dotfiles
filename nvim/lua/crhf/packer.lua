local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        "nvim-telescope/telescope.nvim", tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { 'nvim-telescope/telescope-fzf-native.nvim', run =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    require('telescope').load_extension('fzf')

    -- use({ 'rose-pine/neovim', as = 'rose-pine' })
    -- vim.cmd('colorscheme rose-pine')
    use({ 'sainnhe/gruvbox-material', as = 'gruvbox-material' })
    vim.cmd('colorscheme gruvbox-material')


    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })

    use('ThePrimeagen/harpoon')

    use('mbbill/undotree')

    -- use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    use 'ray-x/lsp_signature.nvim'

    use({
        "Pocco81/auto-save.nvim",
        config = function()
            require("auto-save").setup {
                -- your config goes here
                -- or just leave it empty :)
            }
        end,
    })

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
    -- use({'mhinz/vim-signify',
    --     config = function()
    --         require("vim-signify").setup({
    --             update_time = 100
    --         })
    --     end
    -- })
    use 'voldikss/vim-floaterm'
    if packer_bootstrap then
        require('packer').sync()
    end

    use {
        'lewis6991/gitsigns.nvim',
        -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- use({
    --     "iamcco/markdown-preview.nvim",
    --     run = "cd app && npm install",
    --     setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    --     ft = { "markdown" },
    -- })

    use("petertriho/nvim-scrollbar")

    use("kevinhwang91/nvim-hlslens")

    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-dap-python'
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use 'theHamsta/nvim-dap-virtual-text'
    use 'JRasmusBm/telescope-dap.nvim'

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim"
        }
    }
    use "nvim-neotest/neotest-python"

    use 'folke/neodev.nvim'

    use({
        "andythigpen/nvim-coverage",
        requires = "nvim-lua/plenary.nvim",
        -- Optional: needed for PHP when using the cobertura parser
        -- rocks = { 'lua-xmlreader' },
        config = function()
            require("coverage").setup()
        end,
    })

    use 'crhf/symbols-outline.nvim'

    use "m4xshen/hardtime.nvim"

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use({
        "utilyre/barbecue.nvim",
        tag = "*",
        requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        after = "nvim-web-devicons",       -- keep this if you're using NvChad
        config = function()
            require("barbecue").setup()
        end,
    })
end)
