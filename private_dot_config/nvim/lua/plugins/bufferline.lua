-----------------------------------------------------------
-- bufferline configuration file
-----------------------------------------------------------

-- Plugin: bufferline.nvim
-- https://github.com/akinsho/bufferline.nvim

vim.opt.termguicolors = true
require("bufferline").setup{
    options = {
        diagnostics = "nvim_diagnostic",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          return "("..count..")"
        end,
        offsets = {{filetype = "NvimTree", text = "", text_align = "left"}},
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        separator_style = "thin",
        enforce_regular_tabs = true,
   }
}
