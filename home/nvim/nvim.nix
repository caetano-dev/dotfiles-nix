{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withNodeJs = true;
    withPython3 = true;
    withRuby = true;

    plugins = with pkgs.vimPlugins; [
      #themes
      #gruvbox

      #auto-pairs
      auto-pairs

      #vim-closetag
      vim-closetag

      #rust.vim
      rust-vim

      #plenary
      plenary-nvim

      #vim-devicons
      vim-devicons

      #indentLine
      indentLine

      #bufferline
      bufferline-nvim

      #devicons
      nvim-web-devicons

      #nerdcommenter
      nerdcommenter

      #coc.nvim
      coc-nvim


      #nvim-cmp
      nvim-cmp

      #nvim-treesitter
      #nvim-treesitter
      (nvim-treesitter.withPlugins (plugins: pkgs.tree-sitter.allGrammars))

      #tabline
      tabline-nvim

      # air line
      vim-airline
      vim-airline-clock
      vim-airline-themes

      #language server
      nvim-lspconfig
      nvim-compe

      # golang
      vim-go
      deoplete-go

      # telescope
      telescope-nvim
      vim-polyglot

      # nix language
      vim-nix

      # others
      vimade

    ];

    extraConfig = '' 

    luafile /home/gabe/.config/dotfiles/home/nvim/lua/treesitter.lua
    luafile /home/gabe/.config/dotfiles/home/nvim/lua/lsp.lua
    

    let mapleader=" "
    let g:tablineclosebutton=1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_theme="base16_gruvbox_dark_hard"

    set number                  " add line numbers
    set mouse=v                 " middle-click paste with
    set mouse=a                 " enable mouse click
    set hlsearch                " highlight search
    set smartcase               " automatically switch search to case-sensitive when search query contains an uppercase
    set showmatch               " show matching
    set tabstop=4               " number of columns occupied by a tab
    set expandtab               " converts tabs to white space
    set incsearch               " incremental search
    set incsearch               " incremental search that shows partial matches.
    set splitright              " open new split panes to right
    set splitbelow              " and below
    set ignorecase              " case insensitive/
    set cursorline              " highlight current cursorline
    set noswapfile              " disable creating swap file
    set autoindent              " indent a new line the same amount as the line just typed
    set nocompatible            " disable compatibility to old-time vi
    set shiftwidth=4            " width for autoindents
    set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
    set relativenumber          " relative line numbers
    set wildmode=longest,list   " get bash-like tab completions
    set clipboard=unnamedplus   " using system clipboard

    filetype plugin on
    filetype plugin indent on   " allow auto-indenting depending on file type

    " color schemes
    "set termguicolors

    lua << EOF
    require("bufferline").setup{}
    EOF

    syntax on                   " syntax highlighting
    syntax enable
    "autocmd vimenter * ++nested colorscheme gruvbox

    nnoremap <SPACE> <Nop>

    " open Telescope
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fw <cmd>Telescope live_grep<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
    nnoremap <leader>ff <cmd>Telescope find_files<cr>

    " save file with CTRL + S
    noremap <silent> <C-S>          :update<CR>
    vnoremap <silent> <C-S>         <C-C>:update<CR>
    inoremap <silent> <C-S>         <C-O>:update<CR>

    " move split panes to left/bottom/top/right
    nnoremap <A-h> <C-W>H
    nnoremap <A-j> <C-W>J
    nnoremap <A-k> <C-W>K
    nnoremap <A-l> <C-W>L

    " move between panes to left/bottom/top/right
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
    '';
  };
}