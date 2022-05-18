{ pkgs, ... }:

let
github-copilot-vim = pkgs.vimUtils.buildVimPlugin rec {
    pname = "github-copilot-vim";
<<<<<<< HEAD
    version = "1.3.1";
=======
    version = "1.2.2";
>>>>>>> parent of dce21e8 (backup)
    src = pkgs.fetchgit {
      url = "https://github.com/github/copilot.vim";
      rev = "c01314840b94da0b9767b52f8a4bbc579214e509";
      hash = "sha256-gnFiuXpKF55cWxCXNXe3zqQaVmGoUV5aRBGIlyUUfIM=";
    };
  };
  in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
    coc = {
      enable = true;
    };

    plugins = with pkgs.vimPlugins; [
      #themes
      gruvbox

      #colorizer
      nvim-colorizer-lua

      #github-copilot-vim
      github-copilot-vim

      #auto-pairs
      auto-pairs

      #vim-closetag
      vim-closetag

      #rust.vim
      rust-vim

      #plenary
      plenary-nvim

      #nvim-tree
      vim-devicons
      nvim-tree-lua

      #indentLine
      indentLine

      #bufferline
      bufferline-nvim

      #devicons
      nvim-web-devicons

      #nerdcommenter
      nerdcommenter

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


    lua << EOF
      vim.defer_fn(function()
      vim.cmd[[
    luafile /home/gabe/.config/dotfiles/home/nvim/lua/treesitter.lua
    luafile /home/gabe/.config/dotfiles/home/nvim/lua/lsp.lua
    luafile /home/gabe/.config/dotfiles/home/nvim/lua/nvim-tree.lua
    luafile /home/gabe/.config/dotfiles/home/nvim/lua/colorizer.lua
      ]]
      end, 70)
    EOF

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
    set termguicolors
    colorscheme gruvbox

    lua << EOF
    require("bufferline").setup{}
    require("colorizer").setup{}
    EOF

    syntax on                   " syntax highlighting
    syntax enable
    "autocmd vimenter * ++nested colorscheme gruvbox

    nnoremap <SPACE> <Nop>

    " focus on nvim tree
    nnoremap <leader>e <cmd>NvimTreeFocus<cr>
    " close nvim tree
    nnoremap <leader>E <cmd>NvimTreeClose<cr>

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
  home.packages = with pkgs; [
      rnix-lsp
      #sumneko-lua-language-server
  ];

}

