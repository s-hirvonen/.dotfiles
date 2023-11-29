return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "mxsdev/nvim-dap-vscode-js",
      {
        "microsoft/vscode-js-debug",
        version = "1.x",
        build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
      },
    },
    config = function()
      local dap = require("dap")

      require("dap-vscode-js").setup({
        debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
        adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
      })

      for _, language in ipairs({ "typescript", "javascript", "typescriptreact" }) do
        dap.configurations[language] = {
          {
            -- node.js processes
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            sourceMaps = true,
            resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
            cwd = "${workspaceFolder}",
            skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
          },
          {
            -- single node.js files
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          -- only if language is javascript, offer this debug action
          language == "javascript"
              and {
                -- use nvim-dap-vscode-js's pwa-node debug adapter
                type = "pwa-node",
                -- launch a new process to attach the debugger to
                request = "launch",
                -- name of the debug action you have to select for this config
                name = "Launch file in new node process",
                -- launch current file
                program = "${file}",
                cwd = "${workspaceFolder}",
              }
            or nil,
        }
      end
    end,
    keys = {
      { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
      { "<leader>dr", "<cmd>DapContinue<cr>", desc = "Run or Continue Debugger" },
    },
  },
}
