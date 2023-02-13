require('telescope').setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "__pycache__",
      ".DS_Store",
      ".venv",
      "venv",
      ".git",
    },
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
    prompt_prefix = "   ",
    selection_caret = "  ",
    borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
  }
})
