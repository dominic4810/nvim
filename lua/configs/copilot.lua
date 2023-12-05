local vim = vim

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

local mappings = {}

mappings.i = {
  ["<C-h>"] = {function () vim.fn["copilot#Next"]() end, "Copilot next"},
  ["<C-l>"] = {function () vim.fn["copilot#Previous"]() end, "Copilot previous"},
  ["<C-x>"] = {function () vim.fn["copilot#Dismiss"]() end, "Dismiss copilor"},
}

require("utils").set_mappings(mappings)
