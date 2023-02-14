return {
  'folke/which-key.nvim', -- Keymap hints
  event = 'VeryLazy',
  config = function()
    local wk = require('which-key')
    wk.register({ f = { name = "Telescope...", }, }, { prefix = "<leader>" })
    wk.setup()
  end
}
