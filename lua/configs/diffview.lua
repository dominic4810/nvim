local mappings = {
  n = {
    ["<leader>df"] = {
      "<cmd> DiffviewOpen <CR>", "Open Diffview"
    }
  }
}

require("utils").set_mappings(mappings)

