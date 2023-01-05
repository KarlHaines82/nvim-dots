--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

--[[ setup g:mapleader ]]
map('n', ',', '', {})
vim.g.mapleader = ','

options = {
  noremap = true
}

map('n', '<leader><esc>', '<cmd>nohlsearch<cr>', options)
map('n', '<leader>r', ':source $MYVIMRC<cr>', options)
map('n', '<leader>bn', '<cmd>bnext<cr>', options)
map('n', '<leader>bp', '<cmd>bprev<cr>', options)
map('n', '<leader>bp', ':badd ', options)
map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', options)
map('n', '<leader>tt', '<cmd>terminal<cr>', options)
map('n', '<leader>tc', '<cmd>Telescope colorscheme<cr>', options)
map('n', '<leader>tg', '<cmd>Telescope live_grep<cr>', options)
map('n', '<leader>tfr', '<cmd>Telescope frecency<cr>', options)
map('n', '<leader>tff', '<cmd>Telescope find_files<cr>', options)
map('n', '<leader>tfb', '<cmd>Telescope file_browser<cr>', options)
map('n', '<leader>tb', '<cmd>Telescope buffers<cr>', options)
map('n', '<leader>th', '<cmd>Telescope help_tags<cr>', options)
map('n', '<leader>tP', '<cmd>Telescope project<cr>', options)
map('n', '<leader>tp', '<cmd>Telescope possession list<cr>', options)
map('n', '<leader>tr', '<cmd>Telescope oldfiles<cr>', options)
map('n', '<leader>ts', '<cmd>Telescope symbols<cr>', options)
map('n', '<leader>qq', '<cmd>qa!<cr>', options)
map('n', '<leader>wq', '<cmd>wqa!<cr>', options)

local wk = require("which-key")
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

wk.register({
  t = {
    name = "Telescope", -- optional group name
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme browser" },
    ff = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    fr = { "<cmd>Telescope frecency<cr>", "Frequently Used Files", noremap=false },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false },
    u = { "<cmd>Telescope symbols<cr>", "Symbol browser" },
    p = { "<cmd>Telescope project<cr>", "Project browser" },
    s = {
      name = "Sessions",
      c = { "<cmd>PosClose<cr>", "Session close" },
      d = { "<cmd>PosDelete<cr>", "Session delete" },
      l = { "<cmd>PosList<cr>", "Session list" },
      o = { "<cmd>PosLoad<cr>", "Session open" },
      m = { "<cmd>PosMigrate<cr>", "Session migrate" },
      s = { "<cmd>PosSave<cr>", "Session save" },
    },
  },
  f = {
    name = "File actions",
    n = { "<cmd>ene<CR>", "New file" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
    f = { "<cmd>Telescope frecency", "Frequently used files" },
    z = { "<cmd>Telescope find_files", "Find files" },
    b = { "<cmd>Telescope file_browser", "Folder browser" },
  },
  ["1"] = "which_key_ignore",  -- special label to hide it in the popup
  b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
}, { prefix = "<leader>" })
