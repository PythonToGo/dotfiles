return {
  "mfussenegger/nvim-dap",
  lazy = false,
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      dependencies = { "nvim-neotest/nvim-nio" },
    },
    "mxsdev/nvim-dap-vscode-js",
    {
      "microsoft/vscode-js-debug",
      version = "1.x",
      build = "npm install && npm run compile vsDebugServerBundle && mv dist out",
    },
  },

  keys = {
    { "<leader>d", function() require("dap").toggle_breakpoint() end },
    { "<leader>c", function() require("dap").continue() end },
    { "<F5>",      function() require("dap").step_over() end },
    { "<F6>",      function() require("dap").step_into() end },
    { "<F7>",      function() require("dap").step_out() end },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Setup dap-vscode-js
    require("dap-vscode-js").setup({
      node_path = "node",
      debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
      debugger_cmd = { "node", vim.fn.stdpath("data") .. "/lazy/vscode-js-debug/out/src/vsDebugServer.js" },
      log_file_path = vim.fn.stdpath("cache") .. "/dap_vscode_js.log", -- 로그 파일 경로
      log_file_level = vim.log.levels.DEBUG,                           -- 로그 레벨 (DEBUG, INFO, WARN, ERROR)
      log_console_level = vim.log.levels.INFO,
      adapters = { "pwa-node", "pwa-chrome", "node-terminal", "pwa-msedge", "pwa-extensionHost", "node", "chrome" },
    })

    -- Language-specific configurations
    for _, language in ipairs({ "typescript", "javascript", "javascriptreact", "typescriptreact" }) do
      require("dap").configurations[language] = {
        {
          type = "pwa-node",
          request = "attach",
          processId = require("dap.utils").pick_process,
          name = "Attach to running Node process",
          sourceMaps = true,
          resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
          cwd = "${workspaceFolder}/src",
          skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
        },
        {
          type = "pwa-chrome",
          name = "Launch Chrome for debugging",
          request = "launch",
          url = "http://localhost:5173",
          sourceMaps = true,
          protocol = "inspector",
          port = 9222,
          webRoot = "${workspaceFolder}/src",
          skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
        },
        language == "javascript" and {
          type = "pwa-node",
          request = "launch",
          name = "Launch file in new Node process",
          program = "${file}",
          cwd = "${workspaceFolder}",
        } or nil,
      }
    end

    -- Python debuggin setting
    dap.adapters.python = {
      type = "executable",
      command = "/opt/homebrew/bin/python3",
      args = { "-m", "debugpy.adapter" },
    }
    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
          return "/opt/homebrew/bin/python3"
        end,
      },
    }


    -- Setup dap-ui
    dapui.setup()

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
}
