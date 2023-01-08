--[[ Imports ]]
require('plugins')  -- plugins
require('vars')     -- Variables
require('opts')     -- Options
require('keys')     -- Keymaps
require('plug-config')
require('lsp-config')
if vim.g.neovide == true then
  require('neovide')
end
-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile | echo "PackerCompile complete.."',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})
--[[ dash config, alpha.nvim ]]
local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')
dashboard.section.header.val = {
[[    _   __                _          ]],
[[   / | / /__  ____ _   __(_)___ ___  ]],
[[  /  |/ / _ \/ __ \ | / / / __ `__ \ ]],
[[ / /|  /  __/ /_/ / |/ / / / / / / / ]],
[[/_/ |_/\___/\____/|___/_/_/ /_/ /_/  ]],
}
dashboard.section.buttons.val = {
  dashboard.button( "r", "  Frequent/recent files", "<cmd>Telescope frecency<CR>"),
  dashboard.button( "n", "  New file", "<cmd>ene<CR>"),
  dashboard.button( "e", "  Explore NvimTree", "<cmd>NvimTreeToggle<CR>"),
  dashboard.button( "f", "  Find files", "<cmd>Telescope find_files<CR>"),
  dashboard.button( "c", "  Neovim config", "<cmd>e $HOME/.config/nvim/init.lua<CR>"),
  dashboard.button("pl", "  Projects", "<cmd>Telescope project<CR>"),
  dashboard.button( "s", "  Session list", "<cmd>Telescope possession list<CR>"),
  dashboard.button("ps", "  Run PackerSync", "<cmd>ene<bar>:PackerSync<CR>"),
  dashboard.button( "q", "  Quit Neovim", "<cmd>qa<CR>"),
}
dashboard.section.footer.val = {
  [[ ]],
  [[   Lean, mean, (100% LUA) Neovim config by linuxkarl    ]],
  [[ telegram: @linuxkarl or email: karlhaines615@yahoo.com ]],
}
dashboard.config.opts.noautocmd = true
vim.cmd[[autocmd User AlphaReady echo 'ready']]
alpha.setup(dashboard.opts)
