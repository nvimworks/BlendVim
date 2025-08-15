return {
  "sontungexpt/sttusline",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = { "BufEnter" }, 
  config = function(_, opts)
    require("sttusline").setup({
      statusline_color = "StatusLine",
      laststatus = 3,
      disabled = {
        filetypes = { "NvimTree", "lazy" },
        buftypes = { "terminal" },
      },
      components = {
        "mode",
        "git-branch",
        "filename",
        "git-diff",
        "%=",
        "indent",
        "encoding",
        "pos-cursor",
        "pos-cursor-progress",
      },
    })
  end,
}

