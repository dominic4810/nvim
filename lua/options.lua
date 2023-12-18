local opt = vim.opt
-- Hint: use `:h <option>` to figure out the meaning if needed
opt.clipboard = 'unnamedplus'   -- use system clipboard 
opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.mouse = "a"

-- Tab
opt.tabstop = 2                 -- number of visual spaces per TAB
opt.softtabstop = 2             -- number of spacesin tab when editing
opt.shiftwidth = 2              -- insert 4 spaces on a tab
opt.expandtab = true            -- tabs are spaces, mainly because of python
opt.smartindent = true

-- UI config
opt.number = true               -- show absolute number
opt.relativenumber = true       -- add numbers to each line on the left side
opt.splitbelow = true           -- open new vertical split bottom
opt.splitright = true           -- open new horizontal splits right
opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
opt.signcolumn = "yes"
opt.undofile = true
opt.scrolloff = 20
opt.colorcolumn = "80,120"
opt.showmode = false
opt.scrolloff = 15

-- Searching
opt.incsearch = true            -- search as characters are entered
opt.hlsearch = true             -- do not highlight matches
opt.ignorecase = true           -- ignore case in searches by default
opt.smartcase = true            -- but make it case sensitive if an uppercase is entered

-- End of buffer
opt.fillchars = { eob = " " }   -- automatically add line

-- Fold
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) ]]
opt.fillchars = "fold: "
