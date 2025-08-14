local opt = vim.opt
local g = vim.g

-- disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- General settings
opt.number = true
opt.relativenumber = false
opt.wrap = false
opt.cursorline = true
opt.termguicolors = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.signcolumn = "yes"

-- Tabs & indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- Clipboard
opt.clipboard = "unnamedplus"

-- Leader key
g.mapleader = " "
g.maplocalleader = " "

