local vim = vim
-- Set up lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
local plugins = {
  -- colorscheme
  {
    "morhetz/gruvbox",
    lazy = false,
    config = function(_, _)
      require "configs.gruvbox"
    end
  },
  -- LSP stuff
  {
    "neovim/nvim-lspconfig",
    lazy = false,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = function()
      require "configs.mason"
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true 
  },
  -- LSP for rust analyzer
  {
    "simrat39/rust-tools.nvim",
    lazy = false,
    config = function(_, _)
      local rt = require("rust-tools")
      rt.setup{
        on_attach = function(_, bufnr)
          -- Hover actions
          vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
          -- Code action groups
          vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
      }
    end,
  },

  -- formatter and linters
  {
    "nvimdev/guard.nvim",
    lazy = false,
    dependencies = {
        "nvimdev/guard-collection",
    },
    config = function()
      require "configs.guard"
    end,
  },
  -- Autocomplete
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    lazy = true,
    dependencies = {
      -- snippets
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        config = function(_, _)
          require("configs.luasnip")
        end,
      },
      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },
      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",       -- buffer auto-completion
        "hrsh7th/cmp-path",         -- path auto-completion
        "hrsh7th/cmp-cmdline",      -- cmdline auto-completion
      },
    },
    config = function(_, _)
      require "configs.nvim-cmp"
    end,
  },
  -- comment
  {
    "numToStr/Comment.nvim",
    lazy = true,
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
    },
    config = function(_, opts)
      require("Comment").setup(opts)
    end,
  },
  -- git
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function(_, _)
      require("gitsigns").setup{on_attach = require("configs.gitsigns").on_attach}
    end,
  },
  -- indentaion guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    lazy = false,
    opts = function()
      local config = require("configs.blankline")
      require("ibl").setup(config)
    end,
  },
  -- treesitter (for better highlighting)
  {
    "nvim-treesitter/nvim-treesitter",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    lazy = false,
    opts = function()
      return require "configs.treesitter"
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  -- file managing , picker etc
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    opts = function()
      return require "configs.nvimtree"
    end,
    config = function(_, opts)
      require("nvim-tree").setup(opts)
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-lua/plenary.nvim"
    },
    build = "TSUpdate",
    lazy = false,
    opts = function()
      return require "configs.telescope"
    end,
    config = function(_, opts)
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },
  -- Tabline
  {
    "romgrk/barbar.nvim",
    init = function() vim.g.barbar_auto_setup = false end,
    lazy = false,
    opts = function ()
      return require "configs.barbar"
    end,
  },
  -- Github Copilot
  {
    "github/copilot.vim",
    lazy = false,
    config = function ()
      require "configs.copilot"
    end
  },
  -- vim surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  -- hop
  {
    "phaazon/hop.nvim",
    lazy = true,
    config = function()
      require("hop").setup()
    end,
  },
  -- symbols
  {
    "simrat39/symbols-outline.nvim",
    lazy = false,
    config = function()
      require("symbols-outline").setup()
    end,
  },
  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    opts = function()
      return require "configs.lualine"
    end,
    config = function(_, opts)
      require("lualine").setup(opts)
    end,
  },
  -- illuminate: highlight word under cursor
  {
    "RRethy/vim-illuminate",
    lazy = false,
    config = function()
      vim.g.Illuminate_delay = 0
    end,
  },
  -- trouble: show diagnostics in a list
  {
    "folke/trouble.nvim",
    lazy = false,
    opts = function()
      return require "configs.trouble"
    end,
  },
  -- whichkey
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
  },
  -- terminal with floatterm
  {
    "voldikss/vim-floaterm",
    lazy = false,
    config = function()
      require "configs.floaterm"
    end,
  },
  -- winbar
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    lazy = false,
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
  -- scroll bar
  {
    "petertriho/nvim-scrollbar",
    lazy = false,
    dependencies = {
      "kevinhwang91/nvim-hlslens",
    },
    config = function()
      require("scrollbar").setup(
        require "configs.scrollbar"
      )
      require("scrollbar.handlers.search").setup({})
      require("scrollbar.handlers.gitsigns").setup()
    end,
  },
  -- sticky scroll
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
  },
  -- Dressing for pretty UI
  {
    "stevearc/dressing.nvim",
    opts = {},
    lazy = false,
  },
}

local opts = {
  defaults = { lazy = true },

  ui = {
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
  },

  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
}

-- Set up plugins
require("lazy").setup(plugins, opts)
