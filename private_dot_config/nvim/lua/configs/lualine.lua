local M = {}

function M.config()
	local status_ok, lualine = pcall(require, "lualine")
	if not status_ok then
		return
	end

	local colors = {
		green = "#ABE9B3",
		peach = "#F8BD96",
	}

	local conditions = {
		buffer_not_empty = function()
			return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
		end,
		hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end,
		check_git_workspace = function()
			local filepath = vim.fn.expand("%:p:h")
			local gitdir = vim.fn.finddir(".git", filepath .. ";")
			return gitdir and #gitdir > 0 and #gitdir < #filepath
		end,
	}

	local config = {
		options = {
			disabled_filetypes = { "NvimTree", "neo-tree", "dashboard", "Outline", "alpha" },
			component_separators = "",
			section_separators = "",
		},
		sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_y = {},
			lualine_z = {},
			lualine_c = {},
			lualine_x = {},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_y = {},
			lualine_z = {},
			lualine_c = {},
			lualine_x = {},
		},
	}

	local function ins_left(component)
		table.insert(config.sections.lualine_c, component)
	end

	local function ins_right(component)
		table.insert(config.sections.lualine_x, component)
	end

	ins_left({
		function()
			return "▊"
		end,
		padding = { left = 0, right = 0 },
	})

	ins_left({
		"branch",
		icon = "",
		padding = { left = 2, right = 1 },
	})

	ins_left({
		"filetype",
		cond = conditions.buffer_not_empty,
		padding = { left = 2, right = 1 },
	})

	ins_left({
		"diff",
		symbols = { added = " ", modified = "柳", removed = " " },
		cond = conditions.hide_in_width,
		padding = { left = 2, right = 1 },
	})

	ins_left({
		"diagnostics",
		sources = { "nvim_diagnostic" },
		symbols = { error = " ", warn = " ", info = " ", hint = " " },
		padding = { left = 2, right = 1 },
	})

	ins_left({
		function()
			return "%="
		end,
	})

	ins_right({
		function(_)
			local Lsp = vim.lsp.util.get_progress_messages()[1]

			if Lsp then
				local msg = Lsp.message or ""
				local percentage = Lsp.percentage or 0
				local title = Lsp.title or ""
				local spinners = {
					"",
					"",
					"",
				}

				local success_icon = {
					"",
					"",
					"",
				}

				local ms = vim.loop.hrtime() / 1000000
				local frame = math.floor(ms / 120) % #spinners

				if percentage >= 70 then
					return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
				end

				return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
			end

			return ""
		end,
		color = { gui = "none" },
		padding = { left = 0, right = 1 },
		cond = conditions.hide_in_width,
	})

	ins_right({
		function(msg)
			msg = msg or "Inactive"
			local buf_clients = vim.lsp.buf_get_clients()
			if next(buf_clients) == nil then
				if type(msg) == "boolean" or #msg == 0 then
					return "Inactive"
				end
				return msg
			end
			local buf_ft = vim.bo.filetype
			local buf_client_names = {}

			for _, client in pairs(buf_clients) do
				if client.name ~= "null-ls" then
					table.insert(buf_client_names, client.name)
				end
			end

			local formatters = require("core.utils")
			local supported_formatters = formatters.list_registered_formatters(buf_ft)
			vim.list_extend(buf_client_names, supported_formatters)

			local linters = require("core.utils")
			local supported_linters = linters.list_registered_linters(buf_ft)
			vim.list_extend(buf_client_names, supported_linters)

			return table.concat(buf_client_names, ", ")
		end,
		icon = " ",
		color = { gui = "none" },
		padding = { left = 0, right = 1 },
		cond = conditions.hide_in_width,
	})

	ins_right({
		function()
			local b = vim.api.nvim_get_current_buf()
			if next(vim.treesitter.highlighter.active[b]) then
				return " 綠TS"
			end
			return ""
		end,
		padding = { left = 1, right = 0 },
		color = { fg = colors.green },
		cond = conditions.hide_in_width,
	})

	ins_right({
		"location",
		padding = { left = 1, right = 1 },
	})

	ins_right({
		"progress",
		color = { gui = "none" },
		padding = { left = 0, right = 0 },
	})

	ins_right({
		function()
			local current_line = vim.fn.line(".")
			local total_lines = vim.fn.line("$")
			local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
			local line_ratio = current_line / total_lines
			local index = math.ceil(line_ratio * #chars)
			return chars[index]
		end,
		padding = { left = 1, right = 1 },
		color = { fg = colors.peach },
		cond = nil,
	})

	ins_right({
		function()
			return "▊"
		end,
		padding = { left = 1, right = 0 },
	})

	lualine.setup(config)
end

return M
