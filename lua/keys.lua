--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

--[[ setup g:mapleader ]]
map('n', ',', '', {})
vim.g.mapleader = ','

options = {
  noremap = true
}
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
  e = { "<cmd>NvimTreeToggle<CR>", "Explore NvimTree" },
  n = { "<cmd>e $MYVIMRC<cr>", "Neovim configuration" },
  f = {
    name = "File functions",
    n = { "<cmd>ene<CR>", "New file" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
    f = { "<cmd>Telescope frecency<cr>", "Frequently used files" },
    z = { "<cmd>Telescope find_files<cr>", "Find files" },
    b = { "<cmd>Telescope file_browser<cr>", "Folder browser" },
  },
  b = {
    name = "Buffer functions",
    l = { "<cmd>Telescope buffers<cr>", "Telescope buffer picker" },
    a = { ":badd ", "Add new buffer" },
    d = { "<cmd>bdelete<cr>", "Delete buffer" },
    n = { "<cmd>bnext<cr>", "Next buffer" },
    p = { "<cmd>bprev<cr>", "Previous buffer" },
  },
  p = {
    name = "Packer functions",
    p = { "<cmd>PackerStatus<cr>", "Run PackerStatus" },
    s = { "<cmd>PackerSync<cr>", "Run PackerSync" },
    i = { "<cmd>PackerInstall<cr>", "Run PackerInstall" },
    c = { "<cmd>PackerClean<cr>", "Run PackerClean" },
    x = { "<cmd>PackerCompile<cr>", "Run PackerCompile" },
  },
  t = {
    name = "Telescope", -- optional group name
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme browser" },
    f = "files",
    fb = { "<cmd>Telescope file_browser<cr>", "File/folder browser" },
    ff = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    fr = { "<cmd>Telescope frecency<cr>", "Frequently used Files", noremap=false },
    fo = { "<cmd>Telescope oldfiles<cr>", "Open recent File", noremap=false },
    u = { "<cmd>Telescope symbols picker<cr>", "Symbol browser" },
    p = { "<cmd>Telescope projects picker<cr>", "Project browser" },
    s = {
      name = "Sessions",
      c = { "<cmd>PosClose<cr>", "Session close" },
      d = { "<cmd>PosDelete<cr>", "Session delete" },
      l = { "<cmd>PosList<cr>", "Session list" },
      o = { "<cmd>PosLoad<cr>", "Session open" },
      m = { "<cmd>PosMigrate<cr>", "Session migrate" },
      s = { "<cmd>PosSave<cr>", "Session save" },
    },
    v = { "<cmd>Telescope vim_options<cr>", "vim options" },
  },
  ["1"] = "which_key_ignore",  -- special label to hide it in the popup
  --b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
}, { prefix = "<leader>" })
