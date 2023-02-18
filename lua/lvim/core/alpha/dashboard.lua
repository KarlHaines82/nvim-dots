local M = {}

local lkbanner = {
	"       linuxkarl's   almost not perfect neovim config      ",
	"                                                             ",
	"@@@  @@@  @@@@@@@@   @@@@@@   @@@  @@@  @@@  @@@@@@@@@@      ",
	"@@@@ @@@  @@@@@@@@  @@@@@@@@  @@@  @@@  @@@  @@@@@@@@@@@     ",
	"@@!@!@@@  @@!       @@!  @@@  @@!  @@@  @@!  @@! @@! @@!     ",
	"!@!!@!@!  !@!       !@!  @!@  !@!  @!@  !@!  !@! !@! !@!     ",
	"@!@ !!@!  @!!!:!    @!@  !@!  @!@  !@!  !!@  @!! !!@ @!@     ",
	"!@!  !!!  !!!!!:    !@!  !!!  !@!  !!!  !!!  !@!   ! !@!     ",
	"!!:  !!!  !!:       !!:  !!!  :!:  !!:  !!:  !!:     !!:     ",
	":!:  !:!  :!:       :!:  !:!   ::!!:!   :!:  :!:     :!:  :!:",
	" ::   ::   :: ::::  ::::: ::    ::::     ::  :::     ::   :::",
	"::    :   : :: ::    : :  :      :      :     :      :    :::",
	"                                                             ",
	"     thanks to lunarvim for the *best* starter config        ",
}

function M.get_sections()
	local header = {
		type = "text",
		val = function()
			local alpha_wins = vim.tbl_filter(function(win)
				local buf = vim.api.nvim_win_get_buf(win)
				return vim.api.nvim_buf_get_option(buf, "filetype") == "alpha"
			end, vim.api.nvim_list_wins())

			--if vim.api.nvim_win_get_height(alpha_wins[#alpha_wins]) < 36 then
			--  return M.banner_small
			--end
			return lkbanner
		end,
		opts = {
			position = "center",
			hl = "Label",
		},
	}

	local text = require("lvim.interface.text")
	local lvim_version = "1.0a-P"

	local footer = {
		type = "text",
		val = text.align_center({ width = 0 }, {
			"@linuxkarl on Telegram and IRC",
			"https://www.github.com/KarlHaines82/nvim-dots",
			"thanks to",
			"https://lunarvim.org",
			lvim_version,
		}, 0.5),
		opts = {
			position = "center",
			hl = "Number",
		},
	}

	local buttons = {
		opts = {
			hl_shortcut = "Include",
			spacing = 1,
		},
		entries = {
			{ "f", lvim.icons.ui.FindFile .. "  Find File", "<CMD>Telescope find_files<CR>" },
			{ "n", lvim.icons.ui.NewFile .. "  New File", "<CMD>ene!<CR>" },
			{ "p", lvim.icons.ui.Project .. "  Projects ", "<CMD>Telescope projects<CR>" },
			{ "r", lvim.icons.ui.History .. "  Recent files", ":Telescope oldfiles <CR>" },
			{ "t", lvim.icons.ui.FindText .. "  Find Text", "<CMD>Telescope live_grep<CR>" },
			{
				"c",
				lvim.icons.ui.Gear .. "  Configuration",
				"<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>",
			},
			{ "q", lvim.icons.ui.Close .. "  Quit", "<CMD>quit<CR>" },
		},
	}
	return {
		header = header,
		buttons = buttons,
		footer = footer,
	}
end

return M
