"General
syntax on

set incsearch
set mouse=a
set noerrorbells
set number
set relativenumber
set shiftwidth=4
set smartcase
set smartindent
set termguicolors
set ruler
set tabstop=4 softtabstop=4
set wrap

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

"Remappings
inoremap jj <Esc>
let mapleader = " "
"Move around windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
"Resize windows
nnoremap <leader>= :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>+ :horizontal resize +5<CR>
nnoremap <leader>_ :horizontal resize -5<CR>
"Move lines around
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>
"Scroll
nmap <C-j> <Plug>(SmoothieDownwards)
nmap <C-k> <Plug>(SmoothieUpwards)
"Cut, Copy & Paste
noremap <leader>d "+d
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>P "+P
"Pairs
let g:rainbow_active = 1
"NERDTree
nnoremap nt :NERDTreeToggle<CR>
let g:NERDTreeHijackNetrw = 0
"NERDCommenter
map <leader>/ <Plug>NERDCommenterToggle
"Ranger
command! Ranger FloatermNew ranger
nnoremap <leader>r :Ranger<CR>
"WhichKey
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=500
"fzf and rg
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-g> :GFiles<CR>
nnoremap <silent> <C-o> :Buffers<CR>
nnoremap <C-f> :Rg<Space>
"git
nnoremap <leader>ga :G add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gh :diffget //3<CR>
"Terraform
nnoremap <leader>ti :Terraform init<CR>
nnoremap <leader>tp :Terraform plan -out terraform.tfplan<CR>
nnoremap <leader>ta :Terraform apply terraform.tfplan<CR>
nnoremap <leader>td :Terraform destroy terraform.tfplan<CR>
nnoremap <leader>tf :TerraformFmt<CR>
"JSON formatting
command! JSON %!jq .
nnoremap <leader>js :JSON<CR>

"Plugins
call plug#begin('~/.local/share/nvim/plugged')

"General
Plug 'jiangmiao/auto-pairs'
Plug 'jremmen/vim-ripgrep'
Plug 'liuchengxu/vim-which-key'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mhinz/vim-startify'
Plug 'neomake/neomake'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'psliwka/vim-smoothie'
Plug 'rbgrouleff/bclose.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'voldikss/vim-floaterm'
Plug 'wellle/targets.vim'

"fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

"TabNine
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

"Docker
Plug 'deoplete-plugins/deoplete-docker'
Plug 'ekalinin/dockerfile.vim'

"Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"Go
Plug 'deoplete-plugins/deoplete-go'
Plug 'fatih/vim-go'
Plug 'stamblerre/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

"Javascript
Plug 'pangloss/vim-javascript'

"Packer
Plug 'hashivim/vim-packer'

"Python
Plug 'davidhalter/jedi-vim'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'nvie/vim-flake8'

"Terraform
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
let g:terraform_fmt_on_save=1
let g:terraform_align=1

"Colors
Plug 'gruvbox-community/gruvbox'

call plug#end()

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Theme
colorscheme gruvbox
let g:airline_theme = 'gruvbox'
