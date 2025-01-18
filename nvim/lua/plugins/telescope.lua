local mapKey = require("utils.keyMapper").mapKey

return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      -- File Search
      mapKey("<leader>ff", builtin.find_files)
      -- Live Grep (Searching Text)
      mapKey("<leader>fg", builtin.live_grep)
      -- Search opened buffers
      mapKey("<leader>fb", builtin.buffers)
      mapKey("<leader>fh", builtin.help_tags)
      -- mapKey:
      mapKey("<leader>gs", builtin.git_status, { desc = "Git Status" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
