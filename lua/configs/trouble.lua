local mappings = {}

mappings.n = {
  ["<leader>tt"] = {"<Cmd>Trouble diagnostics toggle<CR>", "Toggle trouble"},
  ["<leader>tb"] = {"<Cmd>Trouble diagnostics toggle filter.buf=0<CR>", "List buffer diagnostics"},
  ["<leader>tw"] = {"<Cmd>Trouble diagnostics toggle filter.workspace=0<CR>", "List workspace diagnostics"},
  ["<leader>tr"] =  {
    "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    "LSP Definitions / references / ... (Trouble)",
  },
}

require("utils").set_mappings(mappings)

return {}
