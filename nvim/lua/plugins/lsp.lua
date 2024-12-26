-- Set Key Mapper
local keyMapper = require("utils.keyMapper").mapKey

return {
  -- Set :Mason
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Set :Mason-LSPConfig
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", -- Lua
          "ts_ls",  -- JavaScript/TypeScript
          "html",   -- HTML
          "cssls",  -- CSS
        },
      })
    end,
  },

  -- Neovim LSPConfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim", -- Lua
    },
    config = function()
      require("neodev").setup()

      -- Lua
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- JavaScript/TypeScript
      lspconfig.ts_ls.setup({})

      -- Setup Dart Server
      -- local lspconfig = require('lspconfig')
      lspconfig.dartls.setup {
        cmd = { "dart", "language-server" },
        filetypes = { "dart" },
        root_dir = lspconfig.util.root_pattern("pubspec.yaml"),
        settings = {
          dart = {
            enableSdkFormatter = true,
          },
        },
      }

      -- HTML
      lspconfig.html.setup({})

      -- CSS
      lspconfig.cssls.setup({})

      -- Lsp handler
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover,
        { border = "rounded" }
      )

      -- Key Mapper
      keyMapper("K", vim.lsp.buf.hover)
      keyMapper("gd", vim.lsp.buf.definition)
      keyMapper("gr", vim.lsp.buf.references)
      keyMapper("<leader>ca", vim.lsp.buf.code_action)
    end,
  },
}
