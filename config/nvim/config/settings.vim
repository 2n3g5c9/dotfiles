" General configuration {{{
	" Enable syntax highlighting
	syntax on

	" Highlight current line
	set cursorline

	" Enable use of the mouse for all modes
	set mouse=a

	" Display relative numbers
	set number
	set relativenumber

	" Show unseeing characters
	set list
	set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<

	" Silence the error bells
	set noerrorbells

	" Record more lines in history
	set history=5000
"}}}

" Set up smarter search behaviour {{{
	set incsearch   " Lookahead as search pattern is specified
	set ignorecase  " Ignore case in all searches...
	set smartcase   " ...unless uppercase letters used
"}}}

" Text, tab and indent related configuration {{{
	" 1 tab == 4 spaces
	set shiftwidth=4
	set tabstop=4 softtabstop=4

	" Indent and wrap lines
	set autoindent
	set smartindent
	set wrap

	" Set rule at 80 columns
	set colorcolumn=80
	highlight ColorColumn ctermbg=0 guibg=lightgrey
"}}}

"Syntastic configuration {{{
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*

	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0
"}}}

" Color configuration {{{
	set termguicolors
	let g:gruvbox_contrast_dark = 'hard'
	colorscheme gruvbox
"}}}
