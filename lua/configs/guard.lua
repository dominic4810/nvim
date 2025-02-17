local mappings = {}

mappings.n = {
  ["<leader>fm"] = {"<Cmd>GuardFmt<CR>", "Format"}
}

require("utils").set_mappings(mappings)

local ft = require('guard.filetype')

-- Assuming you have guard-collection
ft('python'):fmt({
  cmd = 'yapf',
  fname = false,
  stdin = true,
})
            :append('isort')
            :lint('pylint')

ft('json'):fmt({
  cmd = 'jq',
  fname = false,
  stdin = true,
})

-- Call setup() LAST!
local vim = vim
vim.g.guard_config = {
    -- the only options for the setup function
    fmt_on_save = false,
    -- Use lsp if no formatter was defined for this filetype
    lsp_as_default_formatter = false,
}
