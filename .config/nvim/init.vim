syntax on

"" ------------------ plugins ------------------- {{{"
call plug#begin()

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'                             "better commenting

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'ThePrimeagen/vim-be-good'

Plug 'tweekmonster/startuptime.vim'

call plug#end()
"}}}

"" ------------------ general config ------------------- {{{"
filetype plugin indent on
set termguicolors                                                   " opaque background
set number                                                          " enables numbers to the left
set relativenumber                                                  " sets lines above and below to amount away from current line
set nohlsearch incsearch smartcase                                  " highlight text which searching
set clipboard+=unnamedplus                                          " use system clipboard by default
set hidden
set tabstop=4 softtabstop=4 shiftwidth=4 autoindent                 " tabs indents
set expandtab
set noeb                                                             " no error bells
set scrolloff=15                                                    " scrolls the hole page when at the 10 lines from the bott
set nowrap                                                          " no wrapping when cursor gets to the end of the page
set noswapfile nobackup undofile undodir=~/.cache/nvim/undodir      " no backup file and creates an undodir for all undos
set completeopt-=preview                                            " for YCM doesn't really do anything
set splitright splitbelow                                           " open split to right and bottom
set noshowmode                                                      " doesn't show current mode and last commandk
set backspace=indent,eol,start                                      " sensible backspace
set encoding=utf-8                                                  " for vim, nvim has it by default
set title
set mouse=a
set foldmethod=marker
set nocursorline
set nocursorcolumn
set ignorecase

set spelllang=en_us

set nowritebackup
set updatetime=50
set cmdheight=1

set timeoutlen=1000
set ttimeoutlen=0
set lazyredraw

set cot=menuone,noinsert,noselect shm+=c
set wildignore+=*/tmp/*,*.so,*.swp,*zip
"}}}

" colorscheme {{{
colorscheme tokyonight
" }}}

" ------------------ keybinds/commands ------------------- " {{{

let mapleader = " "

autocmd BufNewFile,BufRead *.txt *.md set wrap spell
autocmd BufNewFile,BufRead *.md set colorcolumn=80

inoremap {<CR> {<CR>}<Esc>O
inoremap {} {}

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"movement keybinds
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"undotree
nnoremap <leader>u :UndotreeShow<CR>

"sizing
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>= :vertical resize +5<CR>

"tabs
nnoremap <leader>n :tabn<Enter>
nnoremap <leader>p :tabp<Enter>
map <leader>tn :tabnew<space>
map <leader>tm :tabmove<space>
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>

"splitting
nnoremap Th :vs <bar> :vertical resize 50 <bar> :term<CR>
nnoremap Tv :split <bar> :resize -5 <bar> :term<CR>

"moveing lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

"Ctrl+backspace
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

"}}}

"lsp config {{{
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_matching_smart_case = 1
let g:completion_trigger_on_delete = 1

:lua << EOF
    local nvim_lsp = require('lspconfig')
    local on_attach = function(_, bufnr)
        require('completion').on_attach()
    end
    local servers = {"clangd", "vimls", "pyright", "cmake", "zeta_note"}
    for _, lsp in ipairs(servers) do
        nvim_lsp[lsp].setup {
            on_attach = on_attach,
        }
    end
EOF

:lua << EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Enable underline, use default values
        underline = true,
        -- Enable virtual text, override spacing to 4
        virtual_text = {
            spacing = 4,
            prefix = ' ',
        },
        update_in_insert=true,
        signs = function(bufnr, client_id)
        local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
            -- No buffer local variable set, so just enable by default
            if not ok then
                return true
            end

            return result
        end,
    }
)
EOF
"}}}

" Notes {{{
command! -nargs=1 Ngrep lvimgrep "<args>" $HOME/Notes/**/*.txt $HOME/Notes/**/*.md
nnoremap <leader>[ :Ngrep 
nnoremap <C-n> :lnext<CR>z.
nnoremap <C-p> :lpreviou<CR>z.
"}}}

"{{{

:lua << EOF
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

EOF

"}}}
