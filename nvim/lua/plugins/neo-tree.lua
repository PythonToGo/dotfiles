return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  }
}
--return {
--  "nvim-neo-tree/neo-tree.nvim",
--  branch = "v3.x", -- 안정적인 최신 브랜치 사용
--  requires = {
--    "nvim-lua/plenary.nvim",
--    "nvim-tree/nvim-web-devicons", -- 아이콘 지원
--    "MunifTanjim/nui.nvim", -- UI 구성 요소
--  },
--  config = function()
--    require("neo-tree").setup({
--      filesystem = {
--        filtered_items = {
--          hide_dotfiles = false, -- 숨김 파일 표시
--          hide_gitignored = true,
--        },
--        follow_current_file = true,
--        hijack_netrw_behavior = "open_current", -- Netrw 비활성화
--        use_libuv_file_watcher = true,
--      },
--      window_picker = {
--        enable = true,
--        picker = require("window-picker").pick_window,
--      },
--    })
--  end,
--}
