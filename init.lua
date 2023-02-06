local base_dir = vim.fn.stdpath("config")

if not vim.tbl_contains(vim.opt.rtp:get(), base_dir) then
	vim.opt.rtp:append(base_dir)
end

require("lvim.bootstrap"):init(base_dir)

require("lvim.config"):load()

local plugins = require("lvim.plugins")

require("lvim.plugin-loader").load({ plugins, lvim.plugins })

require("lvim.core.theme").setup()

local Log = require("lvim.core.log")
Log:debug("Starting Neovim")

local commands = require("lvim.core.commands")
commands.load(commands.defaults)
