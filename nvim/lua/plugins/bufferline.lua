return {
  'akinsho/bufferline.nvim',                -- 플러그인 이름
  requires = 'nvim-tree/nvim-web-devicons', -- 아이콘 지원을 위한 의존성
  config = function()
    require('bufferline').setup({
      options = {
        numbers = "buffer_id",          -- 버퍼 번호를 표시
        diagnostics = "nvim_lsp",       -- LSP 진단 정보 표시
        show_buffer_close_icons = true, -- 닫기 아이콘 표시
        separator_style = "slant",      -- 구분선 스타일 ('slant', 'thick', 'thin' 등)
        always_show_bufferline = true,  -- 항상 bufferline 표시
      }
    })
  end
}
