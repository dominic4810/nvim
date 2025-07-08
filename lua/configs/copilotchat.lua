local mappings = {}

mappings.n = {
  ["<leader>cc"] = { "<cmd>CopilotChat<CR>", "Open CopilotChat" },
}

require("utils").set_mappings(mappings)
