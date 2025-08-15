return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("dashboard").setup({
      theme = "doom",
      config = {
        header = {
          [[+------------------+]],
          [[|     BLENDVIM     |]],
          [[+------------------+]],
          "",
        },
        center = {
          { icon = "  ", desc = "Find File", key = "f", action = "Telescope find_files" },
          { icon = "  ", desc = "Recent Files", key = "r", action = "Telescope oldfiles" },
          { icon = "  ", desc = "Projects", key = "p", action = "Telescope projects" },
          { icon = "  ", desc = "Quit", key = "q", action = "qa" },
        },
        vertical_center = true,
      },
    })
  end,
}

