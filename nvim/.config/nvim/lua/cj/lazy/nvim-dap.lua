return {
    'rcarriga/nvim-dap-ui',
    dependencies = {
        'mfussenegger/nvim-dap',
        'nvim-neotest/nvim-nio',
    },

    config = function()
        local dap, dapui = require("dap"), require("dapui")
        dap.adapters.coreclr = {
            type = 'executable',
            command = '/usr/local/bin/netcoredbg/netcoredbg',
            args = { '--interpreter=vscode' }
        }


        dap.configurations.cs = {
            {
                type = "coreclr",
                name = "launch - netcoredbg",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
                end,
            },
        }

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
        vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })
        vim.keymap.set('n', '<F5>', require 'dap'.continue)
        vim.keymap.set('n', '<F10>', require 'dap'.step_over)
        vim.keymap.set('n', '<F11>', require 'dap'.step_into)
        vim.keymap.set('n', '<F12>', require 'dap'.step_out)
        vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)
    end
}
