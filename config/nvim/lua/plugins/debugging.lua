return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'rcarriga/nvim-dap-ui',
        'leoluz/nvim-dap-go',
    },
    config = function()
        local dap = require('dap')
        local dapui = require("dapui")
        vim.keymap.set('n', '<leader>ds', function() dap.continue() end)
        vim.keymap.set('n', '<leader>dt', function() dap.toggle_breakpoint() end)
        -- Need to investigate what each one does
        vim.keymap.set('n', '<M-n>', function() dap.step_over() end)
        vim.keymap.set('n', '<M-i>', function() dap.step_into() end)
        vim.keymap.set('n', '<M-o>', function() dap.step_out() end)
        vim.keymap.set('n', '<leader>dl', function() dap.run_last() end)


        -- Dap Ui Configuration
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        -- Widget configuration
        vim.keymap.set('n', '<leader>dk', function() dapui.eval() end)
        vim.keymap.set('n', '<leader>df', function() dapui.float_element() end)

        -- Setup dependencies
        require('dapui').setup()
        require('dap-go').setup()
    end
}
