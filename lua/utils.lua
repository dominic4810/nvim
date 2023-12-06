-- define common options
local opts = {
  noremap = true,      -- non-recursive
  silent = true,       -- do not show message
}

local M = {}

M.set_mappings = function(mappings)
  for mode, keymap in pairs(mappings) do
    for key, binding_and_desc in pairs(keymap) do
      local binding_opts = opts
      binding = binding_and_desc[1]
      binding_opts.desc = binding_and_desc[2]
      vim.keymap.set(mode, key, binding, binding_opts)
    end
  end
end

return M
