-- TODO:
-- make Telescope and packer work together
-- popup.nvim
-- show whitespace
-- Keymaps and leader pages

--[[ Imports ]]
require('plugins')		-- plugins
require('vars')   -- Variables
require('opts')   -- Options
require('keys')   -- Keymaps
--[[ Plugin setup ]]
require('plug-config')
--[[ LSP setup ]]
require('lsp-config')

--[[ dash config, alpha.nvim ]]
local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')
dashboard.section.buttons.val = {
  dashboard.button( "t r", "  Recent Files" , ":Telescope frecency<CR>"),
  dashboard.button( "n", "  New file" , ":ene<CR>"),
  dashboard.button( "e", "  Explore NvimTree" , ":NvimTreeToggle<CR>"),
  dashboard.button( "t f", "  Find Files" , ":Telescope find_files<CR>"),
  dashboard.button( "t p", "  Projects" , ":Telescope project<CR>"),
  dashboard.button( "c", "  NVIM Config" , ":e $HOME/.config/nvim/init.lua<CR>"),
  dashboard.button( "s", "  Run PackerSync" , ":ene<bar>:PackerSync<CR>"),
  dashboard.button( "q", "  Quit NVIM ", ":qa<CR>"),

}
dashboard.section.footer.val = {
  [[ ]],
  [[    lean, mean, (all lua) neovim config by linuxkarl ]],
  [[ telegram: @linuxkarl or email: karlhaines615@yahoo.com ]],
}
dashboard.config.opts.noautocmd = true
vim.cmd[[set background=]]
vim.cmd[[autocmd User AlphaReady echo 'ready']]
alpha.setup(dashboard.opts)
