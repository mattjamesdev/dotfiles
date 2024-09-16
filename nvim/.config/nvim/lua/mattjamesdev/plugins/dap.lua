return {
	{
		"mfussenegger/nvim-dap",
		keys = {
			{ "<leader>dbb", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
			{ "<leader>dbl", function() require("dap").list_breakpoints() end, desc = "List breakpoints" },
			{ "<leader>dbc", function() require("dap").clear_breakpoints() end, desc = "Clear breakpoints" },
			{ "<F1>", function() require("dap").step_over() end, desc = "Step over" },
			{ "<F2>", function() require("dap").step_into() end, desc = "Step into" },
			{ "<F3>", function() require("dap").step_out() end, desc = "Step out" },
			{ "<F5>", function() require("dap").continue() end, desc = "Start debugging/continue" },
		},
    --vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg='#993939' })
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialised["dapui_config"] = function()
				dapui.open()
			end
		end,
    keys = {
			{ "<leader>dut", function() require("dapui").toggle() end, desc = "Toggle UI" },
    }
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function(_, opts)
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
		end,
		keys = {
			{ "<leader>dpr", function() require("dap-python").test_method() end, desc = "Run Python test" },
		},
	},
}
