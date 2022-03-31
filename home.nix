{ pkgs, inputs, ... }:

{
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.users.gabe = {
    imports = [
      ./home/fish.nix
      ./home/firefox.nix
      ./home/newsboat.nix
      ./home/git.nix
      ./home/i3.nix
      ./home/kitty.nix
      ./home/nvim/nvim.nix
      ./home/rbw.nix
      ./home/starship.nix
      ./home/vscode.nix
      ./modules/meta.nix

      inputs.nix-colors.homeManagerModule
    ];

    colorscheme = inputs.nix-colors.colorSchemes.gruvbox-material-dark-medium;

    programs.home-manager.enable = true;

    home.username = "gabe";
    home.homeDirectory = "/home/gabe";
    home.packages = with pkgs; [
      # gui
      vlc
      mpv
      krita
      zathura
      xfce.thunar
      xournalpp 
      flameshot
      ungoogled-chromium

      # online chat
      discord

      # dev
      cargo
      lua
      tdesktop
      rustc
      gcc
      rustfmt
      ripgrep
      obsidian
      qbittorrent
      python38     
      fd
      # language servers
      nodePackages.typescript-language-server
      rust-analyzer
      nodePackages.eslint
      gopls
      pyright
      sqls
      rnix-lsp

      # cli
      feh
      bottom
      ffmpeg
      pulseaudio
      gnumake
      lm_sensors
      maim
      xclip
      protonvpn-cli

      # nix
      nixpkgs-fmt
    ];

    home.sessionVariables = {
      VISUAL = "nvim";
      EDITOR = "nvim";
    };

    home.stateVersion = "21.05";
  };
}
