local cmd = vim.cmd
local g = vim.g

return require('packer').startup(function()
use 'wbthomason/packer.nvim'

-----------------------------------------------------------
-- GENERAL
-----------------------------------------------------------

-- Bar for buffers
use 'akinsho/bufferline.nvim'

-- Nicer Markdown
use 'ellisonleao/glow.nvim'

-- Nicer diagnostics
use 'folke/trouble.nvim'
use 'folke/lsp-colors.nvim'

-- Better TODO comments
use 'folke/todo-comments.nvim'

-- Distraction-free mode
use 'folke/zen-mode.nvim'

-- Available keybindings in popup
use 'folke/which-key.nvim'

-- Faster motions
use 'ggandor/lightspeed.nvim'
use 'tpope/vim-repeat'

-- File icons all around vim
use 'kyazdani42/nvim-web-devicons'

-- Print indentation lines
use 'lukas-reineke/indent-blankline.nvim'

-- Different level of parentheses in different colors
use 'luochen1990/rainbow'

-- Tags of the current file
use 'majutsushi/tagbar'

-- Fast color highlighter
use 'norcalli/nvim-colorizer.lua'

-- Comment functions
use 'numToStr/Comment.nvim'

-- Telescope
use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}
use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

-- Nice and smooth scrolling
use 'psliwka/vim-smoothie'

-- Color scheme
use 'rktjmp/lush.nvim'
use('luisiacc/gruvbox-baby', {branch = 'main'})

-- File system explorer
use 'tpope/vim-vinegar'

-- Handy features for surroundings
use 'tpope/vim-surround'

-- Lean status/tabline
use 'hoob3rt/lualine.nvim'

-- Additional text objects
use 'wellle/targets.vim'

-- Operations on brackets, parens, quotes in pair
use 'windwp/nvim-autopairs'

-----------------------------------------------------------
-- INFRASTRUCTURE
-----------------------------------------------------------

-- Ansible
use 'pearofducks/ansible-vim'

-- Docker
use 'ekalinin/dockerfile.vim'

-- Git
use 'tpope/vim-fugitive'
use 'airblade/vim-gitgutter'

-- Packer
use 'hashivim/vim-packer'

-- Terraform
use 'hashivim/vim-terraform'
use 'juliosueiras/vim-terraform-completion'
g['terraform_align'] = 1
g['terraform_completion_keys'] = 1
g['terraform_fmt_on_save'] = 1

-----------------------------------------------------------
-- DEVELOPMENT
-----------------------------------------------------------

-- LSP
use 'neovim/nvim-lspconfig'
use('hrsh7th/cmp-nvim-lsp', {branch = 'main'})
use('hrsh7th/cmp-buffer', {branch = 'main'})
use('hrsh7th/cmp-path', {branch = 'main'})
use('hrsh7th/cmp-cmdline', {branch = 'main'})
use('hrsh7th/nvim-cmp', {branch = 'main'})
use('hrsh7th/cmp-vsnip', {branch = 'main'})
use 'hrsh7th/vim-vsnip'

-- Treesitter
use('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- Go
use('fatih/vim-go', {['do'] = ':GoUpdateBinaries'})
g['go_def_mode'] = 'gopls'
g['go_info_mode'] = 'gopls'

-- Javascript
use 'pangloss/vim-javascript'     -- JavaScript support
use 'leafgarland/typescript-vim'  -- TypeScript syntax
use 'peitalin/vim-jsx-typescript' -- JSX syntax
use 'jparise/vim-graphql'         -- GraphQL syntax
use('styled-components/vim-styled-components', {branch = 'main'})
cmd('autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart')
cmd('autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear')

-- Prettier
use('prettier/vim-prettier', {['do'] = 'yarn install'})

-- Python
use('psf/black', {branch = 'main'})
cmd('autocmd BufWritePre *.py execute \':Black\'')
use 'nvie/vim-flake8'
end)
