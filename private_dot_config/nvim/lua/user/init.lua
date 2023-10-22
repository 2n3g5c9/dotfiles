vim.g.catppuccin_flavour = "mocha"

vim.cmd[[augroup vimbrant]]
vim.cmd[[autocmd!]]
vim.cmd[[autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE]]
vim.cmd[[autocmd ColorScheme * highlight NonText guibg=NONE ctermbg=NONE]]
vim.cmd[[augroup END]]


return {
  colorscheme = "catppuccin",
}
