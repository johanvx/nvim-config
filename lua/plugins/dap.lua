return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    keys = {
      {
        "<Leader>GB",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Set breakpoint",
      },
      {
        "<Leader>Gb",
        "<Cmd>DapToggleBreakpoint<CR>",
        desc = "Toggle breakpoint",
      },
      {
        "<Leader>GC",
        "<Cmd>lua require('dap').run_to_cursor()<CR>",
        desc = "Run to cursor",
      },
      { "<Leader>Gc", "<Cmd>DapContinue<CR>", desc = "Continue" },
      {
        "<Leader>Gg",
        "<Cmd>lua require('dap').goto_()<CR>",
        desc = "Goto",
      },
      { "<Leader>Gi", "<Cmd>DapStepInto<CR>", desc = "Step into" },
      { "<Leader>Gj", "<Cmd>lua require('dap').down()<CR>", desc = "Down" },
      { "<Leader>Gk", "<Cmd>lua require('dap').up()<CR>", desc = "Up" },
      { "<Leader>GO", "<Cmd>DapStepOut<CR>", desc = "Step out" },
      { "<Leader>Go", "<Cmd>DapStepOver<CR>", desc = "Step out" },
      { "<Leader>Gp", "<Cmd>lua require('dap').pause()<CR>", desc = "Pause" },
      { "<Leader>Gq", "<Cmd>DapTerminate<CR>", desc = "Terminate" },
      { "<Leader>Gr", "<Cmd>DapToggleRepl<CR>", desc = "Toggle REPL" },
      {
        "<Leader>Gw",
        "<Cmd>lua require('dap.ui.widgets').hover()<CR>",
        desc = "Widgets",
      },
    },
    opts = {
      adapters = {
        gdb_python = {
          type = "executable",
          command = vim.fn.exepath("gdb"),
          args = { "--args", "python" },
        },
      },
      configurations = {
        python = {
          {
            name = "GDB Python",
            type = "gdb_python",
            request = "launch",
            program = function()
              return vim.fn.input(
                "gdb --args python ",
                vim.fn.getcwd() .. "/",
                "file"
              )
            end,
          },
        },
      },
    },
    config = function(_, opts)
      local dap = require("dap")
      dap.adapters = vim.tbl_extend("keep", dap.adapters, opts.adapters)
      dap.configurations =
        vim.tbl_extend("keep", dap.configurations, opts.configurations)
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    keys = {
      {
        "<Leader>Ge",
        "<Cmd>lua require('dapui').eval()<CR>",
        mode = { "n", "v" },
        desc = "Eval",
      },
      {
        "<Leader>Gu",
        "<Cmd>lua require('dapui').toggle()<CR>",
        desc = "Toggle UI",
      },
    },
    opts = {},
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    opts = {
      handlers = {
        -- -- This is the default handler
        -- function(config)
        --   require("mason-nvim-dap").default_setup(config)
        -- end,
        -- python = function(config)
        --   config.adapters = {
        --     type = "executable",
        --     command = vim.fn.exepath("gdb"),
        --     args = { "--args" },
        --   }
        --   require("mason-nvim-dap").default_setup(config)
        -- end,
      },
    },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    opts = {
      highlight_new_as_changed = true,
    },
  },
}

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:norl:
