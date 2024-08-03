-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
    -- NOTE: Yes, you can install new plugins here!
    'mfussenegger/nvim-dap',
    -- NOTE: And you can specify dependencies as well
    dependencies = {
        -- Creates a beautiful debugger UI
        'rcarriga/nvim-dap-ui',

        -- Required dependency for nvim-dap-ui
        'nvim-neotest/nvim-nio',

        -- Installs the debug adapters for you
        'williamboman/mason.nvim',
        'jay-babu/mason-nvim-dap.nvim',

        -- Add your own debuggers here
        'leoluz/nvim-dap-go',
    },
    config = function()
        local dap = require 'dap'
        local dapui = require 'dapui'

        local home = os.getenv("HOME") or os.getenv("USERPROFILE")
        local vstuc_path = home ..
            "/.vscode/extensions/visualstudiotoolsforunity.vstuc-1.0.1/bin/"
        dap.adapters.vstuc = {
            type = 'executable',
            command = 'dotnet',
            args = {
                'UnityDebugAdapter.dll'
            },
            options = {
                cwd = vstuc_path,
            },
        }

        -- dap.configurations.cs = {
        --     {
        --         name = 'Unity Debugger',
        --         type = 'vstuc',
        --         request = 'attach',
        --         projectPath = vim.fn.getcwd(),
        --         logFile = vim.env.HOME .. "/vstuc.log",
        --         endPoint = function()
        --             local system_obj = vim.system(
        --                 { "dotnet", vstuc_path .. "UnityAttachProbe.dll" })
        --             local probe_result = system_obj:wait(2000).stdout
        --
        --             if probe_result == nil or #probe_result == 0 then
        --                 print("No endpoint found (is unity running?)")
        --                 return ""
        --             end
        --             local pattern = [["debuggerPort":(%d+)]]
        --             local port = string.match(probe_result, pattern)
        --
        --             if port == nil or #port == 0 then
        --                 print("Failed to parse debugger port")
        --                 return ""
        --             end
        --
        --             return "127.0.0.1:" .. port
        --         end,
        --     }
        -- }

        -- dap.adapters.godot_mono = {
        --     type = 'server',
        --     address = 'localhost',
        --     port = 23685,
        -- }

        -- dap.configurations.gdscript = {
        --     {
                -- type = 'godot',
                -- request = 'launch',
                -- name = 'Launch scene',
                -- project = '${workspaceFolder}',
                -- launch_scene = true,

                -- name =    'Play in Editor',
                -- type =    'godot_mono',
                -- mode =    'playInEditor',
                -- request = 'launch',

        --         name = "Attach",
        --         type = "godot_mono",
        --         request = "attach",
        --         address = "localhost",
        --         port = 23685
        --     }
        -- }

        -- dap.configurations.cs = {
        --     {
        --         type = 'godot_mono',
        --         request = 'launch',
        --         name = 'Launch Scene',
        --         project = '${workspaceFolder}',
        --         launch_scene = true,
        --     }
        -- }

        require('mason-nvim-dap').setup {
            -- Makes a best effort to setup the various debuggers with
            -- reasonable debug configurations
            automatic_installation = true,

            -- You can provide additional configuration to the handlers,
            -- see mason-nvim-dap README for more information
            handlers = {
                function(config)
                    require('mason-nvim-dap').default_setup(config)
                end,
                codelldb = function(config)
                    local path = vim.fn.stdpath("data") .. "/mason/bin/codelldb"
                    config.adapters = {
                        type = "server",
                        port = "${port}",
                        executable = {
                            command = path, -- adjust as needed, must be absolute path
                            args = { "--port", "${port}" },
                            -- On windows you may have to uncomment this:
                            -- detached = false,
                        },
                    }
                    require('mason-nvim-dap').default_setup(config) -- don't forget this!
                end,
            },

            -- You'll need to check that you have the required things installed
            -- online, please don't ask me how to install them :)
            ensure_installed = {
                -- Update this to ensure that you have the debuggers for the langs you want
                'delve',
                'codelldb',
            },
        }

        -- Basic debugging keymaps, feel free to change to your liking!
        vim.keymap.set('n', '<leader>bc', function()
            -- (Re-)reads launch.json if present
            -- this lets us avoid typing in the path every time
            if vim.fn.filereadable(".vscode/launch.json") then
                require("dap.ext.vscode").load_launchjs(nil, {
                    codelldb = { "c", "cpp", "rs", "zig" },
                    delve = { "go" },
                })
            end
            dap.continue()
        end, { desc = 'Start/[C]ontinue' })
        vim.keymap.set('n', '<leader>bq', dap.terminate, { desc = '[Q]uit debug session' })
        vim.keymap.set('n', '<leader>br', dap.repl.toggle, { desc = 'Toggle [R]EPL' })
        vim.keymap.set('n', '<leader>bs', dap.step_into, { desc = '[S]tep Into' })
        vim.keymap.set('n', '<leader>bo', dap.step_out, { desc = 'Step [O]ut' })
        vim.keymap.set('n', '<leader>bv', dap.step_over, { desc = 'Step O[v]er' })
        vim.keymap.set('n', '<leader>bb', dap.toggle_breakpoint, { desc = 'Toggle [B]reakpoint' })
        vim.keymap.set('n', '<leader>bB', function()
            dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end, { desc = 'Set Conditional [B]reakpoint' })

        -- K for hover when DAP is active (then restore previous keymap)
        -- from https://github.com/mfussenegger/nvim-dap/wiki/Cookbook
        local api = vim.api
        local keymap_restore = {}
        dap.listeners.after['event_initialized']['me'] = function()
            for _, buf in pairs(api.nvim_list_bufs()) do
                local keymaps = api.nvim_buf_get_keymap(buf, 'n')
                for _, keymap in pairs(keymaps) do
                    if keymap.lhs == "K" then
                        table.insert(keymap_restore, keymap)
                        api.nvim_buf_del_keymap(buf, 'n', 'K')
                    end
                end
            end
            api.nvim_set_keymap(
                'n', 'K', '<Cmd>lua require("dap.ui.widgets").hover()<CR>', { silent = true })
        end

        dap.listeners.after['event_terminated']['me'] = function()
            for _, keymap in pairs(keymap_restore) do
                vim.print(keymap)
                vim.keymap.set(
                    keymap.mode,
                    keymap.lhs,
                    keymap.rhs or keymap.callback,
                    { silent = keymap.silent == 1, buffer = keymap.buffer }
                )
            end
            keymap_restore = {}
        end

        -- Dap UI setup
        -- For more information, see |:help nvim-dap-ui|
        dapui.setup {
            -- Set icons to characters that are more likely to work in every terminal.
            --    Feel free to remove or use ones that you like more! :)
            --    Don't feel like these are good choices.
            icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
            controls = {
                icons = {
                    pause = '⏸',
                    play = '▶',
                    step_into = '⏎',
                    step_over = '⏭',
                    step_out = '⏮',
                    step_back = 'b',
                    run_last = '▶▶',
                    terminate = '⏹',
                    disconnect = '⏏',
                },
            },
        }

        -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
        vim.keymap.set('n', '<leader>bu', dapui.toggle, { desc = 'Toggle Debug [U]I' })
        vim.keymap.set('n', '<leader>bf', dapui.float_element, { desc = 'Open [F]loating UI' })

        -- dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        -- dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        -- dap.listeners.before.event_exited['dapui_config'] = dapui.close
        -- dap.listeners.before.disconnect['dapui_config'] = dapui.close

        -- normally these functions take session and body arguments
        dap.listeners.after.event_initialized['daprepl_config'] = function(_, _) dap.repl.open() end
        dap.listeners.before.event_terminated['daprepl_config'] = function(_, _) dap.repl.close() end
        dap.listeners.before.event_exited['daprepl_config'] = function(_, _) dap.repl.close() end


        -- Install golang specific config
        require('dap-go').setup()
    end,
}
