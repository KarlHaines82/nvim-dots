vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | silent! LspStop | silent! LspStart | PackerSync',
  group = packer_group,
  pattern = vim.fn.stdpath('config') .. '/lua/plugin-configs.lua',
})
require('lualine').setup({
})
require('onedark').setup{
  style = 'dark',
}
require('neo-tree').setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  sort_case_insensitive = true,
  default_component_configs = {
    container = {
      width = 30,
    }
  },
  source_selector = {
    statusline = true,
  },
  window = {
    width = 30,
  },
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
    }
  }
})
require('glow').setup{
  style = 'dark',
  border = 'rounded',
  width_ratio = 0.7,
  height_ratio = 0.7,
}

require('dressing').setup({
  input = {
    enabled = true,
    -- Default prompt string
    default_prompt = "Input:",
    prompt_align = "center",
    -- When true, <Esc> will close the modal
    insert_only = true,
    start_in_insert = true,
    anchor = "SW",
    border = "rounded",
    relative = "cursor",
    prefer_width = 40,
    width = nil,
    max_width = { 80, 0.9 },
    min_width = { 20, 0.2 },
    buf_options = {},
    win_options = {
      winblend = 15,
      wrap = false,
    },
    mappings = {
      n = {
        ["<Esc>"] = "Close",
        ["<CR>"] = "Confirm",
      },
      i = {
        ["<C-c>"] = "Close",
        ["<CR>"] = "Confirm",
        ["<Up>"] = "HistoryPrev",
        ["<Down>"] = "HistoryNext",
      },
    },
    override = function(conf)
      return conf
    end,
    get_config = nil,
  },
  select = {
    enabled = true,
    backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
    trim_prompt = true,
    telescope = require('telescope.themes').get_ivy{},
    -- Options for fzf selector
    fzf = {
      window = {
        width = 0.5,
        height = 0.4,
      },
    },
    -- Options for fzf_lua selector
    fzf_lua = {
      winopts = {
        width = 0.5,
        height = 0.4,
      },
    },
    -- Options for nui Menu
    nui = {
      position = "50%",
      size = nil,
      relative = "editor",
      border = {
        style = "rounded",
      },
      buf_options = {
        swapfile = false,
        filetype = "DressingSelect",
      },
      win_options = {
        winblend = 15,
      },
      max_width = 80,
      max_height = 40,
      min_width = 40,
      min_height = 10,
    },
    builtin = {
      -- These are passed to nvim_open_win
      anchor = "NW",
      border = "rounded",
      -- 'editor' and 'win' will default to being centered
      relative = "editor",
      buf_options = {},
      win_options = {
          winblend = 15,
        },
        width = nil,
        max_width = { 140, 0.8 },
        min_width = { 40, 0.2 },
        height = nil,
        max_height = 0.9,
        min_height = { 10, 0.2 },
        mappings = {
          ["<Esc>"] = "Close",
          ["<C-c>"] = "Close",
          ["<CR>"] = "Confirm",
        },
        override = function(conf)
        -- Change values here to customize the layout
        return conf
      end,
    },
    -- Used to override format_item. See :help dressing-format
    format_item_override = {},
    get_config = function(opts)
      if opts.kind == 'codeaction' then
        return {
          backend = 'nui',
          nui = {
            relative = 'cursor',
            max_width = 40,
            win_options = {
              winblend = 15,
            }
          }
        }
      end
    end
  }
})

--[[ befferline setuo ]]
require('bufferline').setup{
  options = {
    indicator = { style = 'none' },
    separator = false,
    offsets = {
      filetype = "neo-tree",
      text = "Explorer",
    },
    separator_style = { '' ,'' },
    always_show_bufferline = true,
    hover = {
      enabled = true,
      delay = 200,
      reveal = { 'close' },
    },
  }
}

--[[ treesitter config ]]
require'nvim-treesitter.configs'.setup {
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
}
--[[ colorizer.nvim ]]
require('colorizer').setup()
--[[ comment.nvim setup ]]
require('Comment').setup()
--[[ indent-blankline.nvim setup ]]
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
require("indent_blankline").setup {
  show_end_of_line = true,
  space_char_blankline = " ",
}
--[[ telescope config ]]
require('telescope').setup{
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect
    },
    frecency = {
      show_scores = true,
      show_unindexed = false,
      ignore_patterns = {"*.git/*", "*/tmp/*", "*.cache/*"},
      disable_devicons = false,
      workspaces = {
        ["home"]    = "$HOME",
        ["conf"]    = "$HOME/.config",
        ["data"]    = "$HOME/.local/share",
        ["dev"]     = "$HOME/Dev",
      }
    },
    project = {
      base_dirs = {
        { path = '~/Dev/qtile' },
        { path = '~/Dev/qtile-extras' },
        { path = '~/.config/nvim', max_depth = 2 },
        { path = '~/.config/lvim', max_depth = 2 },
        { path = '~/.config/qtile' },
      },
      hidden_files = true, -- default: false
      theme = "dropdown",
      order_by = "asc",
      search_by = "title",
      sync_with_nvim_tree = true, -- default false
    },
    symbols = { sources = { 'emoji','kaomoji','gitmoji' }},
    file_browser = {},
  },
}
require("telescope").load_extension("frecency")
require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("project")

require("coq_3p") {
  { src = "nvimlua", short_name = "nLUA", conf_only = true },
  { src = "vimtex",  short_name = "vTEX" },
  { src = "repl",
    sh = "zsh",
    shell = { p = "python", n = "node", pl = "perl", rs = "rust", r = "ruby", l = "lua", },
    max_lines = 99,
    deadline = 500,
    unsafe = { "rm", "poweroff", "mv", "rmdir", "reboot", }},
}
require('mini.sessions').setup()
require('mini.pairs').setup()

