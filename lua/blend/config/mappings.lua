local utils = require("blend.config.utils")

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- File management
map("n", "<C-s>", ":w<CR>", opts)
map("n", "<C-q>", ":q<CR>", opts)

-- Better navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)

map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map({ "i", "x", "n", "s" }, "<C-S>", "<cmd>wa<cr><esc>", { desc = "Save File" })

-- =====================
-- Lazy plugin keymaps (load after plugin is ready)
-- =====================

local plugin_keys = {
    -- NvimTree
    ["nvim-tree.lua"] = function()
        map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

        -- Window nav inside NvimTree
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "NvimTree",
            callback = function()
                local bufopts = { noremap = true, silent = true, buffer = true }
                map("n", "<C-h>", "<C-w>h", bufopts)
                map("n", "<C-j>", "<C-w>j", bufopts)
                map("n", "<C-k>", "<C-w>k", bufopts)
                map("n", "<C-l>", "<C-w>l", bufopts)
            end
        })
    end,

    ["BufferTabs.nvim"] = function()
        map("n", "<Tab>", "<cmd>bnext<CR>", opts)
        map("n", "<S-Tab>", "<cmd>bprevious<CR>", opts)
        map("n", "<leader>bt", "<cmd>BufferTabsToggle<CR>", opts)
        map("n", "<leader>bd", utils.smart_delete_buffer, opts)
    end,

    ["telescope.nvim"] = function()
        map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
        map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
        map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
        map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
        map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", opts)
        map("n", "<leader>fc", "<cmd>Telescope commands<CR>", opts)
        map("n", "<leader>fr", "<cmd>Telescope resume<CR>", opts)
        map("n", "<leader>ft", "<cmd>Telescope treesitter<CR>", opts)
    end,

    ["cheatsheet.nvim"] = function()
        map("n", "<leader>?", "<cmd>Cheatsheet<CR>", opts)
    end,
}

-- Hook into Lazy load event for each plugin
vim.api.nvim_create_autocmd("User", {
    pattern = "LazyLoad",
    callback = function(event)
        local name = event.data
        if plugin_keys[name] then
            plugin_keys[name]() -- run the mapping setup
        end
    end
})
