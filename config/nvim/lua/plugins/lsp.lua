return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },
        {
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        { 'williamboman/mason-lspconfig.nvim' },

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },
        {
            'L3MON4D3/LuaSnip',
            dependencies = { "rafamadriz/friendly-snippets" },
        },
    },

    config = function()
        local lsp = require('lsp-zero')

        -- [Mason Setup]
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                'lua_ls',
                'bashls',
                'marksman',
                'tsserver',
                'html',
                'cssls',
                'eslint',
                'jsonls',
                'prismals',
                'tailwindcss',
                'gopls'
            },
            handlers = {
                lsp.default_setup,
                lua_ls = function()
                    local lua_opts = lsp.nvim_lua_ls()
                    require('lspconfig').lua_ls.setup(lua_opts)
                end,
            }
        })

        -- [Auto Complete Configuration]
        local cmp = require('cmp')
        local cmp_format = require('lsp-zero').cmp_format()
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        -- [TODO: INVESTIGATE WHY NOT LOADING SNIPPETS]
        require('luasnip.loaders.from_vscode').lazy_load()

        cmp.setup({
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            formatting = cmp_format,
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            }
        })

        -- [LSP Setup]
        lsp.preset({
            manage_nvim_cmp = {
                set_sources = 'recommended',
                set_basic_mappings = true,
                set_extra_mappings = true
            }
        })

        lsp.set_preferences({
            sign_icons = {
                error = 'E',
                warn = 'W',
                hint = 'H',
                info = 'I'
            }
        })

        -- [LSP Customization]
        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
            lsp.buffer_autoformat()

            local opts = { buffer = bufnr, remap = false }

            vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set('n', '<leader>gd', function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set('n', '<leader>gD', function() vim.lsp.buf.declaration() end, opts)
            vim.keymap.set('n', '<leader>gi', function() vim.lsp.buf.implementation() end, opts)
            vim.keymap.set('n', '<leader>go', function() vim.lsp.buf.type_definition() end, opts)
            vim.keymap.set('n', '<leader>gs', function() vim.lsp.buf.signature_help() end, opts)
            vim.keymap.set('n', '<leader>gr', '<cmd>TroubleToggle lsp_references<cr>', { buffer = true })
            vim.keymap.set('n', '<leader>se', function() vim.diagnostic.open_float() end, opts)
        end)

        -- (Optional) Configure lua language server for neovim
        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

        lsp.setup()

        vim.diagnostic.config({
            virtual_text = true
        })
    end
}
