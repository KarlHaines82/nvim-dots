--[[ Imports ]]
require("plugins")        -- plugins
require("variables")      -- Variables
require("options")        -- Options
require("keymaps")        -- Keymaps
require("plugin-configs") -- Plugin configs
require("lsp-config")     -- LSP config
require("autocmds")
local vim = vim
--[[ turn on filetype plugin ]]
vim.cmd([[filetype plugin on]])

--[[ Set a transparent background ]]
vim.g.transparent = true
--[[ Load colorscheme ]]
vim.cmd([[colorscheme tokyonight]])
require("lualine").setup({ options = { theme = "tokyonight" } })

--[[ dash config, alpha.nvim ]]
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	[[    _   __                _          ]],
	[[   / | / /__  ____ _   __(_)___ ___  ]],
	[[  /  |/ / _ \/ __ \ | / / / __ `__ \ ]],
	[[ / /|  /  __/ /_/ / |/ / / / / / / / ]],
	[[/_/ |_/\___/\____/|___/_/_/ /_/ /_/  ]],
}
dashboard.section.buttons.val = {
	dashboard.button("r",   "  Frequent/recent files", "<cmd>Telescope frecency<CR>"),
	dashboard.button("n",   "  New file",              "<cmd>ene<CR>"),
	dashboard.button("e",   "  Explore NvimTree",      "<cmd>Neotree toggle<CR>"),
	dashboard.button("f",   "  Find files",            "<cmd>Telescope find_files<CR>"),
	dashboard.button("c",   "  Neovim config",         "<cmd>e $HOME/.config/nvim/init.lua<CR>"),
	dashboard.button("pl",  "  Projects",              "<cmd>Telescope project<CR>"),
	dashboard.button("ps",  "  Run PackerSync",        "<cmd>ene<bar>:PackerSync<CR>"),
	dashboard.button("q",   "  Quit Neovim",           "<cmd>qa<CR>"),
}
dashboard.section.footer.val = {
	[[   Lean, mean, (100% LUA) Neovim config by linuxkarl    ]],
	[[ telegram: @linuxkarl or email: karlhaines615@yahoo.com ]],
}
dashboard.config.opts.noautocmd = true

--[[ Setup null-ls formatting on save ]]
local null_ls = require("null-ls")
local nlspgroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
local format_buf = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		if vim.g.format_on_save == 1 then
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = nlspgroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end
end
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.diagnostics.luacheck,
		null_ls.builtins.code_actions.refactoring,
		null_ls.builtins.code_actions.shellcheck,
	},
	on_attach = format_buf,
})
-- Bring up the dashboard
vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
