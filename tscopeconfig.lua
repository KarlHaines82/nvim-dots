require'telescope'.setup {
  extensions = {
    file_browser = {
      --theme = "ivy", 
      -- disables netrw and use telescope-file-browser in its place 
      hijack_netrw = true,
    },
    frecency = {
      show_scores = false, 
      show_unindexed = true, 
      ignore_patterns = {"*.git/*", "*/tmp/*"}, 
      disable_devicons = false, 
      workspaces = { 
        ["conf"] = "~/.config",
        ["data"] = "~/.local/share",
        ["project"] = "~/Dev", 
      },
    },
    fzf = {
      toggle_hidden = true,
      fuzzy = true,                    -- false will only do exact
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case"
    },
  },
  pickers = { 
    find_files = { 
        theme = "dropdown",
        toggle_hidden = true,
    },
  },
  builtin = {
    symbols = {
      sources = {'emoji', 'kaomoji', 'gitmoji'},
    },
  },
}
require'telescope'.load_extension'fzf'
require'telescope'.load_extension'file_browser'
require'telescope'.load_extension'project'
require'telescope'.load_extension'frecency'
