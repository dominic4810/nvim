local languages = {
  "c",
  "lua",
  "vim",
  "vimdoc",
  "query",
  "markdown",
  "markdown_inline",
  "python",
  "cpp",
  "cmake",
  "rust",
  "json",
  "yaml",
  "dockerfile",
  "toml",
  "xml",
  "bash",
}

-- async; needs the tree-sitter CLI to compile parsers
require("nvim-treesitter").install(languages)

-- python folds are handled by SimpylFold
local no_ts_fold = { python = true }

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true }),
  callback = function(args)
    local ok = pcall(vim.treesitter.start, args.buf)
    if ok and not no_ts_fold[args.match] then
      vim.wo[0][0].foldmethod = "expr"
      vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end
  end,
})
