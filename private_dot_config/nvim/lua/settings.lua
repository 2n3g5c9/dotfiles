local cmd = vim.cmd
local g = vim.g
local set = vim.opt

-----------------------------------------------------------
-- GENERAL CONFIGURATION
-----------------------------------------------------------

-- Enable syntax highlighting
cmd 'syntax enable'

-- Highlight current line
set.cursorline = true

-- Enable use of the mouse for all modes
set.mouse = 'a'

-- Center cursor when scrolling
set.scrolloff = 8

-- Display relative numbers
set.number = true
set.relativenumber = true

-- Set the sign column always on
set.signcolumn = 'yes'

-- Show unseeing characters
set.list = true
set.listchars = 'eol:¬,tab:>·,trail:~,extends:>,precedes:<'

-- Silence the error bells
set.errorbells = false

-- Record more lines in history
set.history = 5000

-- Keep editing buffer in the background
set.hidden = true

-- Keep history clean
set.swapfile = false
set.backup = false
set.undodir = vim.fn.stdpath('config') .. '/undodir'
set.undofile = true

-- Set up smarter search behaviour
set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.smartcase = true

-- 1 tab == 4 spaces
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4
set.expandtab = true

-- Indent and wrap lines
set.autoindent = true
set.smartindent = true
set.wrap = true

-- Set rule at 80 columns
set.colorcolumn = "80"
cmd 'highlight ColorColumn ctermbg=0 guibg=lightgrey'

-- netrw configuration
g['netrw_banner'] = 0
g['netrw_liststyle'] = 3
g['netrw_altv'] = 1
g['netrw_winsize'] = 25

-- Fix CursorHold performance
g['cursorhold_updatetime'] = 100

-- Color configuration
cmd 'colorscheme gruvbox-baby'
