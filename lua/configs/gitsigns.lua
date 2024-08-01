local vim = vim  -- reduce lsp complaining
local M = {}

M.on_attach = function (bufnr)
  local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map('n', '<leader>ga', gs.stage_hunk)
    map('n', '<leader>gr', gs.reset_hunk)
    map('v', '<leader>ga', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('v', '<leader>gr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '<leader>gA', gs.stage_buffer)
    map('n', '<leader>gR', gs.reset_buffer)
    map('n', '<leader>gu', gs.undo_stage_hunk)
    map('n', '<leader>gp', gs.preview_hunk)
    map('n', '<leader>gb', function() gs.blame_line{full=true} end)
    map('n', '<leader>gB', gs.toggle_current_line_blame)
    map('n', '<leader>gd', gs.diffthis)
    map('n', '<leader>gD', function() gs.diffthis('~') end)
    map('n', '<leader>gtd', gs.toggle_deleted)
end

M.signs_staged_enable = false

return M
