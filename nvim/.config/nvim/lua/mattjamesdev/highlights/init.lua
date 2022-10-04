-- Custom highlights for various things
local telescope = require("mattjamesdev.highlights.telescope")
local nvim_tree = require("mattjamesdev.highlights.nvim_tree")

local load_highlight = require("mattjamesdev.functions").load_highlight

-- require("mattjamesdev.functions").load_highlight(telescope)
-- load_highlight(telescope)
load_highlight(nvim_tree)
