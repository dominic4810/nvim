-- set keymaps
local mappings = {
  n = {
    -- find
    ["<leader>fF"] = { "<cmd> Telescope file_browser <CR>", "Telescope file browser" },
  }
}
require("utils").set_mappings(mappings)

-- keybinds in file browser
local fb_actions = require("telescope._extensions.file_browser.actions")
local actions = require("telescope.actions")
require("telescope").setup({
  extensions = {
    file_browser = {
      initial_mode = "normal",
      mappings = {
        n = {
          h = fb_actions.goto_parent_dir,
          j = actions.move_selection_worse,
          k = actions.move_selection_better,
          l = actions.select_default, -- action for going into directories and opening files
          ["<C-h>"] = fb_actions.toggle_hidden,
        }
      },
    },
  },
})

