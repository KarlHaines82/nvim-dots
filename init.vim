" Install vim-plug if not found
if empty(glob(stdpath('config').'/autoload/plug.vim'))
    silent !curl -fLo !stdpath('config')/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) | PlugInstall --sync | source $MYVIMRC | endif
endif

" Plugins will be downloaded under the specified directory.
call plug#begin(stdpath('config').'/plugged')
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'sheerun/vim-polyglot'
  Plug 'gko/vim-coloresque'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'sharkdp/fd'
  Plug 'BurntSushi/ripgrep'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'adelarsq/vim-devicons-emoji'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'Shougo/deoplete.nvim'
  Plug 'preservim/nerdtree'
  Plug 'deoplete-plugins/deoplete-jedi'
  Plug 'deoplete-plugins/deoplete-terminal'
  Plug 'neovim/nvim-lspconfig'
  Plug 'deoplete-plugins/deoplete-zsh'
  Plug 'deoplete-plugins/deoplete-lsp'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.0'}
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'nvim-telescope/telescope-file-browser.nvim'
  Plug 'nvim-telescope/telescope-project.nvim'
  Plug 'nvim-telescope/telescope-symbols.nvim'
  Plug 'kkharji/sqlite.lua'
  Plug 'nvim-telescope/telescope-frecency.nvim'
  Plug 'mhinz/vim-startify'
  Plug 'guns/xterm-color-table.vim'
  Plug 'chrisbra/vim-show-whitespace'
  Plug 'dracula/vim', { 'name': 'dracula' }
call plug#end()

if has('win32')
  "let g:python_host_prog = '~/Progra~1/Python311/python.exe'
  let g:python3_host_prog = 'python.exe'
  luafile ~/AppData/Local/nvim/tscopeconfig.lua
else
  "let g:python_host_prog = '/usr/bin/python'
  let g:python3_host_prog = '/usr/bin/python3'
  luafile ~/.config/nvim/tscopeconfig.lua
endif

let g:deoplete#enable_at_startup = 1
let g:deoplete#lsp#handler_enabled = v:true
let g:deoplete#lsp#use_icons_for_candidates = v:true
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['tabline', 'fzf']
"let g:airline_theme = 'koehler' 
let NERDTreeShowHidden = 1
call deoplete#custom#var('terminal', 'require_same_tab', v:false)


" neovide
if exists("g:neovide")
    " Put anything you want to happen only in Neovide here
    set guifont=FiraCode_NF,Twemoji:h9
    let g:neovide_cursor_animation_length = 0
    let g:neovide_scale_factor=1.0
    function! ChangeScaleFactor(delta)
        let g:neovide_scale_factor = g:neovide_scale_factor * a:delta
    endfunction
    nnoremap <expr><C-=> ChangeScaleFactor(1.25)
    nnoremap <expr><C--> ChangeScaleFactor(1/1.25)
endif

" key bindings
let g:mapleader = ','
nnoremap <leader>qq <cmd>NERDTreeToggle<cr>
nnoremap <leader>gg :source $MYVIMRC<cr>
nnoremap <leader>fq <cmd>Telescope file_browser<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr> 
nnoremap <leader>fg <cmd>Telescope live_grep<cr> 
nnoremap <leader>fb <cmd>Telescope buffers<cr> 
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" standard vim config
colorscheme dracula
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a
