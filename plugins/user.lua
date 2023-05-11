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
	},
	{
		"tzachar/cmp-tabnine",
		build = './install.sh',
		dependencies = 'hrsh7th/nvim-cmp',
		config = function()
			local tabnine = require "cmp_tabnine.config"
			tabnine:setup {
				max_lines = 1000,
            	max_num_results = 5,
            	sort = true,
            	run_on_every_keystroke = true,
            	snippet_placeholder = "..",
            	ignored_file_types = {},
            	show_prediction_strength = true,
			}
		end,
	},
	{
		"jcdickinson/codeium.nvim",
		lazy = false,
		dependencies = {
		    "nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup()
		end
	},
}
