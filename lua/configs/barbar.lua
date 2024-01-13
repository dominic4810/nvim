local mappings = {}

mappings.n = {
  ["<Tab>"] = {"<Cmd>BufferNext<Cr>", "Next tab"},
  ["<S-Tab>"] = {"<Cmd>BufferPrevious<Cr>", "Previous tab"},
  ["<leader>bl"] = {"<Cmd>BufferMoveNext<Cr>", "Move buffer to next tab"},
  ["<leader>bh"] = {"<Cmd>BufferMovePrevious<Cr>", "Move buffer to previous tab"},
  ["<leader>x"] = {"<Cmd>BufferClose<Cr>", "Close buffer"},
  ["<leader>p"] = {"<Cmd>BufferPick<Cr>", "Pick buffer"},
}

require("utils").set_mappings(mappings)

local options = {
  icons = {
  }
}

return options
