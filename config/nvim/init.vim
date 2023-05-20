set nocompatible
set showcmd
set exrc
set secure
set showmode
set mouse+=a
set number
set wrap
set history=500
set so=7
set wildmenu
set wildmode=longest,list
set ruler
set cmdheight=1
set ignorecase
set smartcase
set hlsearch
set lazyredraw
set showmatch
set mat=2
set smarttab
set laststatus=2
set clipboard=unnamedplus
set autoread
set completeopt
set hidden
set completeopt=menu,preview
au FocusGained,Bufenter * checktime
set termguicolors

map <space> /
map <C-space> ?

filetype plugin indent on

augroup project
	autocmd!
	autocmd BufRead,BufNewFile *.h.*.c set filetype=c.doxygen
augroup END

syntax on

call plug#begin()
 Plug 'ervandew/supertab'
 Plug 'jiangmiao/auto-pairs'
 Plug 'junegunn/vim-easy-align'
 Plug 'previm/previm'
 Plug 'junegunn/fzf'
 Plug 'easymotion/vim-easymotion'
 Plug 'osyo-manga/vim-anzu'
 Plug 'matze/vim-move'
 Plug 'andweeb/presence.nvim'
 Plug 'anott03/nvim-lspinstall'
 Plug 'jacoborus/tender.vim'
 Plug 'tpope/vim-surround'
 Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
 Plug 'lukas-reineke/indent-blankline.nvim'
 Plug 'nvim-treesitter/nvim-treesitter'
 Plug 'kevinhwang91/nvim-hlslens'
 Plug 'NvChad/nvim-colorizer.lua'
 Plug 'mawkler/modicator.nvim'
 Plug 'yamatsum/nvim-cursorline'
 Plug 'stevearc/gkeep.nvim', { 'do': ':UpdateRemotePlugins' }
 Plug 'echasnovski/mini.nvim', { 'branch': 'stable' }
call plug#end()

colorscheme tender

lua << EOF

vim.opt.list = true
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
    space_char_blankline = " ",

}

require('hlslens').setup()

local kopts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)

require("colorizer").attach_to_buffer(0, { mode = "background", css = true})

require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    timeout = 1000,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}

EOF
