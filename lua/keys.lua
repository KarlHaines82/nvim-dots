--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

--[[ setup g:mapleader ]]
map('n', ',', '', {})
vim.g.mapleader = ','

options = {
  noremap = true
}

map('n', '<leader><esc>', ':nohlsearch<cr>', options)
map('n', '<leader>r', ':source $MYVIMRC<cr>', options)
map('n', '<leader>bn', ':bnext<cr>', options)
map('n', '<leader>bp', ':bprev<cr>', options)
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
map('n', '<leader>to', '<cmd>Telescope oldfiles<cr>', options)
map('n', '<leader>ts', '<cmd>Telescope symbols<cr>', options)
map('n', '<leader>qq', ':qa!<cr>', options)
map('n', '<leader>wq', ':wqa<cr>', options)
