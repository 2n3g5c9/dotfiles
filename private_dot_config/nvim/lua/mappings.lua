local utils = require('utils')

local cmd = vim.cmd
local g = vim.g
local o = vim.o

g.mapleader = ' '
utils.map('i', 'jj', '<Esc>')

-----------------------------------------------------------
-- WINDOW MANAGEMENT
-----------------------------------------------------------

-- Split windows
utils.map('n', '<leader>-', '<C-w>s')
utils.map('n', '<leader>_', '<C-w>v')
utils.map('n', '<leader>q', '<C-w>o')
utils.map('n', '<leader>s', '<C-w>r')
utils.map('n', '<leader>=', '<C-w>=')
utils.map('n', '<leader>+', '<C-w>s')

-- Move windows around
utils.map('n', '<leader>h', ':wincmd h<CR>')
utils.map('n', '<leader>j', ':wincmd j<CR>')
utils.map('n', '<leader>k', ':wincmd k<CR>')
utils.map('n', '<leader>l', ':wincmd l<CR>')

-- Resize windows
utils.map('n', '<leader>L', ':vertical resize +5<CR>')
utils.map('n', '<leader>H', ':vertical resize -5<CR>')
utils.map('n', '<leader>J', ':resize +5<CR>')
utils.map('n', '<leader>K', ':resize -5<CR>')

-----------------------------------------------------------
-- TEXT MANIPULATION
-----------------------------------------------------------

-- Smooth scrolling
cmd('nmap <C-j> <Plug>(SmoothieDownwards)')
cmd('nmap <C-k> <Plug>(SmoothieUpwards)')

-- Cut, Copy & Paste to system clipboard
utils.map('', '<leader>d', '"+d')
utils.map('', '<leader>y', '"+y')
utils.map('', '<leader>p', '"+p')
utils.map('', '<leader>P', '"+P')

-- Move lines around
utils.map('n', '<S-Up>', ':m-2<CR>')
utils.map('n', '<S-Down>', ':m+<CR>')
utils.map('i', '<S-Up>', ':m-2<CR>')
utils.map('i', '<S-Down>', ':m+<CR>')

-----------------------------------------------------------
-- MISCELLANEOUS
-----------------------------------------------------------

-- Bufferline
utils.map('n', '[b', ':BufferLineCycleNext<CR>')
utils.map('n', ']b', ':BufferLineCyclePrev<CR>')

-- Colorised pairs
g['rainbow_active'] = 1

-- Zen Mode (distraction-free mode)
utils.map('n', 'zm', ':ZenMode<CR>')

-- Tagbar
utils.map('n', 'tb', ':TagbarToggle<CR>')

-- Trouble
utils.map('n', '<leader>xx', ':TroubleToggle<CR>')
utils.map('n', '<leader>xw', ':TroubleToggle lsp_workspace_diagnostics<CR>')
utils.map('n', '<leader>xd', ':TroubleToggle lsp_document_diagnostics<CR>')
utils.map('n', '<leader>xq', ':TroubleToggle quickfix<CR>')
utils.map('n', '<leader>xl', ':TroubleToggle loclist<CR>')
utils.map('n', 'gR', ':TroubleToggle lsp_references<CR>')

-- WhichKey
o.timeoutlen = 500

-- Telescope
utils.map('n', ';', '<cmd>lua require(\'telescope.builtin\').find_files(require(\'telescope.themes\').get_dropdown({}))<cr>')
utils.map('n', '\'', '<cmd>lua require(\'telescope.builtin\').git_files(require(\'telescope.themes\').get_dropdown({}))<cr>')
utils.map('n', '\\', '<cmd>lua require(\'telescope.builtin\').live_grep(require(\'telescope.themes\').get_dropdown({}))<cr>')
utils.map('n', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers(require(\'telescope.themes\').get_dropdown({}))<cr>')
utils.map('n', '<leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags(require(\'telescope.themes\').get_dropdown({}))<cr>')

-- LSP
utils.map('n', '<silent> gh', '<cmd>lua require(\'lspsaga.provider\'.lsp_finder()<CR>')
utils.map('n', '<silent> gs', '<cmd>lua require(\'lspsaga.signaturehelp\').signature_help()<CR>')
utils.map('n', '<silent> K', '<cmd>lua require(\'lspsaga.hover\').render_hover_doc()<CR>')

-- git
utils.map('n', '<leader>ga', ':G add %:p<CR><CR>')
utils.map('n', '<leader>gs', ':Gstatus<CR>')
utils.map('n', '<leader>gc', ':Gcommit -v -q<CR>')
utils.map('n', '<leader>gd', ':Gdiff<CR>')
utils.map('n', '<leader>gf', ':diffget //2<CR>')
utils.map('n', '<leader>gh', ':diffget //3<CR>')

-- Terraform
utils.map('n', '<leader>ti', ':Terraform init<CR>')
utils.map('n', '<leader>tp', ':Terraform plan -out terraform.tfplan<CR>')
utils.map('n', '<leader>ta', ':Terraform apply terraform.tfplan<CR>')
utils.map('n', '<leader>td', ':Terraform destroy terraform.tfplan<CR>')
utils.map('n', '<leader>tf', ':TerraformFmt<CR>')

-- JSON formatting
cmd('command! JSON %!jq .')
utils.map('n', '<leader>jq', ':JSON<CR>')
