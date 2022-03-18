local config = {

	colorscheme = "catppuccin",

	plugins = {},

	overrides = {
		lsp_installer = {
			server_registration_override = function(server, opts)
				server:setup(opts)
			end,
		},
		treesitter = {},
		luasnip = {
			-- A set of paths to look up VSCode snippets in
			vscode_snippets_paths = {},
		},
		which_key = {},
	},

	virtual_text = true,

	enabled = {
		bufferline = true,
		nvim_tree = true,
		lualine = true,
		lspsaga = true,
		gitsigns = true,
		colorizer = true,
		toggle_term = true,
		comment = true,
		symbols_outline = true,
		indent_blankline = true,
		dashboard = true,
		which_key = true,
		neoscroll = true,
		ts_rainbow = true,
		ts_autotag = true,
	},

	packer_file = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",

	polish = function() end,
}

return config
