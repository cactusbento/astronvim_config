-- customize mason plugins
return {
	-- use mason-lspconfig to configure LSP installations
	{
		"williamboman/mason-lspconfig.nvim",
		-- overrides `require("mason-lspconfig").setup(...)`
		opts = {
			ensure_installed = {
				"lua_ls",
				"bashls",

				"clangd",
				"dockerls",

				"marksman",
				"texlab",
				"ltex",

				-- "fsautocomplete",
				-- "zk", -- Fails to install properly

				-- "zls",	-- Use latest version in $PATH
			},
		},
	},
	-- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
	{
		"jay-babu/mason-null-ls.nvim",
		-- overrides `require("mason-null-ls").setup(...)`
		opts = {
			-- ensure_installed = { "prettier", "stylua" },
			automatic_iinstallation = true,
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		-- overrides `require("mason-nvim-dap").setup(...)`
		opts = {
			-- ensure_installed = { "python" },
		},
	},
}
