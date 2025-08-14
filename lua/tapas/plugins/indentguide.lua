return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local hooks = require("ibl.hooks")

      -- Highlight for current scope
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "IndentScope", { fg = "#61AFEF", nocombine = true })
      end)

      require("ibl").setup({
        indent = {
          char = "│",
          highlight = { "NonText" }, -- normal indent guides use dim color
        },
        scope = {
          enabled = true,
          highlight = { "IndentScope" }, -- only current scope gets bright color
        },
        exclude = {
          filetypes = { "help", "dashboard", "nvim-tree", "toggleterm" },
        },
      })

      -- This makes sure the scope updates properly on move
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },
}

