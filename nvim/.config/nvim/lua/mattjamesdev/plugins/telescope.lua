return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim' }
  },
  cmd = 'Telescope',
  keys = {
    { '<leader>ff', function() require('telescope.builtin').find_files({ hidden = true }) end, desc = 'Find files' },
    { '<leader>fb', function() require('telescope.builtin').buffers() end, desc = 'Find buffers' },
    { '<leader>fg', function() require('telescope.builtin').live_grep() end, desc = 'Live grep' },
    { '<leader>fk', function() require('telescope.builtin').keymaps() end, desc = 'Keymaps' },
  },
  opts = {
    defaults = {
      file_ignore_patterns = {
        "node_modules",
        "__pycache__",
        ".DS_Store",
        ".venv",
        "venv",
        ".git",
        ".idea",
      },
      layout_config = {
        prompt_position = "top",
      },
      sorting_strategy = "ascending",
      prompt_prefix = "   ",
      selection_caret = "  ",
      borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
    }
  }
}
