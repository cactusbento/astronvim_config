return {
	-- Configure AstroNvim updates
	updater = {
		remote = "origin", -- remote to use
		channel = "stable", -- "stable" or "nightly"
		version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
		branch = "nightly", -- branch name (NIGHTLY ONLY)
		commit = nil, -- commit hash (NIGHTLY ONLY)
		pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
		skip_prompts = false, -- skip prompts about breaking changes
		show_changelog = true, -- show the changelog after performing an update
		auto_quit = false, -- automatically quit the current session after a successful update
		remotes = { -- easily add new remotes to track
			--	 ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
			--	 ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
			--	 ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
		},
	},

	-- Set colorscheme to use
	colorscheme = "solarized",

	-- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
	diagnostics = {
		virtual_text = true,
		underline = true,
	},

	lsp = {
		-- customize lsp formatting options
		formatting = {
			-- control auto formatting on save
			format_on_save = {
				enabled = true, -- enable or disable format on save globally
				allow_filetypes = { -- enable format on save for specified filetypes only
					"zig", "python", "typescript", "json",
				},
				ignore_filetypes = { -- disable format on save for specified filetypes
					"c", "go",
				},
			},
			disabled = { -- disable formatting capabilities for the listed language servers
				-- disable lua_ls formatting capability if you want to use StyLua to format your lua code
				-- "lua_ls",
			},
			timeout_ms = 1000, -- default format timeout
			-- filter = function(client) -- fully override the default formatting function
			--	 return true
			-- end
		},
		-- enable servers that you already have installed without mason
		servers = {
			-- "pyright"
			"jedi_language_server",
			"jdtls",
			"sqlls",
			"zls",
			"zk",
			"fsautocomplete",
		},
		config = {
		    fsautocomplete = function ()
                return {
                    root_dir = function (fName, _)
                        local util = require("lspconfig.util")
                        local root
                        -- root = util.find_git_ancestor(fName)
                        -- root = root or util.root_pattern("*.sln")(fName)
                        -- root = root or util.root_pattern("*.fsproj")(fName)
                        root = root or util.root_pattern("*.fsx")(fName)
                        -- root = root or util.root_pattern("*.fsi")(fName)
                        return root
                    end,
                    filetypes = { 'fsharp' },
                    init_options = {
                        AutomaticWorkspaceInit = true,
                    },
                    settings = {
                        ExternalAutocomplete = false,
                    }
                }
		    end,
		    r_language_server = function()
                return {
                    settings = {
                        languageserver = {
                            lint_cache = true,
                            server_capabilities = {

                            },

                        },
                    },
                }
		    end,
		    jedi_language_server = function()
				return {
					settings = {
						workspace = {
							environmentPath = "/usr/bin/python"
						}
					}
				}
		    end,
			dockerls = function()
				return {
					filetypes = {"dockerfile", "dontainerfile"},
					root_dir = require("lspconfig.util").root_pattern("Dockerfile", "Containerfile")
				}
			end,
			texlab = function ()
                return {
                	settings = {
                		texlab = {
                			build = {
                				executable = "tectonic",
                				args = { "-X", "compile", "%f", "--synctex", "--keep-logs", "--keep-intermediates" },
                				forwardSearchAfter = false,
                				onSave = true,
                			},
                		},
                	},
                }
			end,
		},
	},

	-- Configure require("lazy").setup() options
	lazy = {
		defaults = { lazy = true },
		performance = {
			rtp = {
				-- customize default disabled vim plugins
				disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
			},
		},
	},

	-- This function is run last and is a good place to configuring
	-- augroups/autocommands and custom filetypes also this just pure lua so
	-- anything that doesn't fit in the normal config locations above can go here
	polish = function()
		-- Set up custom filetypes
		-- vim.filetype.add {
		--	 extension = {
		--		 foo = "fooscript",
		--	 },
		--	 filename = {
		--		 ["Foofile"] = "fooscript",
		--	 },
		--	 pattern = {
		--		 ["~/%.config/foo/.*"] = "fooscript",
		--	 },
		-- }
	end,
}
