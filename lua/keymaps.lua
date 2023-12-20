vim.g.mapleader = " "


local mappings = {}

-----------------
-- Normal mode --
-----------------

mappings.n = {
  ["<Esc>"] = { ":noh <CR>", "Clear highlights" },
  -- switch between windows
  ["<C-h>"] = { "<C-w>h", "Window left" },
  ["<C-l>"] = { "<C-w>l", "Window right" },
  ["<C-j>"] = { "<C-w>j", "Window down" },
  ["<C-k>"] = { "<C-w>k", "Window up" },
  -- resize with arrows
  ["<C-Up>"] = { ":resize -2<CR>", "Resize window up" },
  ["<C-Down>"] = { ":resize =2<CR>", "Resize window down" },
  ["<C-Left>"] = { ":vertical resize -2<CR>", "Resize window left" },
  ["<C-Right>"] = { ":vertical resize +2<CR>", "Resize window right" },
  -- line numbers
  ["<leader>n"] = { ":set nu!<CR>", "Toggle line number" },
  ["<leader>nr"] = { ":set rnu!<CR>", "Toggle relative line number" },
  -- fold
  ["f"] = { "za", "Toggle fold" },
  ["F"] = { "zA", "Toggle all fold" },
  ["<leader>o"] = {"zM", "Close all fold"},
  ["<leader>O"] = {"zR", "Open all fold"},
  -- wrapping
  ["<leader>wy"] = {"<cmd>:set wrap<cr>", "Enable wrap"},
  ["<leader>wn"] = {"<cmd>:set nowrap<cr>", "Disable wrap"},
  -- hop
  ["<leader><leader>w"] = {
    function()
      require('hop').hint_words({require('hop.hint').HintDirection.AFTER_CUROSR, current_line_only = false})
    end,
    "Hop by word, forwards"},
  ["<leader><leader>l"] = {
    function()
      require('hop').hint_lines({require('hop.hint').HintDirection.AFTER_CUROSR, current_line_only = false})
    end,
    "Hop by line, forwards"},
  ["<leader><leader>c"] = {
    function()
      require('hop').hint_char1({require('hop.hint').HintDirection.AFTER_CUROSR, current_line_only = false})
    end,
    "Hop by char forwards"},
  ["<leader><leader>p"] = {
    function()
      require('hop').hint_patterns({require('hop.hint').HintDirection.AFTER_CUROSR, current_line_only = false})
    end,
    "Hop by pattern, forwards"},
  -- symbols
  ["<leader>s"] = {"<cmd>SymbolsOutline<cr>", "Symbols Outline"},
}

-----------------
-- Visual mode --
-----------------

mappings.v = {
  -- indent line
  ["<"] = { "<gv", "Indent line" },
  [">"] = { ">gv", "Indent line" },
  -- hop
  ["<leader><leader>w"] = {
    function()
      require('hop').hint_words({require('hop.hint').HintDirection.AFTER_CUROSR, current_line_only = false})
    end,
    "Hop by word, forwards"},
  ["<leader><leader>l"] = {
    function()
      require('hop').hint_lines({require('hop.hint').HintDirection.AFTER_CUROSR, current_line_only = false})
    end,
    "Hop by line, forwards"},
  ["<leader><leader>c"] = {
    function()
      require('hop').hint_char1({require('hop.hint').HintDirection.AFTER_CUROSR, current_line_only = false})
    end,
    "Hop by char forwards"},
  ["<leader><leader>p"] = {
    function()
      require('hop').hint_patterns({require('hop.hint').HintDirection.AFTER_CUROSR, current_line_only = false})
    end,
    "Hop by pattern, forwards"},
}

require("utils").set_mappings(mappings)
