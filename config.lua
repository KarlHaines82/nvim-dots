-- vim options
local vopt = vim.opt
-- vim options
vopt.encoding = "utf8"
vopt.shiftwidth = 2
vopt.tabstop = 2
vopt.foldenable = false
vopt.ignorecase = true
vopt.pumblend = 15
vopt.smarttab = true
vopt.expandtab = true
vopt.smartindent = true
vopt.smartcase = true
vopt.cursorline = true
vopt.cursorlineopt = "both"
-- general
lvim.log.level = "info"
lvim.format_on_save = {
	enabled = true,
	pattern = "*.lua",
	timeout = 1000,
}
-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = ","
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["e"] = { "<cmd>Neotree toggle<cr>", "Neo-tree file explorer" }
lvim.builtin.which_key.mappings["U"] = { "<cmd>Telescope symbols<cr>", "Telescope symbol browser" }
-- setup nedvide if its running
require("neovide")
-- set a colorscheme and transparency
require("tokyonight").setup({
	transparent = true,
	style = "storm",
})
lvim.colorscheme = "tokyonight"
lvim.builtin.lualine.options.theme = "tokyonight"

lvim.builtin.alpha.active = false
lvim.builtin.terminal.active = true
-- lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
-- lvim.builtin.nvimtree.respect_buf_cwd = true
-- lvim.builtin.telescope.builtin.symbols{ sources = { "emoji", "kaomoji", "gitmoji" } }
lvim.builtin.nvimtree.enable = false
lvim.builtin.lualine.options.icons_enabled = true
lvim.builtin.lualine.options.section_separators = { left = " ", right = " " }
lvim.builtin.lualine.options.component_separators = { left = " ", right = " " }
lvim.builtin.bufferline.options = { separator_style = { " ", " " } }
lvim.builtin.bufferline.separator = ""
lvim.builtin.bufferline.options.offsets = {
	{
		filetype = "neo-tree",
		text = "Neo-tree",
	},
}

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true
lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>
---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
local opts = {} -- check the lspconfig documentation for a list of all possible options
require("lvim.lsp.manager").setup("pyright", opts)
require("lvim.lsp.manager").setup("sumneko_lua", opts)
---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
---`:LvimInfo` lists which server(s) are skipped for the current filetype
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
	return server ~= "emmet_ls"
end, lvim.lsp.automatic_configuration.skipped_servers)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
lvim.lsp.on_attach_callback = function(client, bufnr)
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end
	--Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

-- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "stylua" },
	{
		command = "prettier",
		extra_args = { "--print-width", "100" },
		filetypes = { "typescript", "typescriptreact" },
	},
})
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "flake8", filetypes = { "python" } },
	{
		command = "shellcheck",
		args = { "--severity", "warning" },
	},
})

-- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{
		"nvim-telescope/telescope-symbols.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					symbols = { sources = { "emoji", "kaomoji", "gitmoji" } },
				},
			})
		end,
		lazy = false,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			vim.g.neo_tree_remove_legacy_commands = 1
			require("neo-tree").setup({
				close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
				popup_border_style = "rounded",
				enable_git_status = true,
				enable_diagnostics = true,
				sort_case_insensitive = true,
				window = { width = 30 },
				filesystem = {
					use_libuv_file_watcher = false,
					follow_current_file = true,
					filtered_items = {
						visible = true,
						hide_dotfiles = false,
						hide_hidden = false,
					},
				},
				buffers = { follow_current_file = true },
			})
		end,
		lazy = false,
	},
}

-- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
vim.api.nvim_create_autocmd("FileType", {
	pattern = "zsh",
	callback = function()
		-- let treesitter use bash highlight for zsh files as well
		require("nvim-treesitter.highlight").attach(0, "bash")
	end,
})
