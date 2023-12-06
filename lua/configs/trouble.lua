local mappings = {}

mappings.n = {
  ["<leader>tt"] = {"<Cmd>TroubleToggle<CR>", "Toggle trouble"},
  ["<leader>tw"] = {"<Cmd>TroubleToggle workspace_diagnostics<CR>", "Toggle trouble workspace diagnostics"},
  ["<leader>tf"] = {"<Cmd>TroubleToggle document_diagnostics<CR>", "Toggle trouble document diagnostics"},
  ["<leader>tr"] = {"<Cmd>TroubleToggle lsp_references<CR>", "List references"},
  ["<leader>td"] = {"<Cmd>TroubleToggle lsp_definitions<CR>", "List definitons"},
}

require("utils").set_mappings(mappings)

return {}
