return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
	},
	config = function()
    local function get_python_path()
      local python_path = vim.fn.exepath("python")
      
      if python_path == "" then
        python_path = vim.fn.exepath("python3")
      end
      
      if python_path == "" then
        python_path = "/usr/bin/python3"
      end
      
      return python_path
    end
    require("dap-python").setup(get_python_path())
		--local dap = require("dap")
		local dap, dapui = require("dap"), require("dapui")
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>dc", dap.continue, {})
	end,
}
