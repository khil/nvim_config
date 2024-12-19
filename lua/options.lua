require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

local TAB_WIDTH = 4
local set = vim.opt
set.expandtab = true
set.tabstop = TAB_WIDTH
set.softtabstop = TAB_WIDTH
set.shiftwidth = TAB_WIDTH
set.smartindent = true
set.number = true
set.cursorline = true
set.wrap = false
--set.colorcolumn = 100
set.spell = true
set.completeopt = { "menu" }
