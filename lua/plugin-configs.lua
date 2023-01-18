--[[ neo-tree setup ]]
require("neo-tree").setup({
	close_if_last_window = true,
	popup_border_style = "rounded",
	enable_git_status = false,
	enable_diagnostics = false,
	sort_case_insensitive = true,
	default_component_configs = {
		container = {
			width = 30,
		},
	},
	source_selector = {
		winbar = true,
	},
	window = {
		width = 30,
	},
	filesystem = {
		filtered_items = {
			visible = true,
			hide_dotfiles = false,
		},
	},
})

--[[ dressing setup stuff ]]
require("dressing").setup({
	input = {
		-- used to override format_item. see :help dressing-format
		format_item_override = {},
		get_config = function(opts)
			if opts.kind == "codeaction" then
				return {
					backend = "nui",
					nui = {
						relative = "cursor",
						max_width = 40,
						win_options = {
							winblend = 15,
						},
					},
				}
			end
		end,
	},
})

--[[ lualine setup ]]
require("lualine").setup({
	extensions = {
		"neo-tree",
  },
  options = {	
    disabled_filetypes = {
      "alpha",
      "dashboard",
    },
  },
	sections = {
		lualine_c = {
			'lsp_progress'
		}
	},
})

--[[ befferline setup ]]
require("bufferline").setup({
	options = {
		indicator = { style = "none" },
		--separator = false,
		offsets = {
			{
				filetype = "neo-tree",
				text = "Neotree Explorer",
			},
		},
		--separator_style = { "", "" },
		always_show_bufferline = true,
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
	},
})

--[[ treesitter config ]]
require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all"
	auto_install = true,
	ensure_installed = { "c", "rust", "python", "markdown", "bash", "lua" },
	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	highlight = {
		enable = true,
		disable = function(lang, buf)
			local max_filesize = 1000 * 1024 -- 1000 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
		additional_vim_regex_highlighting = true,
	},
})
--[[ colorizer setup ]]
require("colorizer").setup()

--[[ comment.nvim setup ]]
require("Comment").setup()

--[[ indent-blankline.nvim setup ]]
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
require("indent_blankline").setup({
	show_end_of_line = true,
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
})

--[[ telescope config ]]
require("telescope").setup({
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect
		},
		frecency = {
			show_scores = true,
			show_unindexed = false,
			ignore_patterns = { "*.git/*", "*/tmp/*", "*.cache/*" },
			disable_devicons = false,
			workspaces = {
				["home"] = "$HOME",
				["conf"] = "$HOME/.config",
				["data"] = "$HOME/.local/share",
				["dev"] = "$HOME/Dev",
			},
		},
		project = {
			base_dirs = {
				{ path = "~/Dev/qtile" },
				{ path = "~/Dev/qtile-extras" },
				{ path = "~/.config/nvim", max_depth = 2 },
				{ path = "~/.config/lvim", max_depth = 2 },
				{ path = "~/.config/qtile" },
			},
			hidden_files = true, -- default: false
			theme = "dropdown",
			order_by = "asc",
			search_by = "title",
			sync_with_nvim_tree = true, -- default false
		},
		symbols = { sources = { "emoji", "kaomoji", "gitmoji" } },
		file_browser = {},
	},
})
require("telescope").load_extension("frecency")
require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("project")

--[[ coq 3rd party configs ]]
require("coq_3p")({
	{ src = "nvimlua", short_name = "nLUA", conf_only = true },
	{ src = "vimtex", short_name = "vTEX" },
	{
		src = "repl",
		sh = "zsh",
		shell = { p = "python", n = "node", pl = "perl", rs = "rust", r = "ruby", l = "lua" },
		max_lines = 99,
		deadline = 500,
		unsafe = { "rm", "poweroff", "mv", "rmdir", "reboot" },
	},
})

--[[ Utilities borrowed from mini.nvim ]]
require("mini.sessions").setup()
require("mini.pairs").setup()
require("mini.align").setup()
require("mini.cursorword").setup({ delay = 3000 })
require("mini.surround").setup()
