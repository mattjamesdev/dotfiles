return {
  'folke/which-key.nvim', -- Keymap hints
  event = 'VeryLazy',
  config = function()
    local wk = require('which-key')
    wk.register(
      { b = { name = "buffer..." }, },
      { prefix = "<leader>" }
    )
    wk.register(
      { c = { name = "CCC..." }, },
      { prefix = "<leader>" }
    )
    wk.register(
      { f = { name = "Telescope...", }, },
      { prefix = "<leader>" }
    )
    wk.register(
      { l = { name = "LSP..." }, },
      { prefix = "<leader>" }
    )
    wk.register(
      { t = { name = "ToggleTerm..." }, },
      { prefix = "<leader>" }
    )
    wk.register(
      { w = { name = "workspace..." }, },
      { prefix = "<leader>" }
    )
    wk.setup()
  end
}
