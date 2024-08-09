local vim = vim  -- reduce lsp complaining
local M = {}

M.on_attach = function (bufnr)
  local gs = package.loaded.gitsigns

  local opts = {buffer = bufnr}

  local mappings = {}

  mappings.n = {
    ["]c"] = {
      function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end,
      "Next hunk"
    },
    ["[c"] = {
      function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end,
      "Previous hunk"
    },
    ["<leader>ga"] = {gs.stage_hunk, "Git add hunk"},
    ["<leader>gr"] = {gs.reset_hunk, "Git reset hunk"},
    ["<leader>gA"] = {gs.stage_buffer, "Git add file"},
    ["<leader>gR"] = {gs.reset_buffer, "Git reset file"},
    ["<leader>gu"] = {gs.undo_stage_hunk, "Unod stage hunk"},
    ["<leader>gp"] = {gs.preview_hunk, "Preview hunk"},
    ["<leader>gb"] = {function() gs.blame_line{full=true} end, "Git blame hunk"},
    ["<leader>gB"] = {gs.toggle_current_line_blame, "Toggle current line blame"},
    ["<leader>gd"] = {gs.diffthis, "Git diff"},
    ["<leader>gtd"] = {gs.toggle_deleted, "Git toggle deleted"},
  }
  mappings.v = {
    ["<leader>ga"] = {function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, "Git add"},
    ["<leader>gr"] = {function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, "Git reset"},
  }

  require("utils").set_mappings(mappings, opts)
end

M.signs_staged_enable = false

return M
