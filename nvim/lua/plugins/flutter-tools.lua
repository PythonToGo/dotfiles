require("flutter-tools").setup {
  ui = {
    border = "rounded",
  },
  decorations = {
    statusline = {
      app_verson = true,
      device = true,
    },
  },
  lsp = {
    on_attach = function(client, bufnr)
      -- keymap for lsp
      local buf_map = function(mode, lhs, rhs, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, lhs, rhs, opts)
      end
      buf_map("n", "gd", "<cmd>lua vim.lsp.bufdefinition()<CR>")
      buf_map("n", "K", "<cmd>lua vim.lsp.buf.hover().<CR>")
    end,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  },
  dev_log = {
    enabled = true,
    open_cmd = "tabedit"
  },
}
