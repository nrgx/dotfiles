return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()

		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = {
				"ruff",
				"zls",
				"protols",
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"uv",
				"codelldb",
				"clangd",
				"delve",
				"deno",
				"rust-analyzer",
				"stylua", -- lua formatter
				"pylint",
				"protolint",
			},
		})
	end,
}
