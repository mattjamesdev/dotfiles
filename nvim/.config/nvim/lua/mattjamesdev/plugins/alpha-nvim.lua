return {
  'goolord/alpha-nvim', -- Startup screen
  dependencies = {
    'kyazdani42/nvim-web-devicons' -- Devicons (requires a nerd font)
  },
  config = function()
    local dashboard = require('alpha.themes.dashboard')
    local function footer()
      local v = vim.version()
      local plugins_count = vim.fn.len(
        vim.fn.globpath('~/.local/share/nvim/lazy', '*', 0, 1)
      )
      return string.format('Neovim v%d.%d.%d | %d plugins (lazy.nvim)', v.major, v.minor, v.patch, plugins_count)
    end

    -- For more icons, head to https://www.nerdfonts.com/cheat-sheet
    dashboard.section.buttons.val = {
      dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('SPC f f', '  Find file', '<cmd>Telescope find_files hidden=true<CR>'),
      dashboard.button('SPC f g', '  Live grep', '<cmd>Telescope live_grep<CR>'),
      dashboard.button('SPC c', '  Select colourscheme', '<cmd>Telescope colorscheme<CR>'),
      dashboard.button('SPC f d', '  Configure', '<cmd>cd ~/.config/nvim<CR><cmd>e init.lua<CR>'),
      dashboard.button('q', '  Quit', '<cmd>qa<CR>')
    }
    dashboard.section.footer.val = footer()

    require('alpha').setup(dashboard.config)
  end
}
