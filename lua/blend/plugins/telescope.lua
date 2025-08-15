return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- faster sorting
    },
    cmd = "Telescope",
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          prompt_prefix = "   ",
          selection_caret = " ",
          path_display = { "smart" },
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = { prompt_position = "top", preview_width = 0.55 },
            vertical = { mirror = false },
          },
          file_ignore_patterns = { "node_modules", ".git/" },
        },
        pickers = {
          find_files = { hidden = true },
        },
      })

      pcall(telescope.load_extension, "fzf") -- enable fzf-native if built
    end,
  },
}

