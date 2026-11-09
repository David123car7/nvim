-- Debugging (C# / ASP.NET Core via netcoredbg)
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
    },
    keys = {
      { "<F5>", function() require("dap").continue() end, desc = "Debug: Start/Continue" },
      { "<F9>", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
      { "<F10>", function() require("dap").step_over() end, desc = "Debug: Step Over" },
      { "<F11>", function() require("dap").step_into() end, desc = "Debug: Step Into" },
      { "<F12>", function() require("dap").step_out() end, desc = "Debug: Step Out" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle Debug UI" },
      { "<leader>dx", function() require("dap").terminate() end, desc = "Stop Debugging" },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()
      require("nvim-dap-virtual-text").setup()

      dap.listeners.after.event_initialized["dapui"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui"] = function()
        dapui.close()
      end

      dap.adapters.coreclr = {
        type = "executable",
        command = "netcoredbg", -- installed by Mason
        args = { "--interpreter=vscode" },
      }

      -- Build, then let you pick the dll to launch (defaults to the first match in bin/Debug)
      local function pick_dll()
        vim.notify("Building project...", vim.log.levels.INFO)
        vim.fn.system({ "dotnet", "build", "-c", "Debug" })
        local dlls = vim.fn.glob(vim.fn.getcwd() .. "/bin/Debug/*/*.dll", false, true)
        local default = dlls[1] or (vim.fn.getcwd() .. "/bin/Debug/")
        return vim.fn.input("Path to dll: ", default, "file")
      end

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "Launch (ASP.NET Core)",
          request = "launch",
          program = pick_dll,
          cwd = "${workspaceFolder}",
          env = {
            ASPNETCORE_ENVIRONMENT = "Development",
            ASPNETCORE_URLS = "http://localhost:5000",
          },
        },
        {
          type = "coreclr",
          name = "Attach to process",
          request = "attach",
          processId = require("dap.utils").pick_process,
        },
      }
    end,
  },
}
