" Settings start
set scrolloff=8
set number
set relativenumber
set termguicolors     " enable true colors support

set tabstop=2 softtabstop=4
set shiftwidth=2
set expandtab
set background=dark
set cursorline
set ai
set si
set completeopt=menu,menuone,noselect
set updatetime=100
syntax enable

set foldenable
set foldlevelstart=1
set foldnestmax=10
set foldmethod=indent
set foldcolumn=2

set ignorecase
set smartcase

" Settings end


" Plugins start
call plug#begin()
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'ayu-theme/ayu-vim'  
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'morhetz/gruvbox'
Plug 'overcache/NeoSolarized'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'folke/trouble.nvim'
Plug 'tpope/vim-commentary'
Plug 'lewis6991/gitsigns.nvim'
Plug 'karb94/neoscroll.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'frenzyexists/aquarium-vim', { 'branch': 'develop' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'sainnhe/gruvbox-material'
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'jreybert/vimagit'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'mattn/emmet-vim'
call plug#end()
" Plugins end
"
" Plugins setup start
lua << EOF
require('gitsigns').setup()
require('neoscroll').setup()
require('colorizer').setup()
require('trouble').setup()
require('lspsaga').init_lsp_saga()
EOF
" Plugins setup end


" Colors start
let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
"colorscheme PaperColor
colorscheme gruvbox-material
" Colors end

" Maps start
let mapleader = " "
nnoremap <leader>g :CHADopen<CR>
inoremap jk <Esc>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>

" move through grep list
nnoremap <C-k> :cnext<CR>
nnoremap <C-j> :cprev<CR>

" move through changeList using <alt + jjj
nnoremap <M-Left> g;
nnoremap <M-Right> g,

"move lines up/down (visually select line and move with Shift + j/k)
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"reload init.vim
nnoremap <leader><CR> :so ~/.config/nvim/init.vim

"Running auto linter
"? May be need to find lint on save?
nnoremap <leader>t mF:%!eslint_d --stdin --fix-to-stdout --stdin-filename %<CR>`F
vnoremap <leader>f :!eslint_d --stdin --fix-to-stdout<CR>gv

nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
" Maps end


