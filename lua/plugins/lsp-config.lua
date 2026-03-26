return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		-- Setup Mason first
		require("mason").setup()

		-- Setup mason-lspconfig with automatic installation
		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"clangd",
				"ts_ls",
				"tailwindcss",
			},
		})

		-- Get capabilities
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Manually configure servers you want to use
		-- LUA
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
				},
			},
		})
		-- rust
		vim.lsp.config("rust_analyzer", {
			-- Server-specific settings. See `:help lsp-quickstart`
			settings = {
				["rust-analyzer"] = {},
			},
		})

		vim.lsp.enable("lua_ls")
		vim.lsp.enable("rust_analyzer")
    vim.lsp.enable("clangd")
    vim.lsp.enable("ts_ls")
    vim.lsp.enable("tailwindcss")
		-- Keybindings
		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
	end,
}
