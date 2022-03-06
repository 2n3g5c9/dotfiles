local M = {}

function M.config()
	local status_ok, icons = pcall(require, "nvim-web-devicons")
	if not status_ok then
		return
	end
end

return M
