local mappings = {}

mappings.n = {
  ["<leader>fm"] = {"<Cmd>GuardFmt<CR>", "Format"}
}

require("utils").set_mappings(mappings)

local ft = require('guard.filetype')

-- Assuming you have guard-collection
-- ft('python'):fmt({
--   cmd = 'yapf',
--   fname = false,
--   stdin = true,
-- })
--             :append('isort')
--             :lint('pylint')

-- Call setup() LAST!
require('guard').setup({
    -- the only options for the setup function
    fmt_on_save = false,
    -- Use lsp if no formatter was defined for this filetype
    lsp_as_default_formatter = false,
})
