return {
  'rcarriga/nvim-notify',
  config = function()
    local stages_util = require("notify.stages.util")

    -- Custom width for the notifications to appear
    local custom_width = 40

    local opts = {
      on_open = function(win)
        vim.api.nvim_win_set_option(win, "wrap", true)
      end,
      -- Custom stage to wrap text in notifications
      -- See https://github.com/rcarriga/nvim-notify/issues/94#issuecomment-1146777125
      -- and https://github.com/rcarriga/nvim-notify/issues/99
      stages = {
        function(state)
          local next_height = state.message.height + 2
          local next_row = stages_util.available_slot(
            state.open_windows,
            next_height,
            stages_util.DIRECTION.TOP_DOWN
          )
          if not next_row then
            return nil
          end
          return {
            relative = "editor",
            anchor = "NE",
            width = custom_width,--state.message.width,
            height = (state.message.height - 2) * math.ceil(state.message.width / custom_width) + 2,--state.message.height,
            col = vim.opt.columns:get(),
            row = next_row,
            border = "rounded",
            style = "minimal",
            opacity = 0,
          }
        end,
        function()
          return {
            opacity = { 100 },
            col = { vim.opt.columns:get() },
          }
        end,
        function()
          return {
            col = { vim.opt.columns:get() },
            time = true,
          }
        end,
        function()
          return {
            width = {
              1,
              frequency = 2.5,
              damping = 0.9,
              complete = function(cur_width)
                return cur_width < 3
              end,
            },
            opacity = {
              0,
              frequency = 2,
              complete = function(cur_opacity)
                return cur_opacity <= 4
              end,
            },
            col = { vim.opt.columns:get() },
          }
        end,
      },
    }
    require('notify').setup(opts)
    vim.notify = require('notify')
  end
}
