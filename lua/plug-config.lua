require('nvim-tree').setup{
  view = {
    width = 24,
  },
}
require('glow').setup{ style = 'dark' }
require('lualine').setup{}
require('kanagawa').setup({
    undercurl = true,           -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true},
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords
    transparent = true,        -- do not set background color
    dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
    globalStatus = false,       -- adjust window separators highlight for laststatus=3
    terminalColors = false,      -- define vim.g.terminal_color_{0,17}
    colors = {},
    overrides = {},
    theme = "default"           -- Load "default" theme or the experimental "light" theme
})

require('dressing').setup({
  input = {
    -- Set to false to disable the vim.ui.input implementation
    enabled = true,
    -- Default prompt string
    default_prompt = "Input:",
    -- Can be 'left', 'right', or 'center'
    prompt_align = "left",
    -- When true, <Esc> will close the modal
    insert_only = true,
    -- When true, input will star.t in insert mode.
    start_in_insert = true,
    -- These are passed to nvim_open_win
    anchor = "SW",
    border = "rounded",
    -- 'editor' and 'win' will default to being centered
    relative = "cursor",
    -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    prefer_width = 40,
    width = nil,
    -- min_width and max_width can be a list of mixed types.
    -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
    max_width = { 140, 0.9 },
    min_width = { 20, 0.2 },
    buf_options = {},
    win_options = {
      -- Window transparency (0-100)
      winblend = 15,
      -- Disable line wrapping
      wrap = false,
    },
    -- Set to `false` to disable
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
      -- This is the config that will be passed to nvim_open_win.
      -- Change values here to customize the layout
      return conf
    end,
    -- see :help dressing_get_config
    get_config = nil,
  },
  select = {
    -- Set to false to disable the vim.ui.select implementation
    enabled = true,
    -- Priority list of preferred vim.select implementations
    backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
    -- Trim trailing `:` from prompt
    trim_prompt = true,
    -- Options for telescope selector
    -- These are passed into the telescope picker directly. Can be used like:
    -- telescope = require('telescope.themes').get_ivy({...})
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
        winblend = 10,
      },
      max_width = 80,
      max_height = 40,
      min_width = 40,
      min_height = 10,
    },
    -- Options for built-in selector
    builtin = {
      -- These are passed to nvim_open_win
      anchor = "NW",
      border = "rounded",
      -- 'editor' and 'win' will default to being centered
      relative = "editor",

      buf_options = {},
      win_options = {
        -- Window transparency (0-100)
        winblend = 10,
      },
      -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      -- the min_ and max_ options can be a list of mixed types.
      -- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
      width = nil,
      max_width = { 140, 0.8 },
      min_width = { 40, 0.2 },
      height = nil,
      max_height = 0.9,
      min_height = { 10, 0.2 },
      -- Set to `false` to disable
      mappings = {
        ["<Esc>"] = "Close",
        ["<C-c>"] = "Close",
        ["<CR>"] = "Confirm",
      },
      override = function(conf)
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        return conf
      end,
    },
    -- Used to override format_item. See :help dressing-format
    format_item_override = {},
    -- see :help dressing_get_config
    --get_config = nil,
    get_config = function(opts)
      if opts.kind == 'codeaction' then
        return {
          backend = 'nui',
          nui = {
            relative = 'cursor',
            max_width = 40,
          }
        }
      end
    end
  }
})

--[[ possession config ]]
require('possession').setup {
  autosave = {
    on_load = true,
    on_quit = true,
  },
  commands = {
    save = 'PosSave',
    load = 'PosLoad',
    close = 'PosClose',
    delete = 'PosDelete',
    show = 'PosShow',
    list = 'PosList',
    migrate = 'PosMigrate',
  },
  hooks = {
    before_save = function(name) return {} end,
    after_save = function(name, user_data, aborted) end,
    before_load = function(name, user_data) return user_data end,
    after_load = function(name, user_data) end,
  },
  plugins = {
    close_windows = {
      hooks = {'before_load'},
      preserve_layout = true,  -- or fun(win): boolean
      match = {
        floating = true,
        custom = false,  -- or fun(win): boolean
      },
    },
    delete_hidden_buffers = {
      hooks = {
        'before_load',
      },
      force = false,  -- or fun(buf): boolean
    },
    nvim_tree = true,
    tabby = true,
    delete_buffers = false,
  },
}

--[[ befferline setuo ]]
require('bufferline').setup{
  options = {
  separator = false,
    offsets = {
      filetype = "NvimTree",
      text = "Explorer",
    },
    separator_style = { '','' },
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
  ensure_installed = { "c", "rust", "python", "markdown", "bash" },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
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
        ["dev"]     = "$HOME/dev",
      }
    },
    project = {},
    symbols = {
      sources = {
        'emoji',
        'kaomoji',
        'gitmoji'
      }
    },
    file_browser = {},
    packer = {},
  },
}

require("telescope").load_extension("frecency")
require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("project")
require('telescope').load_extension('possession')