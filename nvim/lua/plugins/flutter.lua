return {
  'akinsho/flutter-tools.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-lspconfig',         -- Dart LSP
    'stevearc/dressing.nvim', -- UI 개선 (선택 사항)
  },
  config = function()
    require("flutter-tools").setup {
      lsp = {
        color = {
          enabled = true, -- LSP에서 색상 하이라이팅 활성화
        },
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
        },
      },
      debugger = {
        enabled = true,     -- DAP 활성화
        run_via_dap = true, -- DAP으로 실행
      },
    }
  end
}
