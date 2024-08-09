-- define common options
local opts = {
  noremap = true,      -- non-recursive
  silent = true,       -- do not show message
}

local M = {}

M.merge_tables = function(first_table, second_table)
  for k, v in pairs(second_table) do first_table[k] = v end
  return first_table
end

M.set_mappings = function(mappings, mapping_opts)
  mapping_opts = mapping_opts or {}
  for mode, keymap in pairs(mappings) do
    for key, binding_and_desc in pairs(keymap) do
      local binding = binding_and_desc[1]
      local binding_opts = M.merge_tables(opts, mapping_opts)
      binding_opts.desc = binding_and_desc[2]
      vim.keymap.set(mode, key, binding, binding_opts)
    end
  end
end

return M
