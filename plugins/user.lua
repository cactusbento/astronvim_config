return {
	-- You can also add new plugins here as well:
	-- Add plugins, the lazy syntax
	-- "andweeb/presence.nvim",
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").setup({
					hint_enable = true,
					hint_prefix = "!>",
			toggle_key = '<M-x>',
			})
		end,
	},
	{
		"ishan9299/nvim-solarized-lua",
		as = "solarized",
		lazy = false,
	},
	{
		"olexsmir/gopher.nvim",
		dependencies = { -- dependencies
			"nvim-lua/plenary.nvim",
		},
		event = "BufEnter *.go",
		config = function()
			require("gopher").setup({
				commands = {
					go = "go",
					gomodifytags = "gomodifytags",
					gotests = "~/go/bin/gotests", -- also you can set custom command path
					impl = "impl",
					iferr = "iferr",
				},
			})
		end
	}
}
