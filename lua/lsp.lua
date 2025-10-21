local vim = vim
local lspconfig = require('lspconfig')

-- Customized on_attach function
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)

local mappings = {
  n = {
    ["<leader>e"] = {vim.diagnostic.open_float, "Show diagnostic"},
    ["[d"] = {vim.diagnostic.goto_prev, "Go to next diagnostic"},
    ["]d"] = {vim.diagnostic.goto_next, "Got to previous diagnostic"},
    ["<leader>dd"] = {
      function ()
        vim.diagnostic.enable(false)
      end,
      "Disable diagnostics"
    },
    ["<leader>dD"] = {vim.diagnostic.enable, "Enable diagnostic"},
    ["<leader>fm"] = {vim.lsp.buf.format, "Format document"},
    ["gD"] = {vim.lsp.buf.definition, "Go to definition"},
  }
}

require("utils").set_mappings(mappings)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
    end, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  end
})

vim.lsp.config("lua_ls", {})
vim.lsp.enable("lua_ls")
vim.lsp.config("bash_ls", {})
vim.lsp.enable("bash_ls")

vim.lsp.config("jedi_language_server", {})
vim.lsp.enable("jedi_language_server")
vim.lsp.config("ruff", {})
vim.lsp.enable("ruff")

vim.lsp.config('ty', {
  settings = {
    ty = {
    }
  }
})
vim.lsp.enable('ty')
