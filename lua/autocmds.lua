local neocfg = vim.fn.stdpath("config")
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
local packer = require("packer")

--[[ Automatically source and run PackerCompile/PackerSync on save (of init.lua or plugins.lua) ]]
local run_psync = function()
	vim.cmd([[luafile %]])
	packer.sync()
  vim.cmd([[source $MYVIMRC]])
end
local run_pcompile = function()
	vim.cmd([[luafile %]])
	packer.compile()
  print("PackerCompile complete")
	vim.cmd([[source $MYVIMRC]])
end
vim.api.nvim_create_autocmd("BufWritePost", {
	callback = run_pcompile,
	group = packer_group,
	pattern = neocfg .. "/init.lua",
})
vim.api.nvim_create_autocmd("BufWritePost", {
	callback = run_pcompile,
	group = packer_group,
	pattern = neocfg .. "/lua/*",
})
vim.api.nvim_create_autocmd("BufWritePost", {
	callback = run_psync,
	group = packer_group,
	pattern = neocfg .. "/lua/plugins.lua",
})
-- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
vim.api.nvim_create_autocmd("FileType",
{
	pattern = "zsh",
	callback = function()
		-- let treesitter use bash highlight for zsh files as well
		require("nvim-treesitter.highlight").attach(0, "bash")
	end,
})

