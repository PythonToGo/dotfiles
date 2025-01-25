---@diagnostic disable: undefined-global
return {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  config = function()
    -- Folding options
    vim.o.foldcolumn = '0'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- LSP capabilites for folding range
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }
    -- Setup LSP servers manually
    local lspconfig = require("lspconfig")
    local servers = { 'clangd', 'pyright', 'ts_ls' }
    for _, server in ipairs(servers) do
      lspconfig[server].setup({
        capabilities = capabilities
      })
    end

    require('ufo').setup()
  end,
}
