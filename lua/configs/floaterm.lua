local mappings = {}

mappings.n = {
  ["<leader>tn"] = {"<Cmd>FloatermNew<CR>", "Create new terminal"},
  ["<leader>tm"] = {"<Cmd>FloatermToggle<CR>", "Toggle terminal"}
}

mappings.t = {
  ["<leader>tm"] = {"<Cmd>FloatermToggle<CR>", "Toggle terminal"}
}

require("utils").set_mappings(mappings)
