--[[ Imports ]]
require('plugins')  -- plugins
require('vars')     -- Variables
require('opts')     -- Options
require('keys')     -- Keymaps
require('plug-config')
require('lsp-config')

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile | echo PackerCompile complete..',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

--[[ dash config, alpha.nvim ]]
local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')
dashboard.section.buttons.val = {
  dashboard.button( "t r", "  Recent Files" , "<cmd>Telescope frecency<CR>"),
  dashboard.button( "n", "  New file" , "<cmd>ene<CR>"),
  dashboard.button( "e", "  Explore NvimTree" , "<cmd>NvimTreeToggle<CR>"),
  dashboard.button( "t f", "  Find Files" , "<cmd>Telescope find_files<CR>"),
  dashboard.button( "t p", "  Projects" , "<cmd>Telescope project<CR>"),
  dashboard.button( "c", "  NVIM Config" , "<cmd>e $HOME/.config/nvim/init.lua<CR>"),
  dashboard.button( "s", "  Run PackerSync" , "<cmd>ene<bar>:PackerSync<CR>"),
  dashboard.button( "q", "  Quit NVIM ", "<cmd>qa<CR>"),
}
dashboard.section.footer.val = {
  [[ ]],
  [[    lean, mean, (all lua) neovim config by linuxkarl ]],
  [[ telegram: @linuxkarl or email: karlhaines615@yahoo.com ]],
}
require('neovide')
dashboard.config.opts.noautocmd = true
vim.cmd[[autocmd User AlphaReady echo 'ready']]
alpha.setup(dashboard.opts)
