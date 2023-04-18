return {
  'folke/which-key.nvim', -- Keymap hints
  event = 'VeryLazy',
  config = function()
    local wk = require('which-key')
    wk.register(
      { b = { name = "buffer..." }, },
      { c = { name = "CCC..." }, },
      { f = { name = "Telescope...", }, },
      { l = { name = "LSP..." }, },
      { t = { name = "ToggleTerm..." }, },
      { w = { name = "workspace..." }, },
      { prefix = "<leader>" }
    )
    wk.setup()
  end
}
